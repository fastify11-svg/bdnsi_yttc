<?php
require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

use App\Models\ConfigDictionary;

ConfigDictionary::set('site_name', 'BDNSI Technical Training Institute');
ConfigDictionary::set('site_tagline', 'skill education Quality across Bangladesh');
ConfigDictionary::set('site_rjsc', 'RJSC-75361');

ConfigDictionary::set('site_logo', 'public/config/Main Brand Logo.png');
ConfigDictionary::set('site_favicon', 'public/config/Browser Favicon.png');
ConfigDictionary::set('site_header_logo', 'public/config/Top Header Logo.png');

echo "Updated basic text configs and logo configs.\n";

// Let's check if there is an "about_us" or "home_page" config that contains a JSON with those logos
$all = ConfigDictionary::all();
foreach ($all as $c) {
    if (strpos($c->value, 'fav_icon') !== false || strpos($c->value, 'header_logo') !== false) {
        echo "Found JSON config in key: " . $c->key . "\n";
        $data = json_decode($c->value, true);
        if ($data && isset($data[0]['logo'])) {
            $data[0]['logo'] = 'public/config/Main Brand Logo.png';
            $data[0]['fav_icon'] = 'public/config/Browser Favicon.png';
            $data[0]['header_logo'] = 'public/config/Top Header Logo.png';
            ConfigDictionary::set($c->key, json_encode($data));
            echo "Updated JSON config for key: " . $c->key . "\n";
        }
    }
}
