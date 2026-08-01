<?php
require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

$files = scandir(storage_path('app/public/upload/slider'));
$images = array_filter($files, function($file) {
    return in_array(pathinfo($file, PATHINFO_EXTENSION), ['jpg', 'png', 'webp']);
});
$images = array_values($images); // reset keys

if (count($images) > 10) {
    // 3 Sliders (Type 1)
    for ($i = 0; $i < 3; $i++) {
        \App\Models\Slider::create([
            'title' => 'Sample Hero Banner ' . ($i + 1),
            'photo' => 'upload/slider/' . $images[$i],
            'type' => 1
        ]);
    }
    
    // 4 Gallery (Type 2)
    for ($i = 3; $i < 7; $i++) {
        \App\Models\Slider::create([
            'title' => 'Gallery Moment ' . ($i - 2),
            'photo' => 'upload/slider/' . $images[$i],
            'type' => 2
        ]);
    }
    
    // 4 Sponsors (Type 3)
    for ($i = 7; $i < 11; $i++) {
        \App\Models\Slider::create([
            'title' => 'Affiliated Partner ' . ($i - 6),
            'photo' => 'upload/slider/' . $images[$i],
            'type' => 3
        ]);
    }
    
    echo "Successfully restored Sliders, Gallery, and Sponsors from old images!\n";
} else {
    echo "Not enough images found to restore.\n";
}
