const puppeteer = require('puppeteer');

(async () => {
    const browser = await puppeteer.launch();
    const page = await browser.newPage();
    
    // 1. Go to Admin Login
    console.log('Navigating to Admin Login...');
    await page.goto('http://localhost:8000/admin/login');
    
    // 2. Login
    console.log('Logging in as Admin...');
    await page.type('input[name="email"]', 'admin@gmail.com');
    await page.type('input[name="password"]', '12345678');
    await page.click('button[type="submit"]');
    await page.waitForNavigation();
    
    // 3. Create Notice
    console.log('Creating a dummy Notice...');
    await page.goto('http://localhost:8000/admin/notice/create');
    await page.waitForSelector('textarea[name="details"]');
    
    const uniqueNotice = 'TEST_NOTICE_' + Date.now();
    await page.type('textarea[name="details"]', uniqueNotice);
    
    // Submit form (assuming standard button)
    await page.evaluate(() => {
        const buttons = Array.from(document.querySelectorAll('button'));
        const submitBtn = buttons.find(b => b.textContent.includes('Save') || b.textContent.includes('Submit') || b.type === 'submit');
        if (submitBtn) submitBtn.click();
    });
    
    // Wait for the save action to complete
    await new Promise(r => setTimeout(r, 2000));
    
    // 4. Verify Frontend
    console.log('Visiting frontend to verify notice sync...');
    await page.goto('http://localhost:8000/');
    
    const pageText = await page.evaluate(() => document.body.innerText);
    if (pageText.includes(uniqueNotice)) {
        console.log('✅ TEST PASSED: Frontend synced with Admin portal instantly.');
    } else {
        console.log('❌ TEST FAILED: Notice not found on frontend! Possible caching issue.');
        process.exitCode = 1;
    }
    
    await browser.close();
})();
