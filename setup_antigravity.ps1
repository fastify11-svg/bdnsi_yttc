# ============================================================
# Antigravity IDE — Full Setup Script for BDNSI Project
# Run this once: .\setup_antigravity.ps1
# ============================================================

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  BDNSI — Antigravity IDE Full Setup" -ForegroundColor Cyan  
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# 1. PowerShell Execution Policy
Write-Host "[1/7] Setting PowerShell Execution Policy..." -ForegroundColor Yellow
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
Write-Host "     OK: ExecutionPolicy = RemoteSigned" -ForegroundColor Green

# 2. Add PHP + MySQL to PATH
Write-Host "[2/7] Adding PHP & MySQL to System PATH..." -ForegroundColor Yellow
$userPath = [Environment]::GetEnvironmentVariable("PATH", "User")
$phpPath = "C:\xampp\php"
$mysqlPath = "C:\xampp\mysql\bin"
$additions = @()
if ($userPath -notlike "*$phpPath*") { $additions += $phpPath }
if ($userPath -notlike "*$mysqlPath*") { $additions += $mysqlPath }
if ($additions.Count -gt 0) {
    $newPath = $userPath + ";" + ($additions -join ";")
    [Environment]::SetEnvironmentVariable("PATH", $newPath, "User")
    $env:PATH = "$env:PATH;" + ($additions -join ";")
    Write-Host "     OK: Added $($additions -join ', ') to PATH" -ForegroundColor Green
} else {
    Write-Host "     OK: Already in PATH" -ForegroundColor Green
}

# 3. Create Composer wrapper
Write-Host "[3/7] Creating Composer wrapper..." -ForegroundColor Yellow
$composerBat = "@echo off`r`nC:\xampp\php\php.exe D:\BDNSI\composer.phar %*"
$composerBat | Out-File -FilePath "C:\xampp\php\composer.bat" -Encoding ASCII
Write-Host "     OK: composer.bat created at C:\xampp\php\composer.bat" -ForegroundColor Green

# 4. Verify tools
Write-Host "[4/7] Verifying tools..." -ForegroundColor Yellow
$phpVer = (& "C:\xampp\php\php.exe" --version 2>&1)[0]
Write-Host "     PHP: $phpVer" -ForegroundColor Green
$nodeVer = (node --version 2>&1)
Write-Host "     Node: $nodeVer" -ForegroundColor Green

# 5. Install npm dependencies
Write-Host "[5/7] Installing npm dependencies..." -ForegroundColor Yellow
Set-Location "D:\BDNSI"
npm install --silent 2>&1 | Out-Null
Write-Host "     OK: npm packages installed" -ForegroundColor Green

# 6. Install Playwright browsers
Write-Host "[6/7] Installing Playwright browsers..." -ForegroundColor Yellow
npx playwright install chromium 2>&1 | Out-Null
Write-Host "     OK: Playwright Chromium installed" -ForegroundColor Green

# 7. Verify Laravel
Write-Host "[7/7] Verifying Laravel setup..." -ForegroundColor Yellow
$laravelVer = (& "C:\xampp\php\php.exe" "D:\BDNSI\artisan" --version 2>&1)
Write-Host "     Laravel: $laravelVer" -ForegroundColor Green

# Done!
Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  SETUP COMPLETE!" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Available Commands:" -ForegroundColor White
Write-Host "  npm run dev          -- Start Vite dev server" -ForegroundColor Gray
Write-Host "  npm run serve        -- Start Laravel server" -ForegroundColor Gray
Write-Host "  npm test             -- Run Playwright E2E tests" -ForegroundColor Gray
Write-Host "  npm run deploy       -- Deploy to live server" -ForegroundColor Gray
Write-Host "  npm run push         -- Git commit and push" -ForegroundColor Gray
Write-Host "  npm run cache:clear  -- Clear Laravel cache" -ForegroundColor Gray
Write-Host ""
Write-Host "PHP:      C:\xampp\php\php.exe" -ForegroundColor DarkGray
Write-Host "Composer: C:\xampp\php\composer.bat" -ForegroundColor DarkGray
Write-Host "MySQL:    C:\xampp\mysql\bin\mysql.exe" -ForegroundColor DarkGray
Write-Host ""
