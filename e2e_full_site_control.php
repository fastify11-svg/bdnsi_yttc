<?php
require __DIR__ . '/vendor/autoload.php';
$app = require_once __DIR__ . '/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

$output = "=================================================\n";
$output .= "  E2E API TEST: ALL OPTIONS SITE CONTROL CENTER\n";
$output .= "=================================================\n\n";

try {
    $admin = \App\Models\Admin::first();
    \Illuminate\Support\Facades\Auth::guard('admin')->login($admin);
    
    $testData = [
        'portal_name' => 'E2E Portal Name',
        'tagline' => 'E2E Tagline',
        'rjsc_id' => 'E2E-1234',
        'hotline_phone' => '+8801999999999',
        'official_email' => 'e2e@example.com',
        'headquarter_address' => 'E2E HQ Address',
        'twitter_url' => 'https://twitter.com/e2e',
        'facebook_url' => 'https://facebook.com/e2e',
        'youtube_url' => 'https://youtube.com/e2e',
        'linkedin_url' => 'https://linkedin.com/e2e',
        'marquee_notice' => 'E2E Marquee Notice',
        'about_short' => 'E2E Short',
        'about_full' => 'E2E Full',
        'terms_conditions' => 'E2E Terms',
        'privacy_policy' => 'E2E Privacy',
        'footer_copyright' => 'E2E Copyright',
        'toggle_center_apply' => 0,
        'toggle_result_verify' => 0,
        'toggle_success_students' => 0,
        'toggle_video_gallery' => 0,
        'toggle_photo_gallery' => 0,
        'toggle_verified_centers' => 0,
        'toggle_sponsors' => 0,
        'toggle_notice_board' => 0,
        'toggle_contact_form' => 0,
        'toggle_whatsapp' => 0,
        'primary_color' => '#111111',
        'secondary_color' => '#222222',
        'accent_color' => '#333333',
    ];

    $request = Illuminate\Http\Request::create('/admin/configDictionary', 'POST', $testData);
    $controller = new \App\Http\Controllers\Admin\ConfigDictionaryController();
    $controller->store($request);
    
    $output .= "✅ [SAVE E2E] Controller store() executed.\n";

    // Verify SiteConfig
    $config = \App\Models\SiteConfig::first();
    $failed = false;
    foreach ($testData as $key => $val) {
        if ($config->$key !== (string)$val && $config->$key !== (int)$val) {
            $output .= "❌ [DB SYNC] SiteConfig field '$key' failed. Expected '$val', got '{$config->$key}'\n";
            $failed = true;
        }
    }

    // Verify ConfigDictionary
    foreach ($testData as $key => $val) {
        $dictVal = \App\Models\ConfigDictionary::get($key);
        if ($dictVal !== (string)$val && $dictVal !== (int)$val) {
            $output .= "❌ [FRONTEND SYNC] ConfigDictionary field '$key' failed. Expected '$val', got '{$dictVal}'\n";
            $failed = true;
        }
    }

    if (!$failed) {
        $output .= "✅ [SUCCESS] ALL fields saved to DB and synced to Frontend properly!\n";
    }

} catch (\Exception $e) {
    $output .= "❌ [ERROR] " . $e->getMessage() . "\n" . $e->getTraceAsString();
}

echo $output;
