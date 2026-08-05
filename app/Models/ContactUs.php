<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ContactUs extends Model
{
    use HasFactory;

    protected $fillable=[
        'name',
        'email',
        'phone',
        'message' ,
        'is_seen' ,
    ];

    protected static function booted()
    {
        static::saved(function ($model) {
            \Illuminate\Support\Facades\Cache::forget('unread_inquiries');
        });

        static::deleted(function ($model) {
            \Illuminate\Support\Facades\Cache::forget('unread_inquiries');
        });
    }
}
