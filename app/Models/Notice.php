<?php

namespace App\Models;

use App\Casts\ImageField;
use App\Traits\DeletesImage;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Notice extends Model
{
    use DeletesImage, \App\Traits\ClearsFrontendCache;

    protected $fillable=[
            'details',
            'image',
            'bn_details',
            'ar_details',
    ];

     protected $casts=[
         'image' => ImageField::class.':avatar,images/avatar.png',
     ];
}
