<?php

namespace App\Livewire\Payment;

use App\Enums\TxnStatus;
use Illuminate\Support\Facades\Http;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Locked;
use Livewire\Component;

// #[Layout('frontend::payment.layout')]
class BasePaymentComponent extends Component
{
    #[Locked]
    public bool $isLoaded = false;

    #[Locked]
    public bool $isSuccess = false;

    #[Locked]
    public bool $isCancelled = false;

    #[Locked]
    public bool $isRedirection = false;

    #[Locked]
    public int $step = 1;

    #[Locked]
    public $transaction;

    #[Locked]
    public float $payAmount = 0;

    public string $account_number = '';

    public string $account_password = '';

    public function checkPaymentStatus()
    {
        if ($this->transaction->status == TxnStatus::Success) {
            $this->isSuccess = true;
        }
    }

    protected function isApp()
    {
        return isFromApp();
    }

    public function loadPay()
    {
        $this->isLoaded = true;
    }

    protected function resetPayment()
    {
        $this->isSuccess = false;
        $this->isRedirection = false;
        $this->step = 1;

        // Reset account number and password
        $this->reset(['account_number', 'account_password']);
    }

    public function cancelPayment()
    {
        $this->isCancelled = true;
        // Reset payment
        $this->resetPayment();
    }

    protected function sendRequestToIpn($transaction, $url)
    {
        // Send request to IPN

        // Create signature
        $signature = hash_hmac('sha256', $transaction->tnx.$transaction->final_amount, $this->transaction->user?->merchant?->secret_key);

        try {
            Http::withOptions([
                'verify' => false,
            ])->get($url, [
                'status' => 'success',
                'signature' => $signature,
                'data' => [
                    'amount' => $transaction->amount,
                    'charge' => $transaction->charge,
                    'total_amount' => $transaction->final_amount,
                    'transaction_id' => $transaction->tnx,
                    'currency' => $transaction->pay_currency,
                    'customer_name' => data_get($transaction->manual_field_data, 'customer_name'),
                    'customer_email' => data_get($transaction->manual_field_data, 'customer_email'),
                ],
            ]);
        } catch (\Throwable $throwable) {
        }
    }

    public function render()
    {
        return view('frontend::payment.checkout');
    }
}
