import Client from 'ssh2-sftp-client';
import { Client as SSHClient } from 'ssh2';
import fs from 'fs';

const config = {
  host: '145.79.212.19',
  port: 65002,
  username: 'u881397359',
  password: 'NJnaeem11.'
};

const REMOTE_DIR = '/home/u881397359/domains/nenobet.live';
const TAR_FILE = 'deploy.tar.gz';
const SQL_FILE = 'latest_bdnsi_working_db.sql';

async function deploy() {
  const sftp = new Client();
  try {
    console.log('Connecting via SFTP...');
    await sftp.connect(config);

    // console.log(`Uploading ${TAR_FILE}...`);
    // await sftp.fastPut(TAR_FILE, `${REMOTE_DIR}/${TAR_FILE}`);
    
    console.log('Uploading composer.json...');
    await sftp.fastPut('composer.json', `${REMOTE_DIR}/public_html/composer.json`);
    
    console.log('Uploading composer.lock...');
    await sftp.fastPut('composer.lock', `${REMOTE_DIR}/public_html/composer.lock`);
    
    console.log(`Uploading ${SQL_FILE}...`);
    await sftp.fastPut(SQL_FILE, `${REMOTE_DIR}/${SQL_FILE}`);
    
    console.log('Upload complete. Closing SFTP.');
    await sftp.end();

    console.log('Connecting via SSH for extraction and DB setup...');
    const conn = new SSHClient();
    conn.on('ready', () => {
      console.log('SSH connection ready. Running commands...');
      const commands = `
        cd ${REMOTE_DIR}
        # Extract files to public_html, excluding composer files so our fresh uploads aren't overwritten
        tar -xzf ${TAR_FILE} --exclude=composer.json --exclude=composer.lock -C public_html
        
        cd public_html
        
        # Recreate storage directory structure since we excluded it
        mkdir -p storage/app/public storage/framework/cache/data storage/framework/sessions storage/framework/views storage/logs
        chmod -R 775 storage bootstrap/cache
        
        cp .env.example .env
        sed -i "s/DB_DATABASE=.*/DB_DATABASE=u881397359_bdnsi/g" .env
        sed -i "s/DB_USERNAME=.*/DB_USERNAME=u881397359_bdnsi/g" .env
        sed -i "s/DB_PASSWORD=.*/DB_PASSWORD=NJnaeem11./g" .env
        sed -i "s/APP_ENV=.*/APP_ENV=production/g" .env
        sed -i "s/APP_DEBUG=.*/APP_DEBUG=false/g" .env
        
        # Run composer install
        composer install --no-dev --optimize-autoloader --ignore-platform-reqs
        
        # Clear caches
        php artisan config:cache
        php artisan route:cache
        php artisan view:cache
        
        # Database import
        cd ${REMOTE_DIR}
        mysql -u u881397359_bdnsi -p'NJnaeem11.' u881397359_bdnsi < ${SQL_FILE}
        
        echo "Deployment script finished."
      `;
      
      conn.exec(commands, (err, stream) => {
        if (err) throw err;
        stream.on('close', (code, signal) => {
          console.log('SSH commands finished with code ' + code);
          conn.end();
        }).on('data', (data) => {
          console.log('STDOUT: ' + data);
        }).stderr.on('data', (data) => {
          console.log('STDERR: ' + data);
        });
      });
    }).connect(config);

  } catch (err) {
    console.error('Deployment failed:', err);
    sftp.end();
  }
}

deploy();
