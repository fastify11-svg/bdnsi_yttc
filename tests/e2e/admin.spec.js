const { test, expect } = require('@playwright/test');

test.describe('Admin Panel E2E Tests', () => {

  test.beforeEach(async ({ page }) => {
    // Login as admin before each test
    await page.goto('./admin/login');
    await page.waitForLoadState('networkidle');
    const email = process.env.ADMIN_EMAIL || 'admin@gmail.com';
    const password = process.env.ADMIN_PASSWORD || '12345678';
    await page.fill('input[name="email"]', email);
    await page.fill('input[name="password"]', password);
    await page.click('button[type="submit"]');
    try {
      await expect(page).toHaveURL(/.*admin\/dashboard/);
    } catch (e) {
      await page.screenshot({ path: 'login-failure.png' });
      throw e;
    }
  });

  test('Admin dashboard loads successfully', async ({ page }) => {
    await page.goto('./admin/dashboard');
    await expect(page).toHaveURL(/.*admin\/dashboard/);
    await expect(page.locator('text=Total Center')).toBeVisible(); // Just a sample check
  });

  test('Site config page loads', async ({ page }) => {
    await page.goto('./admin/configDictionary/create'); 
    await expect(page.locator('form').first()).toBeVisible();
  });

  test('Student list page loads', async ({ page }) => {
    await page.goto('./admin/student');
    await expect(page.locator('table').first()).toBeVisible();
    // Verify that table exists
    await expect(page.locator('table').first()).toBeVisible();
  });

});
