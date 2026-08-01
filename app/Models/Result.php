<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @property Student $student
 * @property int student_id
 * @property int written
 * @property int practical
 * @property int viva
 */
class Result extends Model
{


    protected $fillable = [
        'student_id',
        'written',
        'practical',
        'viva',
        'certificate',
    ];

    protected $casts = [
        'student_id' => 'int',
        'written' => 'int',
        'practical' => 'int',
        'viva' => 'int',
    ];

    public function student()
    {
        return $this->belongsTo(Student::class);
    }


    public function gpa()
    {
        $mark = $this->written + $this->practical + $this->viva;
        switch ($mark) {
            case $mark >= 80:
                return 'A+';
            case $mark >= 70:
                return 'A';
            case $mark >= 60:
                return 'A-';
            case $mark >= 50:
                return 'B';
            case $mark >= 40:
                return 'C';
            case $mark >= 0:
                return 'F';
            default:
                return '';
        }
    }

}
