<?php
require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$app->make(Illuminate\Contracts\Console\Kernel::class)->bootstrap();

use App\Models\Student;
use App\Models\Session;
use App\Models\Subject;
use App\Models\Center;
use App\Enums\StudentStatus;
use App\Enums\Gender;
use App\Enums\Religion;

// Get or create active session & subject
$session = Session::first();
if (!$session) {
    $session = Session::create(['name' => '2024-2025', 'status' => 1]);
}

$subject = Subject::first();
if (!$subject) {
    $subject = Subject::create(['name' => 'Computer Office Application', 'code' => 'COA-101']);
}

$center = Center::find(2) ?? Center::first();
if (!$center) {
    echo "Error: No center found in database!\n";
    exit;
}

// Create Demo Student
$demoStudent = Student::create([
    'center_id' => $center->id,
    'session_id' => $session->id,
    'subject_id' => $subject->id,
    'name' => 'Rahim Uddin (Demo Student)',
    'fathers_name' => 'Karim Uddin',
    'mothers_name' => 'Rahima Begum',
    'date_of_birth' => '2002-05-15',
    'gender' => Gender::Male,
    'religion' => Religion::Muslim,
    'present_address' => 'House 12, Road 4, Dhanmondi, Dhaka',
    'permanent_address' => 'Village: Rampur, Upazila: Sadar, District: Dhaka',
    'phone' => '01712345678',
    'course_duration' => '6 Months',
    'course_type' => 1,
    'roll' => Student::getLastFreeRoll(),
    'registration' => Student::getLastFreeRegistration(),
    'status' => StudentStatus::Pending,
]);

echo "========================================================\n";
echo "SUCCESSFULLY CREATED DEMO STUDENT:\n";
echo "ID          : " . $demoStudent->id . "\n";
echo "Name        : " . $demoStudent->name . "\n";
echo "Center ID   : " . $demoStudent->center_id . " (" . $center->name . ")\n";
echo "Roll No     : " . $demoStudent->roll . "\n";
echo "Reg No      : " . $demoStudent->registration . "\n";
echo "Session     : " . $session->name . "\n";
echo "Course      : " . $subject->name . "\n";
echo "Status      : Pending (0)\n";
echo "========================================================\n";
