import { Client as SSHClient } from 'ssh2';

const config = {
  host: '145.79.212.19',
  port: 65002,
  username: 'u881397359',
  password: 'NJnaeem11.'
};

const REMOTE_DIR = '/home/u881397359/domains/nenobet.live/public_html';

async function checkDb() {
  return new Promise((resolve, reject) => {
    const conn = new SSHClient();
    conn.on('ready', () => {
      console.log('[SSH] Connected. Checking DB...');

      const commands = `
        cd ${REMOTE_DIR}
        php artisan tinker --execute="echo \\App\\Models\\DocumentTemplate::where('is_builtin', 1)->count(); echo '\\n';" 2>&1
      `;

      conn.exec(commands, (err, stream) => {
        if (err) { reject(err); return; }
        stream.on('close', (code) => {
          console.log('SSH finished, exit code: ' + code);
          conn.end();
          resolve(code);
        }).on('data', (data) => {
          process.stdout.write('STDOUT: ' + data);
        }).stderr.on('data', (data) => {
          process.stdout.write('STDERR: ' + data);
        });
      });
    }).on('error', reject).connect(config);
  });
}

checkDb()
  .then(code => {
    console.log('Check finished with code', code);
    process.exit(code);
  })
  .catch(err => {
    console.error('Check error:', err);
    process.exit(1);
  });
