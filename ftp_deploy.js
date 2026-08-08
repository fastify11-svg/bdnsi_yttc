const ftp = require("basic-ftp");
const path = require("path");

async function deploy() {
    const client = new ftp.Client();
    client.ftp.verbose = true;
    try {
        await client.access({
            host: "145.79.212.19",
            user: "u881397359",
            password: "NJnaeem11.",
            secure: false
        });
        
        console.log("FTP connected!");
        
        // Go to public_html
        await client.cd("domains/nenobet.live/public_html");
        
        // Upload Welcome.jsx
        await client.uploadFrom("resources/js/Pages/Welcome.jsx", "resources/js/Pages/Welcome.jsx");
        console.log("Uploaded Welcome.jsx");
        
        // Upload public_build.zip
        await client.uploadFrom("public_build.zip", "public_build.zip");
        console.log("Uploaded public_build.zip");
        
    }
    catch(err) {
        console.log(err);
    }
    client.close();
}

deploy();
