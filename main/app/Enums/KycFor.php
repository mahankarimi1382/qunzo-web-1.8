<?php

namespace App\Enums;

enum KycFor: string
{
    case User = 'user';
    case Agent = 'agent';
    case Merchant = 'merchant';
}
