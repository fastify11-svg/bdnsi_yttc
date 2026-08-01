<?php
require __DIR__.'/vendor/autoload.php';
$app = require_once __DIR__.'/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

use App\Models\Center;
use App\Models\User;
use App\Enums\CenterStatus;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;

// Create user and center
$center = new Center();
$center->name = 'Test Center 4 (Suspended)';
$center->owner_name = 'Pending Owner 4';
$center->mobile = '01700112244';
$center->email = 'pending4@example.com';
$center->address = 'Address 4';
$center->center_location = 'Location 4';
$center->division = 1;
$center->district = 1;
$center->upazilla = 1;
// status is Suspended (2), so it's not approved.
$center->code = '178999';
$center->status = CenterStatus::Suspended;
$center->save();

$user = User::create([
    'username' => $center->code,
    'name' => $center->name,
    'email' => $center->email,
    'phone' => $center->mobile,
    'center_id' => $center->id,
    'password' => Hash::make('password123'),
    'text_password' => 'password123',
]);

// Try to login
$attempt = Auth::attempt(['username' => $user->username, 'password' => 'password123']);
if ($attempt) {
    echo "Login Success initially for Suspended center.\n";
    
    // Guard Check
    $user = Auth::user();
    $center = \App\Models\Center::find($user->center_id);
    $status = $center ? (is_object($center->status) ? $center->status->value : $center->status) : null;
    if (!$center || ($status != 1 && $status !== \App\Enums\CenterStatus::Approved->value && strtolower((string)$status) !== 'approved')) {
        echo "Login Failed (Guard Blocked): Center not approved. Status is: " . $status . "\n";
        Auth::logout();
    } else {
        echo "Login Guard Passed! Center is approved.\n";
    }

} else {
    echo "Login Failed: invalid credentials\n";
}
