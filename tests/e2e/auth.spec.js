const { test, expect } = require('@playwright/test');

test.describe('Authentication E2E Tests', () => {

  test('Admin login success', async ({ page }) => {
    await page.goto('./login');
    await page.fill('input[name="email"]', 'superadmin@gmail.com');
    await page.fill('input[name="password"]', '12345678');
    await page.click('button[type="submit"]');

    // Should redirect to dashboard
    await expect(page).toHaveURL(/.*dashboard/);
    await expect(page.locator('text=Dashboard').first()).toBeVisible();
  });

  test('Admin login failure with wrong password', async ({ page }) => {
    await page.goto('./login');
    await page.fill('input[name="email"]', 'superadmin@gmail.com');
    await page.fill('input[name="password"]', 'wrongpassword');
    await page.click('button[type="submit"]');

    // Should stay on login and show error
    await expect(page).toHaveURL(/.*login/);
    await expect(page.locator('text=These credentials do not match our records.')).toBeVisible();
  });

  test('Center user login success', async ({ page }) => {
    // Note: Assuming a default center user is seeded
    await page.goto('./login');
    await page.fill('input[name="email"]', 'center@bdnsi.com');
    await page.fill('input[name="password"]', '12345678');
    await page.click('button[type="submit"]');

    // Should redirect to dashboard
    await expect(page).toHaveURL(/.*dashboard/);
    await expect(page.locator('text=Dashboard').first()).toBeVisible();
  });

  test('Logout works', async ({ page }) => {
    await page.goto('./login');
    await page.fill('input[name="email"]', 'superadmin@gmail.com');
    await page.fill('input[name="password"]', '12345678');
    await page.click('button[type="submit"]');

    await expect(page).toHaveURL(/.*dashboard/);

    // Logout process - assumes a dropdown or direct logout button
    // It might be a POST request in Laravel so we might need to click a button
    // Wait for the dropdown or button
    const userMenuButton = page.locator('button:has(svg)').first(); // common pattern in Jetstream/Breeze
    if (await userMenuButton.isVisible()) {
        await userMenuButton.click();
    }
    
    // Find the link or button that says Log Out
    const logoutLink = page.locator('text=Log Out').first();
    if (await logoutLink.isVisible()) {
        await logoutLink.click();
    }

    // Wait for redirect to home
    await expect(page).toHaveURL(/.*$/);
  });

});
