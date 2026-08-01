<?php

require __DIR__.'/vendor/autoload.php';
$app = require_once __DIR__.'/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Http\Kernel::class);

use App\Models\Team;
use Illuminate\Http\Request;

echo "========================================\n";
echo "E2E AUTOMATED TEAM TEST - BDNSI PROJECT\n";
echo "========================================\n\n";

$pass = 0;
$fail = 0;

function assertCondition($condition, $message) {
    global $pass, $fail;
    if ($condition) {
        echo "[PASS] $message\n";
        $pass++;
    } else {
        echo "[FAIL] $message\n";
        $fail++;
    }
}

// 1. Initial State
$initialCount = Team::count();
echo "-> Initial Team count: $initialCount\n";

// 2. Mock Image Creation
$dummyImagePath = sys_get_temp_dir() . '/dummy_team.jpg';
file_put_contents($dummyImagePath, 'dummy content');
$uploadedFile = new \Illuminate\Http\UploadedFile(
    $dummyImagePath, 'dummy_team.jpg', 'image/jpeg', null, true
);

// 3. Create a Team Member
$request = Request::create('/admin/team', 'POST', [
    'name' => 'E2E Test Member',
    'designation' => 'E2E Developer',
    'status' => 1,
    'order_index' => 99,
    'facebook_link' => 'https://facebook.com',
    'phone' => '123456789'
], [], ['image' => $uploadedFile]);
$request->headers->set('Accept', 'application/json');

$response = $kernel->handle($request);
assertCondition($response->getStatusCode() == 302 || $response->getStatusCode() == 200 || $response->getStatusCode() == 201, "Team creation request handled without crash (Status: {$response->getStatusCode()})");

$newMember = Team::where('name', 'E2E Test Member')->first();
assertCondition($newMember !== null, "Team member was successfully saved to the database.");
if ($newMember) {
    assertCondition($newMember->designation === 'E2E Developer', "Designation matches.");
    assertCondition($newMember->status == 1, "Status matches.");
    assertCondition($newMember->order_index == 99, "Order index matches.");
    assertCondition($newMember->facebook_link === 'https://facebook.com', "Facebook link matches.");
    assertCondition($newMember->image !== null, "Image was uploaded and saved.");
    
    // 4. Update the Team Member
    $updateRequest = Request::create("/admin/team/{$newMember->id}", 'POST', [
        '_method' => 'PUT',
        'name' => 'E2E Updated Member',
        'designation' => 'E2E Senior Developer',
        'status' => 0,
        'order_index' => 10,
        'linkedin_link' => 'https://linkedin.com'
    ]);
    
    $updateResponse = $kernel->handle($updateRequest);
    $newMember->refresh();
    
    assertCondition($newMember->name === 'E2E Updated Member', "Name was updated.");
    assertCondition($newMember->status == 0, "Status was updated to inactive.");
    assertCondition($newMember->order_index == 10, "Order index was updated.");
    assertCondition($newMember->linkedin_link === 'https://linkedin.com', "LinkedIn link was updated.");
    
    // 5. Delete the Team Member
    $deleteRequest = Request::create("/admin/team/{$newMember->id}", 'POST', ['_method' => 'DELETE']);
    $deleteResponse = $kernel->handle($deleteRequest);
    
    $deletedMember = Team::find($newMember->id);
    assertCondition($deletedMember === null, "Team member was successfully deleted.");
}

echo "\n----------------------------------------\n";
echo "TEST RESULTS: $pass PASSED, $fail FAILED\n";
echo "----------------------------------------\n";

if ($fail > 0) {
    exit(1);
}
exit(0);

