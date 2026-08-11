import { Client } from 'ssh2';

const conn = new Client();

conn.on('ready', () => {
  console.log('Client :: ready');
  const commands = `
    tail -n 50 /home/u881397359/domains/nenobet.live/public_html/storage/logs/laravel.log
  `;
  conn.exec(commands, (err, stream) => {
    if (err) throw err;
    stream.on('close', (code, signal) => {
      console.log('Stream :: close :: code: ' + code);
      conn.end();
    }).on('data', (data) => {
      console.log('STDOUT: ' + data);
    }).stderr.on('data', (data) => {
      console.log('STDERR: ' + data);
    });
  });
}).connect({
  host: '145.79.212.19',
  port: 65002,
  username: 'u881397359',
  password: 'NJnaeem11.'
});
