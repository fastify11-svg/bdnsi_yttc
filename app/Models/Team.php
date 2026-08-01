<?php

namespace App\Models;

use App\Casts\ImageField;
use App\Traits\DeletesImage;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Team extends Model
{
    use DeletesImage;

    protected $fillable = [
        'name',
        'designation',
        'image',
        'description',
        'status',
        
        'email',
        'phone',
        'facebook_link',
        'twitter_link',
        'linkedin_link',
        'order_index',

        'bn_name',
        'ar_name',
        'bn_designation',
        'ar_designation',
        'bn_description',
        'ar_description',
    ];

    protected $casts = [
        'image' => ImageField::class.':team,images',
    ];


}
