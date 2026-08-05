<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FooterPartnerLogo extends Model
{
    use HasFactory;
    protected $fillable = ['title', 'image_path', 'url', 'sort_order', 'is_active'];

    protected static function booted()
    {
        static::saved(function ($model) {
            \Illuminate\Support\Facades\Cache::forget('footer_logos');
        });

        static::deleted(function ($model) {
            \Illuminate\Support\Facades\Cache::forget('footer_logos');
        });
    }
}
