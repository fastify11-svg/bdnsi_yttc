<?php
require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();
try {
    $c = new App\Http\Controllers\HomeController();
    $res = $c->index();
    echo "SUCCESS: HomeController@index executed without error!\n";
    if ($res instanceof \Inertia\Response) {
        $props = Reflection::class; // just check props
        echo "Returned Inertia Response for Welcome\n";
    }
} catch (\Exception $e) {
    echo "ERROR: " . $e->getMessage() . "\n" . $e->getTraceAsString() . "\n";
}
