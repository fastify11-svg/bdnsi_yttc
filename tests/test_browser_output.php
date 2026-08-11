<?php

use App\Http\Middleware\HandleInertiaRequests;
use App\Http\Middleware\VerifyCsrfToken;
use App\Models\Admin;
use Illuminate\Contracts\Console\Kernel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

require __DIR__.'/../vendor/autoload.php';
$app = require_once __DIR__.'/../bootstrap/app.php';
$kernel = $app->make(Kernel::class);
$kernel->bootstrap();

echo "==================================================\n";
echo "VERIFYING RENDERED HTML OF COURSE MODULE\n";
echo "==================================================\n";

// Authenticate ID 1
$admin = Admin::first();
Auth::guard('admin')->login($admin);

// Bypass Inertia/auth middleware issues in bare script
$app->instance(VerifyCsrfToken::class, new class
{
    public function handle($request, $next)
    {
        return $next($request);
    }
});
$app->instance(HandleInertiaRequests::class, new class
{
    public function handle($request, $next)
    {
        return $next($request);
    }
});

$request = Request::create('/admin/subject', 'GET');
$response = $app->make(Illuminate\Contracts\Http\Kernel::class)->handle($request);

echo 'HTTP Status Code: '.$response->getStatusCode()."\n";
echo 'Response Length: '.strlen($response->getContent())." bytes\n";
echo "Preview of Content:\n".substr($response->getContent(), 0, 500)."\n...\n";

$checks = [
    'AI Auto-Suggest Active' => 'Badge in header',
    '+ Create Course with AI' => 'Gradient create button',
    'Gemini Free AI Auto-Suggest System is Ready!' => 'Main AI notification banner',
    '⚡ Test AI Now' => 'Banner test button',
];

foreach ($checks as $string => $desc) {
    if (strpos($response->getContent(), $string) !== false) {
        echo "✔️ FOUND: [{$desc}] -> \"{$string}\"\n";
    } else {
        echo "❌ MISSING: [{$desc}] -> \"{$string}\"\n";
    }
}

echo "==================================================\n";
echo "HTML VERIFICATION COMPLETED!\n";
