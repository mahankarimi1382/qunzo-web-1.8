<?php

namespace App\Livewire\Payment;

use App\Enums\TxnStatus;
use App\Enums\TxnType;
use App\Models\LevelReferral;
use App\Models\Transaction;
use App\Models\User;
use App\Models\UserWallet;
use App\Traits\NotifyTrait;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Locked;

#[Layout('frontend::payment.layout')]
class Payment extends BasePaymentComponent
{
    use NotifyTrait;

    #[Locked]
    public $redirectUrl = null;

    public function mount($transaction_id)
    {
        $this->transaction = Transaction::with('user.merchant')->where('tnx', $transaction_id)->firstOrFail();
        $this->checkPaymentStatus();
        $this->payAmount = $this->transaction->final_amount;

        $appRedirectUrl = route('payment.success', ['reftrn' => $this->transaction->tnx]);

        $this->redirectUrl = $this->isApp() ? $appRedirectUrl : $this->transaction->callback_url;
    }

    public function nextStep()
    {
        $this->validate([
            'account_number' => 'required|exists:users',
        ], [
            'account_number.required' => 'UID is required!',
            'account_number.exists' => 'UID is invalid!',
        ]);

        $this->step++;
    }

    public function payNow()
    {
        $this->validate([
            'account_password' => 'required|max:8',
        ], [
            'account_password.required' => 'Password is required!',
            'account_password.max' => 'Password must be 8 characters!',
        ]);

        $siteCurrency = setting('site_currency');
        $payCurrency = $this->transaction->pay_currency;
        $user = User::where('account_number', $this->account_number)->first();
        $existsWalletOnUser = UserWallet::where('user_id', $user->id)->whereRelation('currency', 'code', $payCurrency)->first();

        // Check password is invalid return error
        if (! Hash::check($this->account_password, $user->password)) {
            $this->addError('account_password', 'Password is invalid!');
            $this->reset('account_password');

            return;
        }

        // Checking payment currency wallet exists on user wallet
        if (! $existsWalletOnUser && $siteCurrency != $payCurrency) {
            $this->addError('wallet', 'Payment currency not found in this account!');
            // Reset payment
            $this->resetPayment();

            return;
        }

        // Check balance
        if (! $this->hasSufficientBalance($user, $payCurrency)) {
            // Add error message
            $this->addError('wallet', 'Insufficient funds!');
            // Reset payment
            $this->resetPayment();

            return;
        }

        // Process payment
        try {

            DB::beginTransaction();

            // Update user balance
            if ($siteCurrency === $payCurrency) {
                $user->decrement('balance', $this->payAmount);
            } else {
                $existsWalletOnUser->decrement('balance', $this->payAmount);
            }

            // Create transaction for payment user
            Transaction::create([
                'user_id' => $user->id,
                'description' => $this->transaction->type == TxnType::Invoice ? 'Invoice Payment #' . $this->transaction->invoice->number : 'Make Payment Via Gateway',
                'type' => TxnType::Payment,
                'invoice_id' => $this->transaction->invoice_id,
                'amount' => $this->transaction->amount,
                'pay_currency' => $payCurrency,
                'wallet_type' => $siteCurrency === $payCurrency ? 'default' : $existsWalletOnUser->id,
                'charge' => $this->transaction->charge,
                'final_amount' => $this->payAmount,
                'method' => 'Gateway',
                'status' => TxnStatus::Success,
            ]);

            // Create transaction for receiver user
            Transaction::create([
                'user_id' => $this->transaction->user_id,
                'description' => $this->transaction->type == TxnType::Invoice ? 'Invoice Payment Received #' . $this->transaction->invoice->number : 'Payment Received Via Gateway',
                'from_user_id' => $user->id,
                'type' => $this->transaction->user->merchant === null ? TxnType::ReceiveMoney : TxnType::Payment,
                'invoice_id' => $this->transaction->invoice_id,
                'amount' => $this->transaction->amount,
                'pay_currency' => $payCurrency,
                'wallet_type' => $siteCurrency === $payCurrency ? 'default' : $existsWalletOnUser->id,
                'charge' => $this->transaction->charge,
                'final_amount' => $this->payAmount,
                'method' => 'Gateway',
                'status' => TxnStatus::Success,
            ]);

            // Update receiver user balance
            if ($siteCurrency === $payCurrency) {
                $this->transaction->user->increment('balance', $this->transaction->amount);
            } else {
                $this->transaction->user->wallets()->where('currency_id', $existsWalletOnUser->currency_id)->increment('balance', $this->transaction->amount);
            }

            // Process payment
            $this->processPayment($user, $existsWalletOnUser);
            DB::commit();
        } catch (\Exception $exception) {
            DB::rollBack();
            $this->addError('wallet', 'Payment failed, please try again!');
            Log::error('Payment gateway error: ' . $exception->getMessage());
            $this->resetPayment();
        }
    }

    private function hasSufficientBalance(User $user, $payCurrency): bool
    {
        $existsWalletOnUser = UserWallet::where('user_id', $user->id)
            ->whereRelation('currency', 'code', $payCurrency)
            ->first();
        $siteCurrency = setting('site_currency');

        $isSameCurrency = $siteCurrency === $payCurrency;
        $isDifferentCurrency = $siteCurrency !== $payCurrency;

        return ! ($isSameCurrency && $user->balance < $this->payAmount) && ! ($isDifferentCurrency && $existsWalletOnUser?->balance < $this->payAmount);
    }

    private function processPayment(User $user, $wallet): void
    {
        $merchant = $this->transaction->user->merchant;

        // Update invoice status
        if ($this->transaction->type == TxnType::Invoice) {
            $this->transaction->invoice->update([
                'is_paid' => true,
                'from_user_id' => $user->id,
                'from_model' => 'User',
            ]);
        }

        // Referral Bonus
        $this->processReferral($user, $wallet);

        // Update transaction status
        $this->transaction->update([
            'status' => TxnStatus::Success,
        ]);

        // Send request to IPN
        if ($ipnUrl = data_get($this->transaction->manual_field_data, 'ipn_url')) {
            $this->sendRequestToIpn($this->transaction, $ipnUrl);
        }

        // Send notification
        $this->sendNotification($merchant, $user);

        $this->isSuccess = true;
        $this->isRedirection = $this->redirectUrl != null;
    }

    private function processReferral($user, $wallet): void
    {
        if ($this->transaction->type == TxnType::Invoice && setting('invoice_pay', 'referral_level')) {
            $level = LevelReferral::where('type', 'invoice_pay')->max('the_order') + 1;
            creditCurrencyWiseReferralBonus($user, 'invoice_pay', $this->transaction->amount, $level, 1, null, $wallet);
        } elseif ($this->transaction->type == TxnType::Payment && setting('payment', 'referral_level')) {
            $level = LevelReferral::where('type', 'payment')->max('the_order') + 1;
            creditCurrencyWiseReferralBonus($user, 'payment', $this->transaction->amount, $level, 1, null, $wallet);
        }
    }

    private function sendNotification($merchant, $user)
    {
        if ($this->transaction->type == TxnType::Payment) {
            $shortcodes = [
                '[[merchant_name]]' => $merchant->full_name,
                '[[amount]]' => formatAmount($this->transaction->amount, $this->transaction->currency),
                '[[charge]]' => formatAmount($this->transaction->charge, $this->transaction->currency),
                '[[total_amount]]' => formatAmount($this->transaction->final_amount, $this->transaction->currency),
                '[[wallet]]' => data_get($this->transaction->userWallet, 'currency.code', setting('site_currency', 'global')),
                '[[gateway]]' => $this->transaction->method,
                '[[payment_at]]' => $this->transaction->created_at,
                '[[payment_id]]' => $this->transaction->tnx,
                '[[user_name]]' => $user->full_name,
                '[[user_account_no]]' => $user->account_number,
                '[[site_title]]' => setting('site_title', 'global'),
                '[[currency]]' => data_get($this->transaction->userWallet, 'currency.code', setting('site_currency', 'global')),
            ];

            $this->sendNotify($merchant->email, 'merchant_payment', 'Merchant', $shortcodes, $merchant->phone, $merchant->id, route('merchant.transactions'));
        } elseif ($this->transaction->type == TxnType::Invoice) {
            $shortcodes = [
                '[[full_name]]' => $user->full_name,
                '[[invoice_number]]' => $this->transaction->invoice->number,
                '[[amount]]' => formatAmount($this->transaction->amount, $this->transaction->currency),
                '[[charge]]' => formatAmount($this->transaction->charge, $this->transaction->currency),
                '[[total_amount]]' => formatAmount($this->transaction->final_amount, $this->transaction->currency),
                '[[invoice_link]]' => '#',
                '[[currency]]' => data_get($this->transaction->userWallet, 'currency.code', setting('site_currency', 'global')),
                '[[site_title]]' => setting('site_title', 'global'),
            ];

            $this->sendNotify($user->email, 'user_invoice_payment', 'User', $shortcodes, $user->phone, $user->id, '#');
        }
    }
}
