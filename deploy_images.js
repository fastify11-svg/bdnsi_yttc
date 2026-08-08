const { Client } = require('ssh2'); 
const fs = require('fs');

const conn = new Client(); 
conn.on('ready', () => { 
    console.log('Client :: ready');
    conn.sftp((err, sftp) => {
        if (err) throw err;
        
        console.log('SFTP started');
        const remoteZip = '/home/u881397359/domains/nenobet.live/public_html/storage_public.zip';
        const localZip = 'storage_public.zip';
        
        sftp.fastPut(localZip, remoteZip, (err) => {
            if (err) throw err;
            console.log('storage_public.zip uploaded');
            
            // Now extract zip
            const cmd = `cd /home/u881397359/domains/nenobet.live/public_html && mkdir -p storage/app/public && unzip -o storage_public.zip -d storage/app/public/ && rm storage_public.zip && php artisan storage:link`;
            conn.exec(cmd, (err, stream) => {
                if (err) throw err;
                stream.on('close', (code, signal) => { 
                    console.log('Unzip code: ' + code);
                    conn.end(); 
                }).on('data', (data) => { 
                    process.stdout.write(data); 
                }).stderr.on('data', (data) => { 
                    process.stderr.write(data); 
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
