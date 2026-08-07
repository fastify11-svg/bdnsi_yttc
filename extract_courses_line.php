<?php
require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

use Illuminate\Support\Facades\DB;

$file = 'C:\Users\Naeem\Downloads\yttccomb_application.sql';
$handle = fopen($file, "r");

if (!$handle) {
    echo "Error opening file\n";
    exit;
}

DB::statement('SET FOREIGN_KEY_CHECKS=0;');
DB::table('subjects')->truncate();

$inInsert = false;
$currentQuery = "";
$count = 0;

while (($line = fgets($handle)) !== false) {
    if (strpos($line, "INSERT INTO `subjects`") === 0) {
        $inInsert = true;
        $currentQuery = $line;
    } elseif ($inInsert) {
        $currentQuery .= $line;
        if (trim($line) === "" || substr(rtrim($line), -1) === ';') {
            // End of query
            try {
                DB::statement($currentQuery);
                $count++;
            } catch (\Exception $e) {
                echo "Error on query $count\n";
                // echo $e->getMessage() . "\n";
            }
            $inInsert = false;
            $currentQuery = "";
        }
    }
}

fclose($handle);

DB::statement('SET FOREIGN_KEY_CHECKS=1;');
$dbCount = DB::table('subjects')->count();
echo "Successfully extracted and executed $count INSERT blocks for subjects.\n";
echo "Total courses in DB now: $dbCount\n";
