<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FooterPartnerLogo extends Model
{
    use HasFactory;
    protected $fillable = ['title', 'image_path', 'url', 'sort_order', 'is_active'];
}
