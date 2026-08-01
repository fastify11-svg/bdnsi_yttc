<?php
require_once __DIR__ . '/vendor/autoload.php';
$app = require_once __DIR__ . '/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

echo "=== SLIDERS (fields) ===\n";
$s = App\Models\Slider::first();
if ($s) echo json_encode(array_keys($s->getAttributes())) . "\n";
echo "Count: " . App\Models\Slider::count() . "\n\n";

echo "=== SUBJECTS/COURSES (fields) ===\n";
$c = App\Models\Subject::first();
if ($c) { echo json_encode(array_keys($c->getAttributes())) . "\n"; echo "Photo raw: " . ($c->getAttributes()['photo'] ?? 'NULL') . "\n"; }
echo "Count: " . App\Models\Subject::count() . "\n\n";

echo "=== TEAMS (fields) ===\n";
$t = App\Models\Team::first();
if ($t) { echo json_encode(array_keys($t->getAttributes())) . "\n"; echo "Image raw: " . ($t->getAttributes()['image'] ?? 'NULL') . "\n"; }
echo "Count: " . App\Models\Team::count() . "\n\n";

echo "=== CENTERS (fields) ===\n";
$cn = App\Models\Center::first();
if ($cn) { echo json_encode(array_keys($cn->getAttributes())) . "\n"; echo "center_logo raw: " . ($cn->getAttributes()['center_logo'] ?? 'NULL') . "\n"; echo "photo raw: " . ($cn->getAttributes()['photo'] ?? 'NULL') . "\n"; }
echo "Count (Approved): " . App\Models\Center::where('status', App\Enums\CenterStatus::Approved)->count() . "\n";
echo "Count (All): " . App\Models\Center::count() . "\n\n";

echo "=== YOUTUBE VIDEOS (fields) ===\n";
$yv = App\Models\YoutubeVideo::where('status', 1)->first();
if ($yv) echo json_encode(array_keys($yv->getAttributes())) . "\n";
echo "Count (Active): " . App\Models\YoutubeVideo::where('status', 1)->count() . "\n\n";

echo "=== NOTICES (fields) ===\n";
$n = App\Models\Notice::first();
if ($n) echo json_encode(array_keys($n->getAttributes())) . "\n";
echo "Count: " . App\Models\Notice::count() . "\n\n";

echo "=== STUDENTS (fields - first only) ===\n";
echo "Count (Approved): " . App\Models\Student::where('status', App\Enums\StudentStatus::Approved)->count() . "\n";
echo "Count (All): " . App\Models\Student::count() . "\n\n";

echo "=== SPONSORS ===\n";
$sp = App\Models\Slider::where('type', App\Enums\SliderType::Sponsor)->count();
echo "Count: " . $sp . "\n\n";

echo "=== CONFIG NOTICE ===\n";
$notice = App\Models\ConfigDictionary::get('notice', 'DEFAULT');
echo "Type: " . gettype($notice) . "\n";
echo "Value (50 chars): " . mb_substr(is_string($notice) ? $notice : json_encode($notice), 0, 50) . "\n\n";

echo "=== CONFIG ABOUT_US ===\n";
$about = App\Models\ConfigDictionary::get('main_about_us', 'DEFAULT');
echo "Type: " . gettype($about) . "\n";
echo "Value (80 chars): " . mb_substr(is_string($about) ? $about : json_encode($about), 0, 80) . "\n";
echo "Length: " . (is_string($about) ? mb_strlen($about) : 0) . "\n\n";

echo "=== SAMPLE SLIDER DATA ===\n";
foreach(App\Models\Slider::take(3)->get() as $sl) {
    echo "ID:{$sl->id} photo:{$sl->photo} type:" . ($sl->getAttributes()['type'] ?? 'null') . "\n";
}
