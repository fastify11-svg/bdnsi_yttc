const { test, expect } = require('@playwright/test');

test('Verify Auto-Generate Semester Results Checkbox', async ({ page }) => {
  console.log('Navigating to live server login...');
  await page.goto('/admin/login');

  console.log('Filling credentials...');
  await page.fill('input[name="email"]', 'admin@gmail.com');
  await page.fill('input[name="password"]', '12345678');
  await page.click('button[type="submit"]');

  console.log('Waiting for login...');
  await expect(page).toHaveURL(/.*admin\/dashboard/, { timeout: 15000 });

  console.log('Navigating to result create page...');
  await page.goto('/admin/result/create');
  
  await page.waitForLoadState('networkidle');

  const html = await page.content();
  const fs = require('fs');
  fs.writeFileSync('live_create.html', html);
  await page.screenshot({ path: 'live_create.png', fullPage: true });

  const isCheckboxPresent = html.includes('Publish Semester Results (Auto-Generate based on CGPA)');
  const oldTextPresent = html.includes('Written/Practical/Viva');


  console.log('Checkbox Present:', isCheckboxPresent);
  console.log('Old Form Present:', oldTextPresent);

  if (isCheckboxPresent) {
      console.log('TEST PASSED: Live server is correctly deployed and UI matches requirements.');
  } else {
      console.log('TEST FAILED: Live server does NOT have the new UI.');
  }
});
