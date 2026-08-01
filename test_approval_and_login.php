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

// 1. Simulate frontend form submission
$center = new Center();
$center->name = 'Test Center 3';
$center->owner_name = 'Pending Owner 3';
$center->mobile = '01700112233';
$center->email = 'pending3@example.com';
$center->address = 'Address 3';
$center->center_location = 'Location 3';
$center->division = 1;
$center->district = 1;
$center->upazilla = 1;
$center->code = null;
$center->status = CenterStatus::Pending;
$center->save();

echo "Simulated Frontend Submit -> Center ID: " . $center->id . ", Code: " . var_export($center->code, true) . ", Status: " . $center->status . "\n";

// 2. Admin Approval
$centerToApprove = Center::find($center->id);
$statusVal = 1; // Approved

if ($statusVal === 1) {
    $rawCode = $centerToApprove->getRawOriginal('code');
    if (empty($rawCode)) {
        $maxCode = DB::table('centers')
            ->whereNotNull('code')
            ->whereRaw("code REGEXP '^[0-9]+$'")
            ->max(DB::raw('CAST(code AS UNSIGNED)'));

        $newCode = ($maxCode && $maxCode >= 100000) ? ($maxCode + 1) : 178173;
        while (DB::table('centers')->where('code', (string)$newCode)->exists()) {
            $newCode++;
        }
        $centerToApprove->code = (string)$newCode;
    }
    $centerToApprove->status = CenterStatus::Approved;
    $centerToApprove->save();

    $user = User::where('center_id', $centerToApprove->id)->first();
    if (!$user) {
        $defaultPassword = 'password123';
        User::create([
            'username' => $centerToApprove->code,
            'name' => $centerToApprove->name,
            'email' => $centerToApprove->email,
            'phone' => $centerToApprove->mobile ?? '01711000000',
            'center_id' => $centerToApprove->id,
            'password' => Hash::make($defaultPassword),
            'text_password' => $defaultPassword,
        ]);
    }
}

$updatedCenter = Center::find($center->id);
$createdUser = User::where('center_id', $center->id)->first();

echo "Admin Approved -> Center Code: " . $updatedCenter->code . ", Status: " . $updatedCenter->status . "\n";
if ($createdUser) {
    echo "Created User -> Username: " . $createdUser->username . ", Password: " . $createdUser->text_password . "\n";

    // 3. Login Authentication Test
    // Try to login
    $attempt = Auth::attempt(['username' => $createdUser->username, 'password' => 'password123']);
    if ($attempt) {
        echo "Login Success: user logged in as " . Auth::user()->username . "\n";
        
        // Guard Check (just running the condition from LoginRequest)
        $user = Auth::user();
        $center = \App\Models\Center::find($user->center_id);
        $status = $center ? (is_object($center->status) ? $center->status->value : $center->status) : null;
        if (!$center || ($status != 1 && $status !== \App\Enums\CenterStatus::Approved->value && strtolower((string)$status) !== 'approved')) {
            echo "Login Failed (Guard Blocked): Center not approved.\n";
        } else {
            echo "Login Guard Passed! Center is approved.\n";
        }

    } else {
        echo "Login Failed: invalid credentials\n";
    }

} else {
    echo "User was NOT created!\n";
}
