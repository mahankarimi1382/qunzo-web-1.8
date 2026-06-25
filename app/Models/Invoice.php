<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Invoice extends Model
{
    protected $guarded = ['id'];

    public function transaction(): HasOne
    {
        return $this->hasOne(Transaction::class, 'invoice_id', 'id');
    }

    public function wallet(): BelongsTo
    {
        return $this->belongsTo(Currency::class, 'currency', 'code');
    }

    protected function casts(): array
    {
        return [
            'items' => 'json',
            'issue_date' => 'date',
            'is_published' => 'boolean',
            'is_paid' => 'boolean',
        ];
    }

    protected static function boot()
    {
        parent::boot();
        static::creating(function ($invoice) {
            $invoice->number = 'INV-'.date('Y').time();
        });
    }
}
