<?php

namespace App\Models;

use App\Scopes\CenterScope;
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
    protected static function booted()
    {
        static::addGlobalScope(new CenterScope);

        static::saving(function ($result) {
            $total = (int) $result->written + (int) $result->practical + (int) $result->viva;
            if ($total > 0) {
                $student = $result->student ?? Student::find($result->student_id);
                if ($student) {
                    $courseType = $student->course_type;
                    $typeStr = is_object($courseType) ? ($courseType->value ?? $courseType->description) : $courseType;

                    $limit = 100;
                    if ($typeStr == 0 || $typeStr === '0' || $typeStr === 'Regular') {
                        $limit = 100;
                    } elseif ($typeStr == 1 || $typeStr === '1' || $typeStr === 'Short_Course' || $typeStr === 'Short Course') {
                        $limit = 1200;
                    } elseif ($typeStr == 2 || $typeStr === '2' || $typeStr === 'Diploma') {
                        $limit = 4800;
                    }

                    if ($total > $limit) {
                        throw new \Exception("Total marks ($total) exceeds the maximum limit ($limit) for this course.");
                    }
                }

                $new_written = (int) round($total * 0.5);
                $new_practical = (int) round($total * 0.3);
                $new_viva = $total - $new_written - $new_practical;

                $result->written = $new_written;
                $result->practical = $new_practical;
                $result->viva = $new_viva;
            }
        });
    }

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
