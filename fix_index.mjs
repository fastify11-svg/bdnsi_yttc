import { Client as SSHClient } from 'ssh2';

const config = {
  host: '145.79.212.19',
  port: 65002,
  username: 'u881397359',
  password: 'NJnaeem11.'
};

const conn = new SSHClient();
conn.on('ready', () => {
  console.log('SSH Ready');
  const cmds = `
    cd /home/u881397359/domains/nenobet.live/public_html
    sed -i "s|->bind('path.public'|\\\\$app->bind('path.public'|g" index.php
  `;
  conn.exec(cmds, (err, stream) => {
    if(err) throw err;
    stream.on('close', (code) => {
      console.log('SSH Finished with code ' + code);
      conn.end();
    }).on('data', data => console.log('STDOUT: ' + data))
      .stderr.on('data', data => console.error('STDERR: ' + data));
  });
}).connect(config);
