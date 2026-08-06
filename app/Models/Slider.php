<?php

namespace App\Models;

use App\Lib\Image;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Slider extends Model
{
    use \App\Traits\ClearsFrontendCache;


    protected $fillable = [
        'title',
        'subtitle',
        'photo',
        'type',
        'button_text',
        'button_link',
        'status',
        'order_index',
    ];

    public function getPhotoAttribute($value){
        if (isset($value)){
            return Image::url($value);
        }else{
            return  asset('images/no-image.png');
        }
    }


}
