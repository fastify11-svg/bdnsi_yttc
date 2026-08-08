const fs = require('fs');
const path = require('path');
const { Client } = require('ssh2');

const conn = new Client();
const remoteBaseDir = '/home/u881397359/domains/nenobet.live/public_html';
const localBaseDir = 'C:\\xampp\\htdocs\\BDNSI';

const filesToUpload = [
    'app/Http/Controllers/Admin/ResultController.php',
    'app/Models/SemesterResult.php',
    'app/Models/Student.php',
    'app/Services/DocumentGeneratorService.php',
    'resources/js/Pages/Admin/Result/Create.jsx',
    'resources/views/admin/document_template/preview.blade.php',
    'database/migrations/2026_08_08_164033_create_semester_results_table.php'
];

function getFiles(dir, files = []) {
    const fileList = fs.readdirSync(dir);
    for (const file of fileList) {
        const name = dir + '/' + file;
        if (fs.statSync(name).isDirectory()) {
            getFiles(name, files);
        } else {
            files.push(name);
        }
    }
    return files;
}

const buildDir = path.join(localBaseDir, 'public/build');
const buildFilesLocal = getFiles(buildDir);
const buildFilesRelative = buildFilesLocal.map(f => path.relative(localBaseDir, f).replace(/\\/g, '/'));
filesToUpload.push(...buildFilesRelative);

conn.on('ready', () => {
    console.log('Client :: ready');
    conn.sftp((err, sftp) => {
        if (err) throw err;
        
        let i = 0;
        function uploadNext() {
            if (i >= filesToUpload.length) {
                console.log('All files uploaded successfully.');
                conn.exec(`cd ${remoteBaseDir} && php artisan tinker --execute="Schema::dropIfExists('semester_results'); DB::table('migrations')->where('migration', 'like', '%create_semester_results_table%')->delete();" && php artisan migrate --force`, (err, stream) => {
                    stream.on('close', () => {
                        conn.end();
                    }).on('data', (data) => {
                        console.log('MIGRATE: ' + data);
                    }).stderr.on('data', (data) => {
                        console.error('MIGRATE ERR: ' + data);
                    });
                });
                return;
            }
            
            const file = filesToUpload[i];
            const localPath = path.join(localBaseDir, file);
            const remotePath = remoteBaseDir + '/' + file;
            
            sftp.fastPut(localPath, remotePath, (err) => {
                if (err) {
                    console.error('Error uploading ' + file, err.message);
                    // If directory missing error (2), we could handle it, but paths should exist except maybe build/assets
                    const remoteDir = path.posix.dirname(remotePath);
                    conn.exec(`mkdir -p "${remoteDir}"`, (err, stream) => {
                        stream.on('close', () => {
                            sftp.fastPut(localPath, remotePath, (err) => {
                                console.log('Uploaded after mkdir: ' + file);
                                i++;
                                uploadNext();
                            });
                        });
                    });
                } else {
                    console.log('Uploaded: ' + file);
                    i++;
                    uploadNext();
                }
            });
        }
        
        uploadNext();
    });
}).connect({
    host: '145.79.212.19',
    port: 65002,
    username: 'u881397359',
    password: 'NJnaeem11.'
});
