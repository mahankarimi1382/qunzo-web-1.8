<?php

namespace App\Enums;

enum TxnType: string
{
    case Credit = 'Credit';
    case Debit = 'Debit';
    case Deposit = 'Deposit';
    case ManualDeposit = 'Manual Deposit';
    case Withdraw = 'Withdraw';
    case SendMoney = 'Send Money';
    case Referral = 'Referral';
    case WithdrawAuto = 'Withdraw Auto';
    case ReceiveMoney = 'Receive Money';
    case Refund = 'Refund';
    case Exchange = 'Exchange';
    case SignupBonus = 'Signup Bonus';
    case Payment = 'Payment';
    case GiftRedeemed = 'Gift Redeemed';
    case GiftCard = 'Gift Card';
    case CashIn = 'Cash In';
    case CashOut = 'Cash Out';
    case CashReceived = 'Cash Received';
    case RequestMoney = 'Request Money';
    case Invoice = 'Invoice';
    case CashoutCommission = 'Cashout Commission';
    case CashInCommission = 'Cash In Commission';
}
