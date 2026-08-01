<?php
require __DIR__.'/vendor/autoload.php';
$app = require_once __DIR__.'/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

try {
    \Illuminate\Support\Facades\DB::statement('ALTER TABLE subjects ADD code VARCHAR(255) NULL AFTER name');
    echo "Added code column successfully.\n";
} catch (\Exception $e) {
    echo $e->getMessage() . "\n";
}
