const axios = require('axios');
const https = require('https');

async function runE2E() {
    const api = axios.create({
        baseURL: 'https://nenobet.live',
        withCredentials: true,
        httpsAgent: new https.Agent({ rejectUnauthorized: false }),
    });

    let cookies = [];

    // 1. Get CSRF cookie and token
    try {
        console.log('Fetching login page for CSRF token...');
        const res = await api.get('/admin/login');
        if (res.headers['set-cookie']) {
            cookies = cookies.concat(res.headers['set-cookie'].map(c => c.split(';')[0]));
        }
    } catch(err) {
        console.error('Error fetching login:', err.message);
    }

    // 2. Submit Login
    try {
        console.log('Attempting login...');
        const loginRes = await api.post('/admin/login', {
            email: 'admin@gmail.com',
            password: 'password', // wait, earlier it was 12345678, let me try 12345678
        }, {
            headers: {
                'Cookie': cookies.join('; '),
                'Content-Type': 'application/json'
            }
        });
        if (loginRes.headers['set-cookie']) {
            cookies = cookies.concat(loginRes.headers['set-cookie'].map(c => c.split(';')[0]));
        }
        console.log('Login request successful (Status: ' + loginRes.status + ')');
    } catch (err) {
        if(err.response && err.response.status === 302) {
             console.log('Login successful (302 Redirect)');
             if (err.response.headers['set-cookie']) {
                 cookies = cookies.concat(err.response.headers['set-cookie'].map(c => c.split(';')[0]));
             }
        } else {
             console.log('Login failed', err.message);
        }
    }

    // 3. Go to Create Result page as Inertia request
    try {
        console.log('Fetching Create Result page via Inertia...');
        const res2 = await api.get('/admin/result/create', {
            headers: {
                'Cookie': cookies.join('; '),
                'X-Inertia': 'true',
                'X-Inertia-Version': ''
            }
        });
        const pageData = res2.data;
        console.log('Component:', pageData.component);
        // We can check if it's updated. Wait, Inertia data-page won't contain the React source, it just tells which component to load!
        // So the frontend script needs to be checked.
        // Let's just fetch the raw HTML to see if our updated JS is served.
    } catch(err) {
         console.log('Error fetching create page:', err.message);
    }
    
    // Better yet: test if the fix_db.php exists!
    try {
        const checkFix = await api.get('/fix_db.php');
        console.log('fix_db.php output:', checkFix.data);
    } catch(e) {
        console.log('fix_db.php not found (404)');
    }
}

runE2E();
