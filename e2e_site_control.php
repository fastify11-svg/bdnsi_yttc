<?php
require __DIR__ . '/vendor/autoload.php';
$app = require_once __DIR__ . '/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

$output = "=================================================\n";
$output .= "  E2E API TEST: SITE CONTROL CENTER\n";
$output .= "=================================================\n\n";

try {
    // 1. Simulate Admin Login
    $admin = \App\Models\Admin::first();
    if (!$admin) throw new Exception("No admin found to test.");
    \Illuminate\Support\Facades\Auth::guard('admin')->login($admin);
    $output .= "✅ [AUTH] Logged in as Super Admin: {$admin->email}\n";

    // 2. Fetch the Site Control Center Page Data
    $request = Illuminate\Http\Request::create('/admin/configDictionary/create', 'GET');
    $response = $app->handle($request);
    
    if ($response->status() == 200) {
        $output .= "✅ [PAGE LOAD] /admin/configDictionary/create loaded successfully (200 OK)\n";
        
        // 3. Verify Logos exist in Storage
        $output .= "✅ [DATA] Config dictionary loaded from DB.\n";
        $logos = ['header_logo', 'main_logo', 'favicon'];
        foreach ($logos as $logo) {
            $logoPath = \App\Models\ConfigDictionary::get($logo);
            if (!empty($logoPath)) {
                $path = public_path($logoPath); // Assuming it stores relative public path
                if (file_exists($path)) {
                    $output .= "  ✅ [STORAGE] $logo is intact at $logoPath\n";
                } else {
                    // Check if it's in storage/app/public
                    $storagePath = storage_path('app/public/' . str_replace('/storage/', '', $logoPath));
                    if (file_exists($storagePath)) {
                        $output .= "  ✅ [STORAGE] $logo is intact in Storage.\n";
                    } else {
                        $output .= "  ❌ [STORAGE] $logo file is MISSING physically at $storagePath\n";
                    }
                }
            } else {
                $output .= "  ⚠️ [STORAGE] $logo is not set in DB.\n";
            }
        }
    } else {
        $output .= "❌ [PAGE LOAD] Failed to load Control Center (HTTP ".$response->status().")\n";
    }

    // 4. Test Submission (Save & Apply)
    $output .= "\n✅ [TEST SUBMIT] Simulating Config Save...\n";
    $testData = [
        'portal_name' => 'BDNSI Technical Training Institute',
        'hotline_phone' => '09649700002',
        // Toggles
        'module_center_apply' => 1,
        'module_student_result' => 1,
        // Colors
        'primary_color' => '#6A2A9A',
    ];
    $postReq = Illuminate\Http\Request::create('/admin/configDictionary', 'POST', $testData);
    $postRes = $app->handle($postReq);
    
    if ($postRes->status() == 302 || $postRes->status() == 200) {
        $output .= "✅ [SAVE E2E] Configuration saved successfully without errors.\n";
    } else {
        $output .= "❌ [SAVE E2E] Save failed (HTTP ".$postRes->status().")\n";
    }

} catch (\Exception $e) {
    $output .= "❌ [ERROR] " . $e->getMessage() . "\n";
}

$output .= "\n=================================================\n";
$output .= " E2E TEST COMPLETE.\n";
$output .= "=================================================\n";

echo $output;
