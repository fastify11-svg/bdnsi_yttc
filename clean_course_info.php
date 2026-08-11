<?php

require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$kernel = $app->make(Kernel::class);
$kernel->bootstrap();

use App\Models\Subject;
use Illuminate\Contracts\Console\Kernel;

$courses = Subject::all();
$count = 0;

foreach ($courses as $course) {
    $name = strtolower($course->name);

    // Default values for standard short courses
    $type = 1; // Short Course
    $duration = '3 Months / 6 Months';
    $qualification = 'JSC / SSC / Equivalent';
    $fee = '10,500 - 15,500 BDT';
    $details = 'This short course is designed to equip you with essential skills for immediate entry into the workforce. The training combines theoretical understanding with practical application, ensuring you are industry-ready upon graduation.';

    // Rule 1: Diploma Courses
    if (str_contains($name, 'diploma')) {
        $type = 2; // Diploma
        $duration = '6 Months - 4 Years';
        $qualification = 'SSC / HSC / Equivalent';
        $fee = '20,000 - 35,000 BDT';
        $details = 'This comprehensive Diploma program offers an extensive curriculum that covers both foundational concepts and advanced techniques. Designed for students aiming for professional mastery, this course guarantees government-approved certification and broadens career prospects both nationally and internationally.';
    }
    // Rule 2: Certificate Courses
    elseif (str_contains($name, 'certificate')) {
        $type = 1; // Short Course
        $duration = '6 Months (360 Hours)';
        $qualification = 'JSC / SSC / Equivalent';
        $fee = '12,500 - 18,500 BDT';
        $details = 'A fast-tracked certification course focusing heavily on practical expertise. By completing this program, students will earn a verified certificate validating their competence in the respective field, paving the way for freelance opportunities or technical employment.';
    }
    // Rule 3: Advanced / Professional Courses
    elseif (str_contains($name, 'advance') || str_contains($name, 'advanced') || str_contains($name, 'professional') || str_contains($name, 'management') || str_contains($name, 'engineering')) {
        $type = 0; // Regular
        $duration = '6 Months / 1 Year';
        $qualification = 'SSC / HSC / Equivalent';
        $fee = '15,500 - 25,000 BDT';
        $details = 'An advanced-level professional training tailored for individuals who want to upgrade their existing skills or transition into specialized roles. This program incorporates modern methodologies, software tools, and hands-on lab sessions to meet corporate standards.';
    }

    // Rule 4: Technical Trade Courses
    if (str_contains($name, 'welder') || str_contains($name, 'welding') || str_contains($name, 'mason') || str_contains($name, 'plaster') || str_contains($name, 'tiles') || str_contains($name, 'steel') || str_contains($name, 'plumbing') || str_contains($name, 'electrician') || str_contains($name, 'mechanic') || str_contains($name, 'technician')) {
        if (! str_contains($name, 'diploma')) {
            $duration = '3 Months / 6 Months';
            $qualification = 'JSC / SSC / Equivalent';
            $fee = '15,000 - 22,500 BDT';
            $details = 'A purely practical, trade-focused training designed for the technical sector. Students receive 100% hands-on lab sessions preparing them for high-demand jobs in the construction, engineering, and manufacturing industries.';
        }
    }

    $course->type = $type;
    $course->duration = $duration;
    $course->education_qualification = $qualification;
    $course->rate = $fee;
    $course->course_details = $details;

    if (empty($course->code) || $course->code === 'NO-CODE') {
        $generatedCode = 'BDNSI-'.strtoupper(substr(preg_replace('/[^a-zA-Z]/', '', str_replace(' ', '', ucwords($course->name))), 0, 4));
        if (strlen($generatedCode) < 10) {
            $generatedCode .= str_pad(rand(1, 99), 2, '0', STR_PAD_LEFT);
        }
        // Ensure uniqueness if multiple courses have the same prefix
        $course->code = $generatedCode.'-'.$course->id;
    }

    $course->save();
    $count++;
}

echo "Successfully updated specifications (Type, Duration, Qualification, Fee, Description) for $count courses based on AI logic.\n";
