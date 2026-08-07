<?php
require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

use Illuminate\Support\Facades\DB;

$file = 'C:\Users\Naeem\Downloads\yttccomb_application.sql';
$contents = file_get_contents($file);

// Find all insert blocks for subjects
$pattern = "/INSERT INTO `subjects` \([^)]+\) VALUES\s*(.*?);/s";
preg_match_all($pattern, $contents, $matches);

if (empty($matches[0])) {
    echo "No inserts found for subjects.\n";
    exit;
}

$totalCourses = 0;
DB::statement('SET FOREIGN_KEY_CHECKS=0;');
DB::table('subjects')->truncate();

$count = 0;
foreach ($matches[0] as $query) {
    try {
        DB::statement($query);
        $count++;
        // Approximate count of tuples
        $totalCourses += substr_count($query, '),(') + 1;
    } catch (\Exception $e) {
        echo "Error on query: \n";
        echo $e->getMessage() . "\n";
    }
}

DB::statement('SET FOREIGN_KEY_CHECKS=1;');

$dbCount = DB::table('subjects')->count();
echo "Successfully extracted and executed $count INSERT blocks for subjects.\n";
echo "Total courses in DB now: $dbCount\n";
