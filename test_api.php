<?php

require __DIR__ . '/vendor/autoload.php';
$app = require_once __DIR__ . '/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

$request = Illuminate\Http\Request::create('/result', 'GET', ['roll' => 'REG2025001']);
$response = $app->handle($request);

if ($response->status() === 200) {
    echo "API TEST PASSED\n";
    // Check if inertia rendered the page correctly
    $content = $response->getContent();
    if (strpos($content, 'Demo Student 1') !== false || strpos($content, 'Student Result Verification') !== false) {
         echo "Content verified.\n";
    }
} else {
    echo "API TEST FAILED with status: " . $response->status() . "\n";
}
