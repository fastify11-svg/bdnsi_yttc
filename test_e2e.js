const { chromium } = require('playwright');
const fs = require('fs');

(async () => {
  const browser = await chromium.launch({ headless: true });
  const context = await browser.newContext();
  const page = await context.newPage();

  console.log('Navigating to live server login...');
  await page.goto('https://nenobet.live/admin/login');

  console.log('Filling credentials...');
  await page.fill('input[name="email"]', 'admin@gmail.com');
  await page.fill('input[name="password"]', '12345678');
  await page.click('button[type="submit"]');

  console.log('Waiting for login...');
  await page.waitForNavigation();

  console.log('Navigating to result create page...');
  await page.goto('https://nenobet.live/admin/result/create');
  
  await page.waitForLoadState('networkidle');

  const html = await page.content();
  const isCheckboxPresent = html.includes('Publish Semester Results (Auto-Generate based on CGPA)');
  const oldTextPresent = html.includes('Written/Practical/Viva');
  
  console.log('Checkbox Present:', isCheckboxPresent);
  console.log('Old Form Present:', oldTextPresent);

  await browser.close();
})();
