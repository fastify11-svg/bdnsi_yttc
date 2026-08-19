const { test, expect } = require('@playwright/test');

test.describe('Team Performance Module E2E', () => {

  const getAdminEmail = () => process.env.ADMIN_EMAIL || 'admin@gmail.com';
  const getAdminPassword = () => process.env.ADMIN_PASSWORD || '12345678';

  test.beforeEach(async ({ page }) => {
    // Login as Admin
    await page.goto('./admin/login');
    await page.fill('input[name="email"]', getAdminEmail());
    await page.fill('input[name="password"]', getAdminPassword());
    await page.click('button[type="submit"]');
    await expect(page).toHaveURL(/.*admin\/dashboard/);
  });

  test('Navigate to Team Performance Dashboard', async ({ page }) => {
    await page.goto('./admin/team-performance');
    await expect(page).toHaveURL(/.*admin\/team-performance/);
    await expect(page.locator('text=Team Performance Overview')).toBeVisible();
    await expect(page.locator('text=Assign Daily Targets')).toBeVisible();
  });

  test('Can Assign Targets for a specific date', async ({ page }) => {
    await page.goto('./admin/team-performance');
    
    // Select date
    const dateInput = page.locator('input[type="date"]');
    await expect(dateInput).toBeVisible();

    // Select the first input for target setting
    const targetInputs = page.locator('input[type="number"]');
    if (await targetInputs.count() > 0) {
      await targetInputs.first().fill('5');
      await page.click('button:has-text("Save Target")');
      
      // Wait for success toast
      await expect(page.locator('text=Targets updated successfully')).toBeVisible();
    } else {
      console.log('No team members found for setting targets');
    }
  });
});
