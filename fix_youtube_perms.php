<?php
require __DIR__ . '/vendor/autoload.php';
$app = require_once __DIR__ . '/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

$roles = \App\Models\Role::all();
echo "Available Roles:\n";
foreach ($roles as $r) {
    echo "- " . $r->name . "\n";
}

$admin = \App\Models\Admin::first();
if ($admin) {
    echo "First Admin: " . $admin->email . "\n";
    echo "Admin Roles: ";
    print_r($admin->roles->pluck('name')->toArray());
    
    // Give this admin the youtube permissions directly if no role found
    $permissions = ['youtube-video-read', 'youtube-video-create', 'youtube-video-update', 'youtube-video-delete'];
    foreach ($permissions as $perm) {
        $p = \App\Models\Permission::firstOrCreate(['name' => $perm], ['display_name' => ucwords(str_replace('-', ' ', $perm))]);
        // attach to the admin's role(s)
        foreach ($admin->roles as $role) {
            if (!$role->hasPermission($p->name)) {
                $role->attachPermission($p);
                echo "Attached $perm to role: {$role->name}\n";
            }
        }
    }
} else {
    echo "No admin found.\n";
}

app()->make(\Laratrust\Laratrust::class)->cleanCache();
echo "Done.\n";
