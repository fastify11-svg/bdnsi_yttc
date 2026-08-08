const fs = require('fs');
const path = require('path');
const { Client } = require('ssh2');

const conn = new Client();
const remoteBaseDir = '/home/u881397359/domains/nenobet.live/public_html/storage/app/public';
const localBaseDir = 'C:\\xampp\\htdocs\\BDNSI\\storage\\app\\public';

function getFiles(dir, files = []) {
    const fileList = fs.readdirSync(dir);
    for (const file of fileList) {
        const name = path.join(dir, file);
        if (fs.statSync(name).isDirectory()) {
            getFiles(name, files);
        } else {
            files.push(name);
        }
    }
    return files;
}

const allLocalFiles = getFiles(localBaseDir);
const filesToUpload = allLocalFiles.map(f => path.relative(localBaseDir, f).replace(/\\/g, '/'));

conn.on('ready', () => {
    console.log('Client :: ready');
    conn.sftp((err, sftp) => {
        if (err) throw err;
        
        let i = 0;
        let successCount = 0;
        let errorCount = 0;

        function uploadNext() {
            if (i >= filesToUpload.length) {
                console.log(`Finished. Uploaded: ${successCount}, Errors: ${errorCount}`);
                conn.exec('cd /home/u881397359/domains/nenobet.live/public_html && php artisan storage:link', (err, stream) => {
                    if(err) {
                        console.error("Link error:", err);
                        conn.end();
                        return;
                    }
                    stream.on('close', () => {
                        conn.end();
                    }).on('data', (data) => {
                        console.log('LINK: ' + data);
                    }).stderr.on('data', (data) => {
                        console.error('LINK ERR: ' + data);
                    });
                });
                return;
            }
            
            const file = filesToUpload[i];
            const localPath = path.join(localBaseDir, file);
            const remotePath = remoteBaseDir + '/' + file;
            
            sftp.fastPut(localPath, remotePath, (err) => {
                if (err) {
                    // Try to create directory
                    const remoteDir = path.posix.dirname(remotePath);
                    conn.exec(`mkdir -p "${remoteDir}"`, (err, stream) => {
                        stream.on('close', () => {
                            sftp.fastPut(localPath, remotePath, (err2) => {
                                if (err2) {
                                    console.error('Failed to upload even after mkdir: ' + file, err2.message);
                                    errorCount++;
                                } else {
                                    console.log('Uploaded after mkdir: ' + file);
                                    successCount++;
                                }
                                i++;
                                uploadNext();
                            });
                        });
                    });
                } else {
                    console.log('Uploaded: ' + file);
                    successCount++;
                    i++;
                    uploadNext();
                }
            });
        }
        
        console.log(`Starting upload of ${filesToUpload.length} files...`);
        uploadNext();
    });
}).connect({
    host: '145.79.212.19',
    port: 65002,
    username: 'u881397359',
    password: 'NJnaeem11.'
});
