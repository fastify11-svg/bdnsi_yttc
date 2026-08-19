import { Client as SSHClient } from 'ssh2';

const config = {
  host: '145.79.212.19',
  port: 65002,
  username: 'u881397359',
  password: 'NJnaeem11.'
};

const REMOTE_DIR = '/home/u881397359/domains/nenobet.live/public_html';

async function migrate() {
  return new Promise((resolve, reject) => {
    const conn = new SSHClient();
    conn.on('ready', () => {
      console.log('[SSH] Connected. Running migration...');

      const commands = `
        cd ${REMOTE_DIR}
        php artisan migrate --path=database/migrations/2026_08_19_004917_add_is_builtin_and_blade_view_to_document_templates_table.php --force 2>&1
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

migrate()
  .then(code => {
    console.log('Migrate finished with code', code);
    process.exit(code);
  })
  .catch(err => {
    console.error('Migrate error:', err);
    process.exit(1);
  });
