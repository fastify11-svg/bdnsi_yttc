<?php

namespace App\Observers;

use App\Models\Student;

class StudentObserver
{
    /**
     * Handle the Student "created" event.
     *
     * @param  \App\Models\Student  $student
     * @return void
     */
    public function created(Student $student)
    {
        //
    }

    public function updated(Student $student)
    {
        // Check if status was changed to Approved
        if ($student->isDirty('status') && $student->status == \App\Enums\StudentStatus::Approved->value) {
            $student->loadMissing('subject');
            $courseName = $student->subject->name ?? 'Course';
            $message = "Dear {$student->name}, your registration for {$courseName} has been approved successfully. Your Roll No is {$student->roll}. - " . config('site.setting.name', 'BDNSI');
            
            \App\Jobs\SendStudentSmsJob::dispatch($student->phone, $message);
        }
    }

    /**
     * Handle the Student "deleted" event.
     *
     * @param  \App\Models\Student  $student
     * @return void
     */
    public function deleted(Student $student)
    {
        //
    }

    /**
     * Handle the Student "restored" event.
     *
     * @param  \App\Models\Student  $student
     * @return void
     */
    public function restored(Student $student)
    {
        //
    }

    /**
     * Handle the Student "force deleted" event.
     *
     * @param  \App\Models\Student  $student
     * @return void
     */
    public function forceDeleted(Student $student)
    {
        //
    }
}
