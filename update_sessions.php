<?php
require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

use App\Models\Session;
use App\Models\Student;
use Carbon\Carbon;

$sessions = Session::all();
$updatedCount = 0;

$months = [
    'jan' => 1, 'feb' => 2, 'mar' => 3, 'apr' => 4, 'may' => 5, 'jun' => 6,
    'jul' => 7, 'aug' => 8, 'sep' => 9, 'oct' => 10, 'nov' => 11, 'dec' => 12
];

foreach ($sessions as $session) {
    $name = strtolower($session->name);
    $duration = null;
    $end_date = null;

    // Pattern: Jan 2023 To Jun 2024 OR Jan to Jun 2024
    if (preg_match('/(jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec)[a-z]*\s*(?:(\d{4})\s*)?(?:to|-)\s*(jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec)[a-z]*\s*(\d{4})/i', $name, $matches)) {
        $start_m = $months[$matches[1]];
        $start_y = $matches[2] ? (int)$matches[2] : (int)$matches[4];
        $end_m = $months[$matches[3]];
        $end_y = (int)$matches[4];

        $duration = (($end_y - $start_y) * 12) + ($end_m - $start_m) + 1;
        $end_date = Carbon::create($end_y, $end_m, 1)->endOfMonth();
    } 
    // Pattern: 2024 - 2025
    elseif (preg_match('/^(\d{4})\s*(?:to|-)\s*(\d{4})$/i', $name, $matches)) {
        $start_y = (int)$matches[1];
        $end_y = (int)$matches[2];
        $duration = ($end_y - $start_y) * 12; 
        if ($duration == 0) $duration = 12; // e.g. "2024 - 2024" usually means 1 year
        $end_date = Carbon::create($end_y, 12, 31);
    }
    // Pattern: 2024
    elseif (preg_match('/^(\d{4})$/i', $name, $matches)) {
        $duration = 12;
        $end_date = Carbon::create((int)$matches[1], 12, 31);
    }

    // Adjust specific durations to closest allowed values if needed, but let's trust the calculation
    if ($duration && $end_date) {
        // Set exam_date to 20th of the end month
        $exam_date = Carbon::create($end_date->year, $end_date->month, 20);
        
        // Result published date is 19th of the next month
        $result_date = $exam_date->copy()->addMonth()->setDay(19);

        // Update the session
        $session->update([
            'duration' => $duration,
            'exam_date' => $exam_date,
            'result_published_date' => $result_date,
        ]);

        // Sync students
        Student::where('session_id', $session->id)->update([
            'course_type' => $session->course_type,
            'course_duration' => $session->course_duration_string,
            'exam_date' => $exam_date,
            'result_publised' => $result_date,
        ]);
        
        $updatedCount++;
        echo "Updated Session ID {$session->id} ({$session->name}): $duration months, Exam: {$exam_date->toDateString()}\n";
    } else {
        echo "Could not parse: {$session->name}\n";
    }
}

echo "Successfully updated $updatedCount sessions.\n";
