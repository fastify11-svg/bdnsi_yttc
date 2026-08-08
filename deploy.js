const { Client } = require('ssh2'); 
const fs = require('fs');

const conn = new Client(); 
conn.on('ready', () => { 
    console.log('Client :: ready');
    conn.sftp((err, sftp) => {
        if (err) throw err;
        
        console.log('SFTP started');
        const remoteWelcome = '/home/u881397359/domains/nenobet.live/public_html/resources/js/Pages/Welcome.jsx';
        const localWelcome = 'resources/js/Pages/Welcome.jsx';
        
        const remoteZip = '/home/u881397359/domains/nenobet.live/public_html/public_build.zip';
        const localZip = 'public_build.zip';
        
        sftp.fastPut(localWelcome, remoteWelcome, (err) => {
            if (err) throw err;
            console.log('Welcome.jsx uploaded');
            
            sftp.fastPut(localZip, remoteZip, (err) => {
                if (err) throw err;
                console.log('public_build.zip uploaded');
                
                // Now extract zip
                conn.exec(`cd /home/u881397359/domains/nenobet.live/public_html && unzip -o public_build.zip -d public/build/ && rm public_build.zip`, (err, stream) => {
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
    });
}).connect({
    host: '145.79.212.19', 
    port: 65002, 
    username: 'u881397359', 
    password: 'NJnaeem11.'
});
