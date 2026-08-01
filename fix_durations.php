<?php
require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

use App\Models\Session;
use App\Models\Student;

$sessions = Session::whereNotNull('duration')->get();
$updatedCount = 0;

foreach ($sessions as $session) {
    $old_duration = $session->duration;
    $new_duration = $old_duration;

    if ($old_duration == 4 || $old_duration == 5) {
        $new_duration = 6;
    } elseif ($old_duration >= 7 && $old_duration <= 13) {
        $new_duration = 12; // 1 year
    } elseif ($old_duration >= 14 && $old_duration <= 19) {
        $new_duration = 18; // 1.5 years
    } elseif ($old_duration >= 20 && $old_duration <= 25) {
        $new_duration = 24; // 2 years
    } elseif ($old_duration >= 26 && $old_duration <= 37) {
        $new_duration = 36; // 3 years
    } elseif ($old_duration >= 38) {
        $new_duration = 48; // 4 years
    }

    if ($old_duration != $new_duration) {
        $session->update(['duration' => $new_duration]);
        
        Student::where('session_id', $session->id)->update([
            'course_type' => $session->course_type,
            'course_duration' => $session->course_duration_string,
        ]);
        
        $updatedCount++;
        echo "Fixed Session ID {$session->id} ({$session->name}): $old_duration => $new_duration months\n";
    }
}

echo "Successfully fixed $updatedCount session durations.\n";
