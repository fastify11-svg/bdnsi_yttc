const Client = require('ssh2').Client;
const conn = new Client();
conn.on('ready', () => {
  const cmds = `df -h`;
  conn.exec(cmds, (err, stream) => {
    if (err) throw err;
    stream.on('close', (code) => {
      conn.end();
    }).on('data', data => console.log(data.toString()))
      .stderr.on('data', data => console.error(data.toString()));
  });
}).connect({
  host: '145.79.212.19',
  port: 65002,
  username: 'u881397359',
  password: 'NJnaeem11.'
});
