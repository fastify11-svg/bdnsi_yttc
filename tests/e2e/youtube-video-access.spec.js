import { test, expect } from '@playwright/test';

test('Test Youtube Video Page Access', async ({ page }) => {
    // Navigate to admin login
    await page.goto('http://127.0.0.1:8000/admin/login');
    
    // Fill credentials
    await page.fill('input[name="email"]', 'admin@gmail.com');
    await page.fill('input[name="password"]', '12345678');
    
    // Click submit and wait for navigation
    await Promise.all([
        page.waitForNavigation(),
        page.click('button[type="submit"]')
    ]);

    // Go to youtube video page
    const response = await page.goto('http://127.0.0.1:8000/admin/youtube-video');
    expect(response.status()).toBe(200);

    // Verify it doesn't say "403" or something
    const bodyText = await page.innerText('body');
    if (bodyText.includes('403') && bodyText.includes('Forbidden')) {
        throw new Error('Access Denied 403 detected on page');
    }
    
    console.log("SUCCESS: Accessed youtube-video page");
});
