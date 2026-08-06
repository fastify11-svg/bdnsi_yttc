<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class YoutubeVideo extends Model
{
    use \App\Traits\ClearsFrontendCache;

    protected $fillable = [
        'title',
        'image',
        'description',
        'link',
        'status',
        'video_id',
    ];




}
