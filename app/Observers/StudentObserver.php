<?php

namespace App\Observers;

use App\Enums\StudentStatus;
use App\Jobs\SendStudentSmsJob;
use App\Models\Student;

class StudentObserver
{
    /**
     * Handle the Student "created" event.
     *
     * @return void
     */
    public function created(Student $student)
    {
        //
    }

    public function updated(Student $student)
    {
        // Check if status was changed to Approved
        $statusValue = is_object($student->status) ? $student->status->value : $student->status;
        if ($student->isDirty('status') && $statusValue == StudentStatus::Approved) {
            $student->loadMissing('subject');
            $courseName = $student->subject->name ?? 'Course';
            $message = "Dear {$student->name}, your registration for {$courseName} has been approved successfully. Your Roll No is {$student->roll}. - ".config('site.setting.name', 'BDNSI');

            SendStudentSmsJob::dispatch($student->phone, $message);
        }
    }

    /**
     * Handle the Student "deleted" event.
     *
     * @return void
     */
    public function deleted(Student $student)
    {
        //
    }

    /**
     * Handle the Student "restored" event.
     *
     * @return void
     */
    public function restored(Student $student)
    {
        //
    }

    /**
     * Handle the Student "force deleted" event.
     *
     * @return void
     */
    public function forceDeleted(Student $student)
    {
        //
    }
}
