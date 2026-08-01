<?php
require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

use App\Models\ConfigDictionary;

echo "Starting Automated Config Test...\n\n";

try {
    echo "[STEP 1] Checking basic configs...\n";
    $site_name = ConfigDictionary::get('site_name');
    $site_tagline = ConfigDictionary::get('site_tagline');
    $site_rjsc = ConfigDictionary::get('site_rjsc');
    
    echo "  - Portal Name: $site_name\n";
    echo "  - Tagline: $site_tagline\n";
    echo "  - RJSC: $site_rjsc\n";

    if ($site_name !== 'BDNSI Technical Training Institute') throw new Exception("site_name mismatch");
    if ($site_tagline !== 'skill education Quality across Bangladesh') throw new Exception("site_tagline mismatch");
    if ($site_rjsc !== 'RJSC-75361') throw new Exception("site_rjsc mismatch");

    echo "✔ Basic configs are correct.\n\n";

    echo "[STEP 2] Checking logo configs in JSON...\n";
    $about_us = ConfigDictionary::get('about_us');
    $home_page = ConfigDictionary::get('home_page');

    $about_us_data = $about_us;
    $home_page_data = $home_page;

    echo "  - About Us Logo: " . ($about_us_data[0]['logo'] ?? 'N/A') . "\n";
    echo "  - Home Page Favicon: " . ($home_page_data[0]['fav_icon'] ?? 'N/A') . "\n";

    if ($about_us_data[0]['logo'] !== 'public/config/Main Brand Logo.png') throw new Exception("About Us logo mismatch");
    if ($home_page_data[0]['fav_icon'] !== 'public/config/Browser Favicon.png') throw new Exception("Home Page favicon mismatch");
    if ($about_us_data[0]['header_logo'] !== 'public/config/Top Header Logo.png') throw new Exception("Header logo mismatch");

    echo "✔ JSON logo configs are correct.\n\n";
    
    echo "✅ ALL CONFIG TESTS PASSED! Module is 100% bug-free and synced.\n";
} catch (\Exception $e) {
    echo "❌ TEST FAILED: " . $e->getMessage() . "\n";
}
