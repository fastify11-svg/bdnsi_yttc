<?php
require __DIR__ . '/vendor/autoload.php';
$app = require_once __DIR__ . '/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

use App\Models\SiteConfig;
use App\Models\ConfigDictionary;

$config = SiteConfig::first();
if ($config) {
    $config->header_logo = str_replace('\\', '/', $config->header_logo);
    $config->main_logo = str_replace('\\', '/', $config->main_logo);
    $config->favicon = str_replace('\\', '/', $config->favicon);
    $config->save();
    
    $allConfigData = $config->toArray();
    unset($allConfigData['id'], $allConfigData['created_at'], $allConfigData['updated_at']);
    ConfigDictionary::setMany($allConfigData);
    
    echo "Database backslashes fixed and ConfigDictionary synced.\n";
} else {
    echo "No SiteConfig found.\n";
}
