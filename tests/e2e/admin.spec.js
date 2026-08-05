const { test, expect } = require('@playwright/test');

test.describe('Admin Panel E2E Tests', () => {

  test.beforeEach(async ({ page }) => {
    // Login as admin before each test
    await page.goto('./login');
    await page.fill('input[name="email"]', 'superadmin@gmail.com');
    await page.fill('input[name="password"]', '12345678');
    await page.click('button[type="submit"]');
    await expect(page).toHaveURL(/.*dashboard/);
  });

  test('Admin dashboard loads successfully', async ({ page }) => {
    await page.goto('./admin/dashboard');
    await expect(page).toHaveURL(/.*admin\/dashboard/);
    await expect(page.locator('text=Total Center')).toBeVisible(); // Just a sample check
  });

  test('Site config page loads', async ({ page }) => {
    await page.goto('./admin/site-settings'); // Replace with actual site settings URL if different
    await expect(page.locator('text=Site Settings').first()).toBeVisible();
  });

  test('Student list page loads', async ({ page }) => {
    await page.goto('./admin/students');
    await expect(page.locator('text=Students').first()).toBeVisible();
    // Verify that table exists
    await expect(page.locator('table').first()).toBeVisible();
  });

});
