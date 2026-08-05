const { test, expect } = require('@playwright/test');

test.describe('Frontend E2E Tests', () => {
  test('homepage loads and shows BTEB footer', async ({ page }) => {
    // Navigate to homepage
    await page.goto('./', { waitUntil: 'domcontentloaded' });

    // Check if the portal name is in the title
    await expect(page).toHaveTitle(/BDNSI/, { timeout: 30000 });

    // Check if footer area loads correctly
    const footer = page.locator('footer');
    await expect(footer).toBeVisible();

    // Verify "পরিকল্পনা এবং বাস্তবায়ন" text is in the footer
    await expect(footer.locator('text=পরিকল্পনা এবং বাস্তবায়ন')).toBeVisible();
  });

  test('student result page loads', async ({ page }) => {
    await page.goto('./result');
    await expect(page.locator('text=Student Result').first()).toBeVisible();
    // Test the search form existence
    await expect(page.locator('form').first()).toBeVisible();
  });

  test('all courses page loads', async ({ page }) => {
    await page.goto('./all-course');
    await expect(page.locator('text=All Courses').first()).toBeVisible();
  });

  test('verified center page loads', async ({ page }) => {
    await page.goto('./verified-center');
    await expect(page.locator('text=Verified Centers').first()).toBeVisible();
  });

  test('contact us form loads', async ({ page }) => {
    await page.goto('./contact-us');
    await expect(page.locator('text=Contact Us').first()).toBeVisible();
    await expect(page.locator('form').first()).toBeVisible();
  });
});
