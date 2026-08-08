const { Client } = require('ssh2');
const conn = new Client();
conn.on('ready', () => {
  conn.exec('tail -n 250 /home/u881397359/domains/nenobet.live/public_html/storage/logs/laravel.log | grep -A 5 -i "local.ERROR"', (err, stream) => {
    if (err) throw err;
    stream.on('close', () => { conn.end(); })
          .on('data', data => { console.log(data.toString()); })
          .stderr.on('data', data => { console.error(data.toString()); });
  });
}).connect({host: '145.79.212.19', port: 65002, username: 'u881397359', password: 'NJnaeem11.'});
