import Client from 'ssh2-sftp-client';
import fs from 'fs';

const config = {
  host: '145.79.212.19',
  port: 65002,
  username: 'u881397359',
  password: 'NJnaeem11.'
};

async function run() {
  const sftp = new Client();
  try {
    console.log('Connecting SFTP...');
    await sftp.connect(config);
    
    const indexContent = `<?php

use Illuminate\\Contracts\\Http\\Kernel;
use Illuminate\\Http\\Request;

define('LARAVEL_START', microtime(true));

if (file_exists(__DIR__.'/storage/framework/maintenance.php')) {
    require __DIR__.'/storage/framework/maintenance.php';
}

require __DIR__.'/vendor/autoload.php';

$app = require_once __DIR__.'/bootstrap/app.php';
$app->bind('path.public', function() { return __DIR__; });

$kernel = $app->make(Kernel::class);

$response = tap($kernel->handle(
    $request = Request::capture()
))->send();

$kernel->terminate($request, $response);
`;
    fs.writeFileSync('index.php.fixed', indexContent);

    console.log('Uploading index.php.fixed to index.php...');
    await sftp.fastPut('index.php.fixed', '/home/u881397359/domains/nenobet.live/public_html/index.php');

    const htaccessContent = `<IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteRule ^(.*)$ public/$1 [L]
</IfModule>`;
    fs.writeFileSync('htaccess.fixed', htaccessContent);
    console.log('Uploading htaccess.fixed to .htaccess...');
    await sftp.fastPut('htaccess.fixed', '/home/u881397359/domains/nenobet.live/public_html/.htaccess');

    await sftp.end();
    console.log('SFTP Uploads finished.');
  } catch (e) {
    console.error(e);
  }
}

run();
