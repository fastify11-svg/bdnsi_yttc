<?php
require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$app->make(Illuminate\Contracts\Console\Kernel::class)->bootstrap();

use App\Models\Center;
use App\Models\User;
use App\Enums\CenterStatus;
use Illuminate\Support\Facades\Hash;

$demoEmail = 'democenter@gmail.com';
$demoPassword = 'password123';

// 1. Delete existing demo user/center if exists to keep clean
$existingUser = User::where('email', $demoEmail)->first();
if ($existingUser) {
    if ($existingUser->center_id) {
        Center::where('id', $existingUser->center_id)->delete();
    }
    $existingUser->delete();
}

// 2. Step 1: Simulate Public Center Request Submission (Pending State)
$center = Center::create([
    'code' => random_int(111111, 999999),
    'name' => 'BDNSI Model Training Institute',
    'owner_name' => 'Demo Center Director',
    'fathers_name' => 'Model Father',
    'mothers_name' => 'Model Mother',
    'division' => 1,
    'district' => 1,
    'upazilla' => 1,
    'religion' => 1,
    'gender' => 1,
    'address' => 'House 45, Road 12, Dhanmondi, Dhaka',
    'mobile' => '01712345678',
    'email' => $demoEmail,
    'status' => CenterStatus::Pending,
]);

echo "Step 1: Public Center Request Created. ID: {$center->id}, Status: Pending\n";

// 3. Step 2: Admin Approval Process (Convert Pending -> Approved & Create Center User Account)
$center->update(['status' => CenterStatus::Approved]);

$user = User::create([
    'username' => 'democenter',
    'name' => $center->name,
    'email' => $demoEmail,
    'phone' => $center->mobile,
    'center_id' => $center->id,
    'password' => Hash::make($demoPassword),
    'text_password' => $demoPassword,
]);

echo "Step 2: Admin Approval Complete! Center Status: Approved. User Account ID: {$user->id}\n";
echo "========================================================\n";
echo "DEMO CENTER CREDENTIALS FOR TESTING:\n";
echo "Center Name: " . $center->name . "\n";
echo "Login URL  : http://localhost/BDNSI/login\n";
echo "Email      : " . $demoEmail . "\n";
echo "Username   : democenter\n";
echo "Password   : " . $demoPassword . "\n";
echo "========================================================\n";
