<?php

namespace App\Models;

use App\Enums\TxnStatus;
use App\Enums\TxnType;
use Illuminate\Database\Eloquent\Model;

class SandboxTransaction extends Model
{
    protected $guarded = ['id'];

    protected function casts(): array
    {
        return [
            'type' => TxnType::class,
            'status' => TxnStatus::class,
            'amount' => 'double',
            'manual_field_data' => 'json',
        ];
    }

    public function user()
    {
        return $this->belongsTo(User::class)->withDefault();
    }
}
