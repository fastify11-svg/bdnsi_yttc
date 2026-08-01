<?php
$m = new mysqli('127.0.0.1', 'root', '', 'yttccomb_bdnsi');

// Basic settings
$queries = [
    "UPDATE config_dictionaries SET value='\"BDNSI Technical Training Institute\"' WHERE `key`='site_name'",
    "UPDATE config_dictionaries SET value='\"skill education Quality across Bangladesh\"' WHERE `key`='site_tagline'",
    "UPDATE config_dictionaries SET value='\"RJSC-75361\"' WHERE `key`='site_rjsc'",
];

foreach ($queries as $q) {
    if (!$m->query($q)) {
        echo "Error: " . $m->error . "\n";
    }
}

// Update JSON fields containing logos
$res = $m->query("SELECT * FROM config_dictionaries WHERE `key`='about_us' OR `key`='home_page'");
while($r = $res->fetch_assoc()) {
    $data = json_decode($r['value'], true);
    if ($data && isset($data[0])) {
        if (isset($data[0]['logo'])) $data[0]['logo'] = 'public/config/Main Brand Logo.png';
        if (isset($data[0]['fav_icon'])) $data[0]['fav_icon'] = 'public/config/Browser Favicon.png';
        if (isset($data[0]['header_logo'])) $data[0]['header_logo'] = 'public/config/Top Header Logo.png';
        
        $json = $m->real_escape_string(json_encode($data));
        $m->query("UPDATE config_dictionaries SET value='$json' WHERE `key`='{$r['key']}'");
    }
}

echo "Config updated successfully.\n";
