const { test, expect } = require('@playwright/test');

const baseURL = 'https://nenobet.live';

test.describe('Frontend Connectivity & Navigation Checks', () => {

  test('Homepage has CourseList and routes to CourseDetails', async ({ page }) => {
    await page.goto(baseURL + '/');
    
    // Check if OUR COURSES section exists
    await expect(page.locator('text=OUR COURSES').first()).toBeVisible();
    
    // Check if courses are rendered
    const courseLinks = page.locator('a[href*="/course-details/"]');
    if (await courseLinks.count() > 0) {
      const firstCourse = courseLinks.first();
      const href = await firstCourse.getAttribute('href');
      
      // Navigate to course details
      await page.goto(href);
      await expect(page.locator('text=Enroll Now').first()).toBeVisible({ timeout: 10000 });
    }
  });

  test('All Courses page loads and search works', async ({ page }) => {
    await page.goto(baseURL + '/all-course');
    await expect(page.locator('text=Explore Our Courses').first()).toBeVisible();
    
    // Check search input
    await page.fill('input[placeholder="Search courses by title or keyword..."]', 'Welder');
    await page.click('button:has-text("Search")');
    await page.waitForLoadState('networkidle');
  });

  test('Result Verification page loads and form is present', async ({ page }) => {
    await page.goto(baseURL + '/result');
    await expect(page.locator('text=Student Result Verification').first()).toBeVisible();
    await expect(page.locator('input[placeholder="Enter Roll or Registration Number..."]')).toBeVisible();
  });

  test('Verified Centers page loads', async ({ page }) => {
    await page.goto(baseURL + '/verified-center');
    await expect(page.locator('text=Verified Training Centers').first()).toBeVisible();
  });

  test('Success Students page loads', async ({ page }) => {
    await page.goto(baseURL + '/success-student');
    await expect(page.locator('text=Success Students & Alumni').first()).toBeVisible();
  });

  test('Contact Us page loads and form can be filled', async ({ page }) => {
    await page.goto(baseURL + '/contact-us');
    await expect(page.locator('text=SEND US A DIRECT MESSAGE').first()).toBeVisible();
    
    await page.fill('input[placeholder="e.g. Mohammad Ali"]', 'Test User');
    await page.fill('input[placeholder="e.g. name@example.com"]', 'test@yttc.com.bd');
    await page.fill('input[placeholder="e.g. 01700000000"]', '01700000000');
    await page.fill('textarea', 'This is a test message from Playwright E2E.');
  });
});
