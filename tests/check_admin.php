<?php

use App\Models\Admin;
use Illuminate\Contracts\Console\Kernel;

require __DIR__.'/../vendor/autoload.php';
$app = require_once __DIR__.'/../bootstrap/app.php';
$kernel = $app->make(Kernel::class);
$kernel->bootstrap();

foreach (Admin::all() as $admin) {
    echo "ID: {$admin->id} | Name: {$admin->name} | Email: {$admin->email}\n";
}
