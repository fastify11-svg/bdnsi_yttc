const axios = require('axios');
const https = require('https');

async function runE2E() {
    const api = axios.create({
        baseURL: 'https://nenobet.live',
        withCredentials: true,
        httpsAgent: new https.Agent({ rejectUnauthorized: false }),
    });

    let cookies = [];
    let csrfToken = '';
    let xsrfToken = '';

    // 1. Get CSRF cookie and token
    try {
        console.log('Fetching login page for CSRF token...');
        const res = await api.get('/admin/login');
        if (res.headers['set-cookie']) {
            res.headers['set-cookie'].forEach(c => {
                let parts = c.split(';')[0];
                cookies.push(parts);
                if (parts.startsWith('XSRF-TOKEN=')) {
                    xsrfToken = decodeURIComponent(parts.split('=')[1]);
                }
            });
        }
        // extract _token from html
        const match = res.data.match(/name="_token" value="([^"]+)"/);
        if (match) {
            csrfToken = match[1];
        }
        console.log('CSRF Token extracted:', csrfToken ? 'Yes' : 'No');
        console.log('XSRF Token extracted:', xsrfToken ? 'Yes' : 'No');
    } catch(err) {
        console.error('Error fetching login:', err.message);
        return;
    }

    // 2. Submit Login
    try {
        console.log('Attempting login...');
        const loginRes = await api.post('/admin/login', {
            email: 'admin@gmail.com',
            password: '12345678',
        }, {
            headers: {
                'Cookie': cookies.join('; '),
                'X-XSRF-TOKEN': xsrfToken,
                'Content-Type': 'application/json'
            }
        });
        
        console.log('Login request status: ' + loginRes.status);
    } catch (err) {
        if(err.response && err.response.status === 302) {
             console.log('Login successful (302 Redirect)');
             if (err.response.headers['set-cookie']) {
                 err.response.headers['set-cookie'].forEach(c => {
                    let parts = c.split(';')[0];
                    if(!cookies.includes(parts)) {
                        cookies.push(parts);
                    }
                });
             }
        } else {
             console.log('Login failed', err.message);
             return;
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
        console.log('Component Loaded:', pageData.component);
        console.log('Checking props...');
        // Let's also check if we can submit a fake result!
        console.log('Props keys:', Object.keys(pageData.props));
        
        // Wait, did the javascript bundle update? We can check the URL of the JS bundle on the live server.
        const htmlRes = await api.get('/admin/result/create', {
            headers: {
                'Cookie': cookies.join('; ')
            }
        });
        const html = htmlRes.data;
        if(html.includes('Publish Semester Results (Auto-Generate based on CGPA)')) {
            console.log('SUCCESS: New checkbox text found in the raw HTML bundle! Live server IS deployed!');
        } else {
            console.log('WARNING: The text was not found. Either it is packed in JS and not directly in HTML, or not deployed.');
        }

    } catch(err) {
         console.log('Error fetching create page:', err.response ? err.response.status : err.message);
    }
}

runE2E();
