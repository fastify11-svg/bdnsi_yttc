<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Session extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'duration',
        'exam_date',
        'result_published_date',
        'status'
    ];

    protected $appends = ['course_duration_string'];

    protected $casts = [
        'duration' => 'int'
    ];

    public function getCourseTypeAttribute()
    {
        $duration = $this->duration;
        if (!$duration) {
            return \App\Enums\CourseType::Regular;
        }

        if ($duration >= 1 && $duration <= 3) {
            return \App\Enums\CourseType::Regular;
        } elseif ($duration > 3 && $duration <= 24) {
            return \App\Enums\CourseType::Short_Course;
        } elseif ($duration > 24 && $duration <= 48) {
            return \App\Enums\CourseType::Diploma;
        }

        return \App\Enums\CourseType::Regular; // fallback
    }

    public function getCourseDurationStringAttribute()
    {
        $duration = $this->duration;
        if (!$duration) {
            return '';
        }

        if ($duration == 1) return 'One Month';
        if ($duration == 2) return 'Two Months';
        if ($duration == 3) return 'Three Months';
        if ($duration == 6) return 'Six Months';
        if ($duration == 12) return 'One Year';
        if ($duration == 18) return 'One Year Six Months';
        if ($duration == 24) return 'Two Years';
        if ($duration == 36) return 'Three Years';
        if ($duration == 48) return 'Four Years';

        return $duration . ' Months';
    }
}
