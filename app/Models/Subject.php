<?php

namespace App\Models;

use App\Enums\CourseType;
use App\Lib\Image;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Subject extends Model
{


    protected $fillable = [
        'name',
        'code',
        'photo',
        'duration',
        'rate',
        'education_qualification',
        'course_details',
        'type',
    ];


    protected $casts = [
        'type' => CourseType::class,
    ];

    public function getPhotoAttribute($photo)
    {
        if (isset($photo)) {
            return Image::url($photo);
        } else {
            return asset('images/no-image.png');
        }
    }

}
