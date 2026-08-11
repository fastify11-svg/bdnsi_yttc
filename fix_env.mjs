import { Client as SSHClient } from 'ssh2';

const config = {
  host: '145.79.212.19',
  port: 65002,
  username: 'u881397359',
  password: 'NJnaeem11.'
};

const REMOTE_DIR = '/home/u881397359/domains/nenobet.live/public_html';

async function fixEnv() {
  const conn = new SSHClient();
  conn.on('ready', () => {
    console.log('SSH connection ready. Fixing .env...');
    const commands = `
      cd ${REMOTE_DIR}
      
      # Restore live database credentials
      sed -i "s/DB_DATABASE=.*/DB_DATABASE=u881397359_bdnsi/g" .env
      sed -i "s/DB_USERNAME=.*/DB_USERNAME=u881397359_bdnsi/g" .env
      sed -i "s/DB_PASSWORD=.*/DB_PASSWORD=NJnaeem11./g" .env
      sed -i "s/APP_ENV=.*/APP_ENV=production/g" .env
      sed -i "s/APP_DEBUG=.*/APP_DEBUG=false/g" .env
      
      echo "Optimizing caches..."
      php artisan config:clear
      php artisan cache:clear
      php artisan config:cache
      
      echo "ENV Fixed!"
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
}

fixEnv();
