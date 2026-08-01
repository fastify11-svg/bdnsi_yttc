<?php
require __DIR__ . '/../vendor/autoload.php';
$app = require_once __DIR__ . '/../bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

foreach (\App\Models\Admin::all() as $admin) {
    echo "ID: {$admin->id} | Name: {$admin->name} | Email: {$admin->email}\n";
}
