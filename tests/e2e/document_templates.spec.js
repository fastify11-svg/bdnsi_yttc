import { test, expect } from '@playwright/test';

test.describe('Document Templates', () => {
    test.beforeEach(async ({ page }) => {
        // Login as admin
        await page.goto('http://127.0.0.1:8000/admin/login');
        await page.fill('input[name="email"]', 'admin@gmail.com');
        await page.fill('input[name="password"]', '12345678');
        await page.click('button[type="submit"]');
        await page.waitForURL('**/admin/dashboard');
    });

    test('should show built-in templates with badges and locked state', async ({ page }) => {
        await page.goto('http://127.0.0.1:8000/admin/document-templates');
        
        // Wait for table to load
        await page.waitForSelector('tr:has-text("Admit Card (Built-in)")');
        
        // Check for built-in badges
        const builtinBadges = page.locator('span:has-text("Built-in")');
        await expect(builtinBadges).toHaveCount(8);

        // Check for locked edit buttons
        const lockedButtons = page.locator('span:has-text("Locked")');
        await expect(lockedButtons).toHaveCount(8);
        
        // Verify one specific built-in template
        const admitCardRow = page.locator('tr').filter({ hasText: 'Admit Card (Built-in)' });
        await expect(admitCardRow.locator('span.bg-amber-100')).toContainText('Built-in');
        await expect(admitCardRow.locator('span:has-text("Locked")')).toBeVisible();
    });

    test('should be able to toggle active status of a built-in template', async ({ page }) => {
        await page.goto('http://127.0.0.1:8000/admin/document-templates');
        await page.waitForSelector('tr:has-text("Admit Card (Built-in)")');

        const admitCardRow = page.locator('tr').filter({ hasText: 'Admit Card (Built-in)' });
        
        // Find the toggle button
        const toggleButton = admitCardRow.locator('button').first();
        
        // Click to toggle
        await toggleButton.click();
        
        // Wait for page reload or success message
        await page.waitForSelector('tr:has-text("Admit Card (Built-in)")'); // ensure table is back
    });
});
