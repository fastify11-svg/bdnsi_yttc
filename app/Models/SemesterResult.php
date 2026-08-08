<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SemesterResult extends Model
{
    use HasFactory;

    protected $fillable = [
        'student_id',
        'semester_name',
        'written',
        'practical',
        'viva',
        'cgpa',
        'grade',
    ];

    public function student()
    {
        return $this->belongsTo(Student::class);
    }
}
