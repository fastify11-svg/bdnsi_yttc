<?php
require __DIR__ . '/vendor/autoload.php';
$app = require_once __DIR__ . '/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

use App\Models\Student;
use App\Models\Result;

$students = Student::with('result')->whereHas('result')->get();
$fixed = 0;

foreach ($students as $student) {
    $result = $student->result;
    $total = $result->written + $result->practical + $result->viva;
    
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

    $writtenLimit = $limit * 0.5;
    $practicalLimit = $limit * 0.3;
    $vivaLimit = $limit * 0.2;

    if ($result->written > $writtenLimit || $result->practical > $practicalLimit || $result->viva > $vivaLimit) {
        $new_written = round($total * 0.5);
        $new_practical = round($total * 0.3);
        $new_viva = $total - $new_written - $new_practical;
        
        $result->written = $new_written;
        $result->practical = $new_practical;
        $result->viva = $new_viva;
        $result->save();
        $fixed++;
    }
}
echo "Fixed $fixed results.\n";
