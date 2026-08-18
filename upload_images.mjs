import Client from 'ssh2-sftp-client';
import fs from 'fs';

const config = {
  host: '145.79.212.19',
  port: 65002,
  username: 'u881397359',
  password: 'NJnaeem11.'
};

async function run() {
  const sftp = new Client();
  try {
    console.log('Connecting SFTP...');
    await sftp.connect(config);
    
    console.log('Uploading storage_public.tar.gz...');
    await sftp.fastPut('storage_public.tar.gz', '/home/u881397359/domains/nenobet.live/public_html/storage_public.tar.gz');

    await sftp.end();
    console.log('SFTP Uploads finished.');
  } catch (e) {
    console.error(e);
  }
}

run();
