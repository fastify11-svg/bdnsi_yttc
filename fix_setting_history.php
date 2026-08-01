<?php
require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

use App\Models\ConfigDictionary;
use Illuminate\Support\Facades\DB;

// Fix setting-history so it is an array, not a double encoded string
$setting = DB::table('config_dictionaries')->where('key', 'setting-history')->value('value');

if (is_string($setting)) {
    // Decode until we get an array
    $data = json_decode($setting, true);
    if (is_string($data)) {
        $data = json_decode($data, true);
    }
    
    if (is_array($data)) {
        // Save using Eloquent so the casting is handled correctly
        $config = ConfigDictionary::find('setting-history');
        if ($config) {
            $config->value = $data; // Eloquent will json_encode this automatically
            $config->save();
        } else {
            // raw insert
            DB::table('config_dictionaries')->where('key', 'setting-history')->update([
                'value' => json_encode($data)
            ]);
        }
    }
}

ConfigDictionary::bustCache();
ConfigDictionary::storeCache();

$test = ConfigDictionary::get('setting-history');
if (is_array($test)) {
    echo "SUCCESS: setting-history is now an array.\n";
} else {
    echo "ERROR: setting-history is still a " . gettype($test) . ".\n";
}
