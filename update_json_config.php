<?php
require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

use App\Models\ConfigDictionary;
use Illuminate\Support\Facades\Cache;

$all = ConfigDictionary::all();
foreach ($all as $c) {
    $data = $c->value;
    if (is_array($data)) {
        if (isset($data[0]['logo']) || isset($data[0]['fav_icon'])) {
            echo "Found JSON config in key: " . $c->key . "\n";
            $data[0]['logo'] = 'public/config/Main Brand Logo.png';
            $data[0]['fav_icon'] = 'public/config/Browser Favicon.png';
            $data[0]['header_logo'] = 'public/config/Top Header Logo.png';
            
            // Set directly to DB to bypass cast issues during save
            \DB::table('config_dictionaries')->where('key', $c->key)->update([
                'value' => json_encode($data)
            ]);
            echo "Updated JSON config for key: " . $c->key . "\n";
        }
    }
}

ConfigDictionary::bustCache();
ConfigDictionary::storeCache();
echo "Cache cleared and rebuilt.\n";
