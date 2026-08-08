const { Client } = require('ssh2');

const conn = new Client();
const remoteZipPath = '/home/u881397359/domains/nenobet.live/public_html/storage_public.zip';
const localZipPath = 'C:\\xampp\\htdocs\\BDNSI\\storage_public.zip';

conn.on('ready', () => {
    console.log('Client :: ready');
    conn.sftp((err, sftp) => {
        if (err) throw err;
        
        console.log('Uploading zip file...');
        sftp.fastPut(localZipPath, remoteZipPath, (err) => {
            if (err) throw err;
            console.log('Upload complete. Unzipping...');
            
            conn.exec('cd /home/u881397359/domains/nenobet.live/public_html && unzip -o storage_public.zip -d storage/app/public && rm storage_public.zip && php artisan storage:link', (err, stream) => {
                if (err) throw err;
                stream.on('close', () => {
                    console.log('Unzip and link complete!');
                    conn.end();
                }).on('data', (data) => {
                    console.log('STDOUT: ' + data);
                }).stderr.on('data', (data) => {
                    console.error('STDERR: ' + data);
                });
            });
        });
    });
}).connect({
    host: '145.79.212.19',
    port: 65002,
    username: 'u881397359',
    password: 'NJnaeem11.'
});
