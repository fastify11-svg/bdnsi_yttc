const { test, expect } = require('@playwright/test');

test.describe('Student Enrollment and License E2E Flow', () => {
  const getAdminEmail = () => process.env.ADMIN_EMAIL || 'admin@gmail.com';
  const getAdminPassword = () => process.env.ADMIN_PASSWORD || '12345678';
  const getCenterEmail = () => process.env.CENTER_EMAIL || 'user@gmail.com';
  const getCenterPassword = () => process.env.CENTER_PASSWORD || '12345678';

  const testCnic = `999${Date.now()}`;
  const testStudentName = `E2E Test Student ${Date.now()}`;
  let licenseNumber = null;

  test('Admin should be able to create student and approve them to generate license', async ({ page }) => {
    // 1. Admin logs in
    await page.goto('https://nenobet.live/admin/login');
    await page.fill('input[name="email"]', getAdminEmail());
    await page.fill('input[name="password"]', getAdminPassword());
    await page.click('button[type="submit"]');
    
    // 2. Navigate to Student creation page
    await page.goto('https://nenobet.live/admin/student/create');
    await expect(page.locator('text=Add New Student').first()).toBeVisible();

    // 3. Fill out Student form
    // Note: To make test robust without relying on specific centers/sessions, 
    // we use first available options for selects if possible, or we just rely on dummy inputs
    
    // Selecting first center
    const centerSelect = page.locator('select[name="center_id"]');
    const firstCenterValue = await centerSelect.evaluate(el => el.options.length > 1 ? el.options[1].value : el.options[0].value);
    await centerSelect.selectOption(firstCenterValue);

    await page.fill('input[name="name"]', testStudentName);
    await page.fill('input[name="fathers_name"]', 'Test Father');
    await page.fill('input[name="mothers_name"]', 'Test Mother');
    await page.fill('input[name="date_of_birth"]', '2000-01-01');
    await page.fill('input[name="nid_or_birth"]', testCnic);
    await page.fill('input[name="present_address"]', 'Test Address');
    await page.fill('input[name="permanent_address"]', 'Test Address');
    await page.fill('input[name="phone"]', '01700000000');

    // Selecting first session
    const sessionSelect = page.locator('select[name="session_id"]');
    const firstSessionValue = await sessionSelect.evaluate(el => el.options.length > 1 ? el.options[1].value : el.options[0].value);
    await sessionSelect.selectOption(firstSessionValue);

    // Selecting first subject
    const subjectSelect = page.locator('select[name="subject_id"]');
    const firstSubjectValue = await subjectSelect.evaluate(el => el.options.length > 1 ? el.options[1].value : el.options[0].value);
    await subjectSelect.selectOption(firstSubjectValue);

    await page.fill('input[name="due_amount"]', '1000');
    await page.fill('input[name="paid_amount"]', '500');

    // Set status to Approved (Assuming status 1 is Approved based on StudentStatus enum)
    const statusSelect = page.locator('select[name="status"]');
    // In our backend logic, generating license relies on changing to Approved (1)
    await statusSelect.selectOption('1');

    // Submit form
    await page.click('button[type="submit"]');

    // 4. Verify License was generated
    // Since we created it, the license should be available in the licenses page
    await page.goto('https://nenobet.live/admin/license');
    
    // Check if the student's CNIC is in the license list
    await expect(page.locator(`text=${testCnic}`).first()).toBeVisible({ timeout: 15000 });

    // Try viewing the digital license view
    // We would need the license number. We can just visit /license-view/LIC_NUM.
    // If the list shows the license number, we could extract it, but for simplicity
    // we can search for the CNIC and assume it worked if it's on the Admin License list.
  });
});

