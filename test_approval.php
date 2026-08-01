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

// 1. Simulate frontend form submission
$center = new Center();
$center->name = 'Test Pending Center';
$center->owner_name = 'Pending Owner';
$center->mobile = '01711223344';
$center->email = 'pending@example.com';
$center->address = 'Some address';
$center->center_location = 'Some location';
$center->division = 1;
$center->district = 1;
$center->upazilla = 1;
// status is Pending, so code should be null
$center->code = null;
$center->status = CenterStatus::Pending;
$center->save();

echo "Simulated Frontend Submit -> Center ID: " . $center->id . ", Code: " . var_export($center->code, true) . ", Status: " . $center->status . "\n";

// 2. Simulate Admin Approval (same logic as CenterController::updateStatus)
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
} else {
    echo "User was NOT created!\n";
}
