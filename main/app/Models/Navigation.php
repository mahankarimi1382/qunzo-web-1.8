<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Navigation extends Model
{
    use HasFactory;

    protected $guarded = [];

    protected function casts()
    {
        return [
            'type' => 'json',
        ];
    }

    public function page()
    {
        return $this->belongsTo(Page::class)->withDefault();
    }

    protected function tname(): Attribute
    {
        return Attribute::make(get: function () {
            if ($this->translate != null) {
                $jsonData = json_decode($this->translate, true);
            }

            return $jsonData[session()->get('locale') ?? config('app.locale')] ?? $this->name;
        });
    }

    public function getTypeNameAttribute()
    {
        return collect($this->type)->map(function ($type) {
            return ucwords(str($type)->replace('_', ' '));
        })->implode(',');
    }
}
