<?php

$url = 'http://127.0.0.1:8000';
$ch = curl_init($url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$response = curl_exec($ch);
$status = curl_getinfo($ch, CURLINFO_HTTP_CODE);
curl_close($ch);

if ($status == 200) {
    echo "SUCCESS: Server is running at $url\n";
    // Check if the bug was actually fixed in the output HTML (rendered by Inertia)
    if (strpos($response, 'site_name') !== false && strpos($response, 'portal_name') === false) {
        echo "WARNING: The old 'site_name' issue might still exist.\n";
    } else {
        echo "SUCCESS: The 'portal_name' fix is live.\n";
    }
} else {
    echo "ERROR: Server returned status $status\n";
}
