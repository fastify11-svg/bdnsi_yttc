const { Client } = require('ssh2');

const conn = new Client();
const localFile = 'C:\\xampp\\htdocs\\BDNSI\\update.zip';
const remoteFile = '/home/u881397359/domains/nenobet.live/public_html/update.zip';

conn.on('ready', () => {
    console.log('Client :: ready');
    conn.sftp((err, sftp) => {
        if (err) throw err;
        
        console.log('Uploading update.zip...');
        sftp.fastPut(localFile, remoteFile, (err) => {
            if (err) {
                console.error('Error uploading:', err);
            } else {
                console.log('Upload successful!');
            }
            conn.end();
        });
    });
}).connect({
    host: '145.79.212.19',
    port: 65002,
    username: 'u881397359',
    password: 'NJnaeem11.'
});
