<?php
require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

use App\Models\ConfigDictionary;
use Illuminate\Support\Facades\DB;

// Fix double quotes on string values
ConfigDictionary::set('site_name', 'BDNSI Technical Training Institute');
ConfigDictionary::set('site_tagline', 'skill education Quality across Bangladesh');
ConfigDictionary::set('site_rjsc', 'RJSC-75361');
ConfigDictionary::set('site_logo', 'public/config/Main Brand Logo.png');
ConfigDictionary::set('site_favicon', 'public/config/Browser Favicon.png');
ConfigDictionary::set('site_header_logo', 'public/config/Top Header Logo.png');

// Fix JSON fields
$rows = DB::table('config_dictionaries')->whereIn('key', ['about_us', 'home_page'])->get();
foreach ($rows as $row) {
    // It might be stored as json string or double encoded
    $val = $row->value;
    if (is_string($val)) {
        $data = json_decode($val, true);
        if (is_string($data)) {
            $data = json_decode($data, true); // if double encoded
        }
    } else {
        $data = $val;
    }

    if (is_array($data) && isset($data[0])) {
        $data[0]['logo'] = 'public/config/Main Brand Logo.png';
        $data[0]['fav_icon'] = 'public/config/Browser Favicon.png';
        $data[0]['header_logo'] = 'public/config/Top Header Logo.png';
        
        DB::table('config_dictionaries')->where('key', $row->key)->update([
            'value' => json_encode($data)
        ]);
    }
}

ConfigDictionary::bustCache();
ConfigDictionary::storeCache();

echo "Update Complete!\n";

// TEST
$site_name = ConfigDictionary::get('site_name');
echo "Name: $site_name\n";
if ($site_name !== 'BDNSI Technical Training Institute') echo "FAIL name\n";

$about_us = ConfigDictionary::get('about_us');
echo "Logo: " . ($about_us[0]['logo'] ?? 'N/A') . "\n";
if (($about_us[0]['logo'] ?? '') !== 'public/config/Main Brand Logo.png') echo "FAIL logo\n";

echo "ALL GOOD\n";
