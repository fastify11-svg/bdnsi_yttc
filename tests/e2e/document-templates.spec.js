const { test, expect } = require('@playwright/test');

test.describe('Document Templates Module', () => {
  // Use the live URL since we already deployed, or local URL if needed.
  // We'll test against the live site for Remote QA
  const baseURL = 'https://nenobet.live';

  test('can login as admin and view document templates', async ({ page }) => {
    await page.goto(baseURL + '/admin/login');
    
    // Login
    await page.fill('input[name="email"]', 'superadmin@gmail.com');
    await page.fill('input[name="password"]', '12345678');
    await page.click('button[type="submit"]');

    // Wait for navigation to dashboard
    await page.waitForURL('**/admin/dashboard*');

    // Go to Document Templates
    await page.goto(baseURL + '/admin/document-templates');
    
    // Verify Index page
    await expect(page.locator('text=Template Library')).toBeVisible();
    await expect(page.locator('text=Create New Template')).toBeVisible();
  });

  test('can create a new document template', async ({ page }) => {
    await page.goto(baseURL + '/admin/login');
    await page.fill('input[name="email"]', 'superadmin@gmail.com');
    await page.fill('input[name="password"]', '12345678');
    await page.click('button[type="submit"]');
    await page.waitForURL('**/admin/dashboard*');

    await page.goto(baseURL + '/admin/document-templates/create');
    
    await expect(page.locator('text=Create New Template')).toBeVisible();

    // Fill form
    await page.fill('input[name="name"]', 'Automated QA Template');
    await page.selectOption('select[name="type"]', 'certificate');
    await page.fill('input[name="width"]', '800px');
    await page.fill('input[name="height"]', '600px');
    
    // Test preset buttons
    await page.click('text=A4 Landscape');
    await expect(page.locator('input[name="width"]')).toHaveValue('1123px');
    await expect(page.locator('input[name="height"]')).toHaveValue('794px');

    await page.click('button[type="submit"]');

    // Should redirect to index or edit page depending on controller logic
    await page.waitForTimeout(3000); // give it time to submit
  });
});
