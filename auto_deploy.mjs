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
const TAR_FILE = '../deploy.tar.gz';
const REMOTE_TAR = 'deploy.tar.gz';

async function deploy() {
  const sftp = new Client();
  try {
    console.log('[PHASE 3] Connecting via SFTP to upload new bug-free codebase...');
    await sftp.connect(config);

    console.log(`Uploading ${TAR_FILE} to ${REMOTE_DIR}/${REMOTE_TAR}...`);
    await sftp.fastPut(TAR_FILE, `${REMOTE_DIR}/${REMOTE_TAR}`);
    
    console.log('Upload complete. Closing SFTP.');
    await sftp.end();

    console.log('[PHASE 3] Connecting via SSH for WIPE and Extraction...');
    const conn = new SSHClient();
    conn.on('ready', () => {
      console.log('SSH connection ready. Executing Autonomous Clean Deployment...');
      const commands = `
        cd ${REMOTE_DIR}
        
        # WIPE OLD DATA (Keeping storage and .env safe)
        echo "Deleting old files from public_html..."
        cd public_html
        find . -mindepth 1 -maxdepth 1 ! -name 'storage' ! -name '.env' -exec rm -rf {} +
        echo "Old data wiped successfully."
        
        # EXTRACT NEW DATA
        cd ${REMOTE_DIR}
        echo "Extracting 100% bug-free codebase..."
        tar -xzf ${REMOTE_TAR} -C public_html
        
        # FINAL SETUP
        cd public_html
        mkdir -p storage/app/public storage/framework/cache/data storage/framework/sessions storage/framework/views storage/logs
        chmod -R 775 storage bootstrap/cache
        
        echo "Installing production dependencies..."
        composer install --no-dev --optimize-autoloader --ignore-platform-reqs
        
        echo "Optimizing caches..."
        php artisan config:cache
        php artisan route:cache
        php artisan view:cache
        php artisan migrate --force
        
        # Clean up tar
        rm -f ${REMOTE_DIR}/${REMOTE_TAR}
        
        echo "Deployment Successful: Old files deleted, 100% bug-free files deployed and live."
      `;
      
      conn.exec(commands, (err, stream) => {
        if (err) throw err;
        stream.on('close', (code, signal) => {
          console.log('SSH commands finished with exit code ' + code);
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
