const fs = require('fs');
const ftp = require('basic-ftp');
const { Client } = require('ssh2');
require('dotenv').config();

async function main() {
    const sftp = new ftp.Client();
    sftp.ftp.verbose = true;
    try {
        console.log('Connecting SFTP...');
        await sftp.access({
            host: process.env.FTP_HOST,
            user: process.env.FTP_USER,
            password: process.env.FTP_PASSWORD,
            secure: false
        });
        
        console.log('Uploading SQL dump...');
        await sftp.fastPut('latest_bdnsi_working_db.sql', '/home/u881397359/domains/nenobet.live/latest_bdnsi_working_db.sql');
        await sftp.close();
        console.log('SFTP Uploads finished.');
        
        console.log('Connecting SSH...');
        const conn = new Client();
        conn.on('ready', () => {
            console.log('SSH Ready');
            const script = `
                cd /home/u881397359/domains/nenobet.live
                echo "Importing SQL..."
                mysql -u u881397359_bdnsi -p'NJnaeem11.' u881397359_bdnsi < latest_bdnsi_working_db.sql
                echo "DONE!"
            `;
            conn.exec(script, (err, stream) => {
                if (err) throw err;
                stream.on('close', (code, signal) => {
                    console.log('SSH Finished with code ' + code);
                    conn.end();
                }).on('data', (data) => {
                    console.log('STDOUT: ' + data);
                }).stderr.on('data', (data) => {
                    console.log('STDERR: ' + data);
                });
            });
        }).connect({
            host: process.env.FTP_HOST,
            port: process.env.SSH_PORT,
            username: process.env.FTP_USER,
            password: process.env.FTP_PASSWORD
        });
    } catch(err) {
        console.error(err);
    }
}
main();
