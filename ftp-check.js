const ftp = require('basic-ftp');
async function run() {
    const client = new ftp.Client();
    try {
        await client.access({
            host: '145.79.212.19',
            user: 'u881397359',
            password: 'NJnaeem11.',
            secure: false
        });
        await client.uploadFrom('check.php', 'domains/nenobet.live/public_html/check.php');
        console.log('Upload success');
    } catch(err) {
        console.error(err);
    }
    client.close();
}
run();
