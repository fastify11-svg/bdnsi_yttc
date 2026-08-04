const { test, expect } = require('@playwright/test');

test.describe('Frontend E2E Tests', () => {
  test('homepage loads and shows BTEB footer', async ({ page }) => {
    // Navigate to homepage
    await page.goto('/');

    // Check if the portal name is visible
    await expect(page.locator('text=Young Technical Training Centre').first()).toBeVisible({ timeout: 10000 });

    // Check if footer area loads correctly
    const footer = page.locator('footer');
    await expect(footer).toBeVisible();

    // Verify "পরিকল্পনা এবং বাস্তবায়ন" text is in the footer
    await expect(footer.locator('text=পরিকল্পনা এবং বাস্তবায়ন')).toBeVisible();
  });

  test('student result page loads', async ({ page }) => {
    await page.goto('/result');
    await expect(page.locator('text=Student Result').first()).toBeVisible();
  });
});
