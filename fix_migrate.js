const { Client } = require('ssh2');

const config = {
  host: '145.79.212.19',
  port: 65002,
  username: 'u881397359',
  password: 'NJnaeem11.'
};

const conn = new Client();
conn.on('ready', () => {
    const script = `
        cd /home/u881397359/domains/nenobet.live/public_html
        php artisan migrate --force
    `;
    conn.exec(script, (err, stream) => {
        if (err) throw err;
        stream.on('close', (code, signal) => {
            conn.end();
        }).on('data', (data) => {
            process.stdout.write(data);
        }).stderr.on('data', (data) => {
            process.stderr.write(data);
        });
    });
}).connect(config);
