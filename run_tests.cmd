@echo off
echo ==========================================
echo    Automated Bug-Fix ^& Test Lifecycle
echo ==========================================

echo.
echo [1/2] Running Backend Tests (PHPUnit)...
call c:\xampp\php\php.exe artisan test
IF %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Backend tests failed. Please fix bugs before continuing.
    exit /b %ERRORLEVEL%
)

echo.
echo [2/2] Running Frontend E2E Tests (Playwright)...
call npx playwright test
IF %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Frontend E2E tests failed. Please fix bugs before continuing.
    exit /b %ERRORLEVEL%
)

echo.
echo ==========================================
echo [SUCCESS] All tests passed! 100%% Bug Free!
echo You can now commit and push the changes.
echo ==========================================
