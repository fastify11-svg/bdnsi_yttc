<?php
require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

use App\Models\ConfigDictionary;
use Illuminate\Support\Facades\DB;

// Fix JSON fields
$rows = DB::table('config_dictionaries')->whereIn('key', ['setting-history'])->get();
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
        
        // Save back exactly how we found it (it seems it is double encoded as a string in DB)
        $json_str = json_encode($data);
        $double_encoded = json_encode($json_str);
        
        DB::table('config_dictionaries')->where('key', $row->key)->update([
            'value' => $double_encoded
        ]);
    }
}

ConfigDictionary::bustCache();
ConfigDictionary::storeCache();

echo "Update Complete!\n";

// TEST
$setting = ConfigDictionary::get('setting-history');
if (is_string($setting)) {
    $setting = json_decode($setting, true);
}
echo "Logo: " . ($setting[0]['logo'] ?? 'N/A') . "\n";
if (($setting[0]['logo'] ?? '') !== 'public/config/Main Brand Logo.png') echo "FAIL logo\n";

echo "ALL GOOD\n";
