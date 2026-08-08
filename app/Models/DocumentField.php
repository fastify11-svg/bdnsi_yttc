<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DocumentField extends Model
{
    protected $fillable = [
        'document_template_id', 'variable_key', 'position_x', 'position_y',
        'font_size', 'font_family', 'font_weight', 'color', 'text_align',
        'width', 'height'
    ];

    public function template()
    {
        return $this->belongsTo(DocumentTemplate::class, 'document_template_id');
    }
}
