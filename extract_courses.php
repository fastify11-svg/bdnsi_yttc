<?php
require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

use Illuminate\Support\Facades\DB;

$file = 'C:\Users\Naeem\Downloads\yttccomb_application.sql';
$contents = file_get_contents($file);

preg_match_all("/INSERT INTO `subjects`.*?;/is", $contents, $matches);

if (empty($matches[0])) {
    echo "No inserts found for subjects.\n";
    exit;
}

DB::statement('SET FOREIGN_KEY_CHECKS=0;');
DB::table('subjects')->truncate();

$count = 0;
foreach ($matches[0] as $query) {
    try {
        DB::statement($query);
        $count++;
    } catch (\Exception $e) {
        echo "Error on query: " . substr($query, 0, 100) . "...\n";
        echo $e->getMessage() . "\n";
    }
}

DB::statement('SET FOREIGN_KEY_CHECKS=1;');

$totalCourses = DB::table('subjects')->count();
echo "Successfully extracted and executed $count INSERT statements for subjects.\n";
echo "Total courses now in database: $totalCourses\n";
