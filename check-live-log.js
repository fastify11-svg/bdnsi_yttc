const { exec } = require('child_process');
exec('sshpass -p "NJnaeem11." ssh -p 65002 -o StrictHostKeyChecking=no u881397359@145.79.212.19 "cat domains/nenobet.live/public_html/storage/logs/laravel.log | tail -n 50"', (error, stdout, stderr) => {
    console.log(stdout);
    if (error) console.error(stderr);
});
