const ftp = require("basic-ftp");
const path = require("path");

async function deploy() {
    const client = new ftp.Client();
    client.ftp.verbose = true;
    try {
        console.log("Connecting...");
        await client.access({
            host: "145.79.212.19",
            user: "u881397359",
            password: "NJnaeem11.",
            secure: false
        });
        console.log("Connected!");

        // Upload routes/web.php
        await client.cd("domains/nenobet.live/public_html/routes");
        await client.uploadFrom("routes/web.php", "web.php");
        console.log("Uploaded web.php");

        // We can upload public/build directly!
        await client.cd("../public");
        try {
            await client.removeDir("build"); // This might fail if dir doesn't exist or not empty, but we can just overwrite
        } catch(e) {}
        await client.ensureDir("build");
        await client.uploadFromDir("public/build");
        console.log("Uploaded public/build");

        // Wait, what about app/Http/Controllers/Admin/ResultController.php and others?
        // We have to upload ALL the changed files manually if git pull fails!
        const filesToUpload = [
            "app/Http/Controllers/Admin/ResultController.php",
            "app/Models/SemesterResult.php",
            "app/Services/DocumentGeneratorService.php",
            "database/migrations/2026_08_08_164033_create_semester_results_table.php",
        ];

        await client.cd(".."); // back to public_html
        for (const file of filesToUpload) {
            const remoteDir = path.dirname(file).replace(/\\/g, '/');
            const fileName = path.basename(file);
            await client.cd(remoteDir);
            await client.uploadFrom(file, fileName);
            console.log(`Uploaded ${file}`);
            await client.cd("domains/nenobet.live/public_html"); // reset path
        }
        
    } catch(err) {
        console.error("FTP Error:", err);
    }
    client.close();
}

deploy();
