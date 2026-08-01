<?php
require __DIR__ . '/vendor/autoload.php';
$app = require_once __DIR__ . '/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

use App\Models\SiteConfig;

$config = SiteConfig::first() ?? new SiteConfig();
$config->header_logo = 'config/header_logo.png';
$config->main_logo = 'config/main_logo.png';
$config->favicon = 'config/favicon.png';
$config->save();

echo "Database updated successfully.\n";
