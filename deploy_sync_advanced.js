const SftpClient = require('ssh2-sftp-client');
const fs = require('fs');
const path = require('path');

const sftp = new SftpClient();

const config = {
  host: '145.79.212.19',
  port: 65002,
  username: 'u881397359',
  password: 'NJnaeem11.'
};

const REMOTE_DIR = '/home/u881397359/domains/nenobet.live/public_html';
const LOCAL_DIR = 'C:/xampp/htdocs/BDNSI';

const filesToUpload = [
    'resources/js/Pages/Admin/DocumentTemplate/Create.jsx',
    'resources/views/admin/document_template/preview.blade.php',
    'app/Http/Controllers/Admin/StudentController.php',
    'database/seeders/LegacyDocumentTemplateSeeder.php'
];

async function uploadDir(localPath, remotePath) {
    if (fs.existsSync(localPath)) {
        console.log(`Uploading directory: ${localPath} to ${remotePath}`);
        await sftp.uploadDir(localPath, remotePath);
    }
}

async function main() {
    try {
        await sftp.connect(config);
        console.log('Connected to SFTP');

        for (const file of filesToUpload) {
            const localFile = path.join(LOCAL_DIR, file);
            const remoteFile = `${REMOTE_DIR}/${file}`;
            console.log(`Uploading ${file}...`);
            await sftp.put(localFile, remoteFile);
        }

        // Upload built assets
        await uploadDir(path.join(LOCAL_DIR, 'public/build'), `${REMOTE_DIR}/public/build`);

        console.log('Upload complete!');
    } catch (err) {
        console.error('Error during upload:', err);
    } finally {
        sftp.end();
    }
}

main();
