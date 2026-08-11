import Client from 'ssh2-sftp-client';

const config = {
  host: '145.79.212.19',
  port: 65002,
  username: 'u881397359',
  password: 'NJnaeem11.'
};

async function fix() {
  const sftp = new Client();
  try {
    await sftp.connect(config);
    console.log('Uploading .htaccess...');
    await sftp.fastPut('.htaccess', '/home/u881397359/domains/nenobet.live/public_html/.htaccess');
    
    console.log('Uploading root_index.php -> index.php...');
    await sftp.fastPut('root_index.php', '/home/u881397359/domains/nenobet.live/public_html/index.php');
    
    console.log('Upload complete.');
    await sftp.end();
  } catch (err) {
    console.error('Failed:', err);
    sftp.end();
  }
}

fix();
