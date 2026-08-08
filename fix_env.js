const { Client } = require('ssh2'); 
const conn = new Client(); 
conn.on('ready', () => { 
  const cmd = `sed -i "s/CACHE_DRIVER=redis/CACHE_DRIVER=file/g" /home/u881397359/domains/nenobet.live/public_html/.env && sed -i "s/QUEUE_CONNECTION=redis/QUEUE_CONNECTION=sync/g" /home/u881397359/domains/nenobet.live/public_html/.env && sed -i "s,APP_URL=http://localhost,APP_URL=https://nenobet.live,g" /home/u881397359/domains/nenobet.live/public_html/.env && cd /home/u881397359/domains/nenobet.live/public_html && php artisan key:generate && php artisan optimize:clear`;
  conn.exec(cmd, (err, stream) => { 
    if(err) throw err;
    stream.on('close', () => { conn.end(); }).on('data', data => { console.log(data.toString()); }).stderr.on('data', data => { console.error(data.toString()); }); 
  }); 
}).connect({host: '145.79.212.19', port: 65002, username: 'u881397359', password: 'NJnaeem11.'});
