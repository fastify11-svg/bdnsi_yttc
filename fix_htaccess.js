const Client = require('ssh2-sftp-client');
const sftp = new Client();
async function fixHtaccess() {
  await sftp.connect({host: '145.79.212.19', port: 65002, username: 'u881397359', password: 'NJnaeem11.'});
  const remotePath = '/home/u881397359/domains/nenobet.live/public_html/.htaccess';
  const data = await sftp.get(remotePath);
  let content = data.toString();
  content = content.replace('RewriteRule ^(.*)$ public/ [L]', 'RewriteRule ^(.*)$ public/$1 [L]');
  await sftp.put(Buffer.from(content), remotePath);
  console.log('Fixed .htaccess successfully!');
  await sftp.end();
}
fixHtaccess().catch(console.error);
