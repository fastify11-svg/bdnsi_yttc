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
    'jan' => 1, 'january' => 1,
    'feb' => 2, 'february' => 2,
    'mar' => 3, 'march' => 3,
    'apr' => 4, 'april' => 4,
    'may' => 5, 
    'jun' => 6, 'june' => 6,
    'jul' => 7, 'july' => 7,
    'aug' => 8, 'august' => 8,
    'sep' => 9, 'september' => 9,
    'oct' => 10, 'october' => 10,
    'nov' => 11, 'november' => 11,
    'dec' => 12, 'december' => 12
];

foreach ($sessions as $session) {
    if ($session->duration != null) continue; // Skip already parsed ones to be safe

    $name = strtolower(trim(str_replace([' ', '-'], ' ', $session->name)));
    // Remove extra spaces
    $name = preg_replace('/\s+/', ' ', $name);
    
    $duration = null;
    $end_date = null;

    // We can try to extract all words and find the month and years.
    preg_match_all('/(january|february|march|april|may|june|july|august|september|october|november|december|jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec)/i', $name, $mMatches);
    preg_match_all('/(\d{4})/', $name, $yMatches);

    if (count($mMatches[1]) == 2 && count($yMatches[1]) >= 1) {
        $start_m = $months[$mMatches[1][0]];
        $end_m = $months[$mMatches[1][1]];
        
        if (count($yMatches[1]) == 2) {
            $start_y = (int)$yMatches[1][0];
            $end_y = (int)$yMatches[1][1];
        } else {
            $start_y = (int)$yMatches[1][0];
            $end_y = (int)$yMatches[1][0];
        }

        $duration = (($end_y - $start_y) * 12) + ($end_m - $start_m) + 1;
        // Fix negatives or 0 if parsed wrong
        if ($duration <= 0) $duration = 1;
        $end_date = Carbon::create($end_y, $end_m, 1)->endOfMonth();
    }

    if ($duration && $end_date) {
        $exam_date = Carbon::create($end_date->year, $end_date->month, 20);
        $result_date = $exam_date->copy()->addMonth()->setDay(19);

        $session->update([
            'duration' => $duration,
            'exam_date' => $exam_date,
            'result_published_date' => $result_date,
        ]);

        Student::where('session_id', $session->id)->update([
            'course_type' => $session->course_type,
            'course_duration' => $session->course_duration_string,
            'exam_date' => $exam_date,
            'result_publised' => $result_date,
        ]);
        
        $updatedCount++;
        echo "Fixed Session ID {$session->id} ({$session->name}): $duration months, Exam: {$exam_date->toDateString()}\n";
    }
}

echo "Successfully fixed $updatedCount more sessions.\n";
