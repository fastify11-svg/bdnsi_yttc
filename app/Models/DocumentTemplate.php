<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DocumentTemplate extends Model
{
    protected $fillable = [
        'name', 'type', 'background_image', 'width', 'height', 'status', 'is_builtin', 'blade_view'
    ];

    public function fields()
    {
        return $this->hasMany(DocumentField::class);
    }
}
