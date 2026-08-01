<?php
require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

$admin = \App\Models\Admin::where('email', 'admin@gmail.com')->first();
if (!$admin) {
    $admin = new \App\Models\Admin();
}
$admin->name = 'Super Admin';
$admin->email = 'admin@gmail.com';
$admin->password = \Illuminate\Support\Facades\Hash::make('12345678');
$admin->save();

$role = \App\Models\Role::firstOrCreate(['name' => 'admin', 'display_name' => 'Admin']);
if (!$admin->hasRole('admin')) {
    $admin->attachRole($role);
}

echo "Admin Account Ready!\nEmail: admin@gmail.com\nPassword: 12345678\n";
