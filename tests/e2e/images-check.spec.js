const { test, expect } = require('@playwright/test');

const baseURL = 'https://nenobet.live';

test.describe('Image loading and layout checks on live', () => {

  test('Check homepage images', async ({ page }) => {
    const response = await page.goto(baseURL + '/');
    expect(response.status()).toBe(200);

    await page.waitForLoadState('networkidle');

    const images = await page.locator('img').all();
    for (const img of images) {
      const src = await img.getAttribute('src');
      if (src && !src.startsWith('data:')) {
        const isLoaded = await img.evaluate((node) => node.complete && node.naturalWidth > 0);
        expect(isLoaded, `Image failed to load: ${src}`).toBeTruthy();
      }
    }
  });

  test('Check login page images', async ({ page }) => {
    const response = await page.goto(baseURL + '/admin/login');
    expect(response.status()).toBe(200);

    await page.waitForLoadState('networkidle');

    const images = await page.locator('img').all();
    for (const img of images) {
      const src = await img.getAttribute('src');
      if (src && !src.startsWith('data:')) {
        const isLoaded = await img.evaluate((node) => node.complete && node.naturalWidth > 0);
        expect(isLoaded, `Image failed to load on login page: ${src}`).toBeTruthy();
      }
    }
  });

});
