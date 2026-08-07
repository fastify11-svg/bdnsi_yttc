const { test, expect } = require('@playwright/test');

test.describe('Admin Panel E2E Tests', () => {

  test.beforeEach(async ({ page }) => {
    // Login as admin before each test
    await page.goto('./admin/login');
    await page.fill('input[name="email"]', 'admin@gmail.com');
    await page.fill('input[name="password"]', '12345678');
    await page.click('button[type="submit"]');
    await expect(page).toHaveURL(/.*admin\/dashboard/);
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
