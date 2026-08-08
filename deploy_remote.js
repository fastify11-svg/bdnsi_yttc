const { Client } = require('ssh2');

const conn = new Client();
const remoteBaseDir = '/home/u881397359/domains/nenobet.live/public_html';

conn.on('ready', () => {
    console.log('Client :: ready');
    
    // Commands to run
    const commands = [
        `cd ${remoteBaseDir}`,
        `unzip -o update.zip`,
        `php artisan migrate --force`,
        `rm update.zip`
    ].join(' && ');

    conn.exec(commands, (err, stream) => {
        if (err) throw err;
        
        stream.on('close', (code, signal) => {
            console.log('Stream :: close :: code: ' + code + ', signal: ' + signal);
            conn.end();
        }).on('data', (data) => {
            console.log('STDOUT: ' + data);
        }).stderr.on('data', (data) => {
            console.error('STDERR: ' + data);
        });
    });
}).connect({
    host: '145.79.212.19',
    port: 65002,
    username: 'u881397359',
    password: 'NJnaeem11.'
});
