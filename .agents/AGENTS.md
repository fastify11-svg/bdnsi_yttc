# Workspace Rules & Autonomous Development Workflow (v4.0)

**Project**: BDNSI — Next-Gen Affiliate & Agent Management System
**Stack**: Laravel 10 + React (Inertia.js) + Vite + Tailwind CSS + MySQL
**Local URL**: `http://127.0.0.1:8000`
**Live Server**: Hostinger (deploy via SSH/FTP)
**GitHub**: `https://github.com/fastify11-svg/bdnsi_yttc`
**IDE**: Antigravity IDE (Google Deepmind) — NO VS Code, NO external editors

---

## System Paths (Always use these)

- **PHP**: `C:\xampp\php\php.exe`
- **Composer**: `C:\xampp\php\composer.bat`
- **MySQL**: `C:\xampp\mysql\bin\mysql.exe`
- **Node**: `node` (v24.19.0 — available globally)
- **NPM**: `npm` (PowerShell ExecutionPolicy = RemoteSigned ✅)
- **Artisan**: `C:\xampp\php\php.exe artisan`
- **Project Root**: `D:\BDNSI`

## Quick Command Reference

```powershell
# Laravel server start
C:\xampp\php\php.exe artisan serve

# Vite dev server
npm run dev

# Run migrations
C:\xampp\php\php.exe artisan migrate

# Composer install
C:\xampp\php\composer.bat install

# Playwright tests
npx playwright test

# Build frontend
npm run build

# Git push
git add -A && git commit -m "message" && git push origin main
```

---

## Autonomous Development Guidelines (v4.0)

### 1. No External Editor

All coding, execution, and testing within **Antigravity IDE only**. Never reference VS Code, ignore `.vscode/` configs.

### 2. Auto GitHub Push

After every sprint, feature, or bugfix → autonomously commit + push to GitHub with professional commit messages. Never wait for user command.

### 3. Internal Execution

All servers, builds, tests run via internal terminal. Never ask user to run commands manually.

### 4. Self-Healing Bug Loop

On any error:

1. Read terminal/log output
2. Identify root cause
3. Fix the code
4. Re-run test
5. Push fixed code to GitHub

Repeat until ✅ green.

### 5. CI/CD via GitHub Actions

Every push triggers `.github/workflows/autonomous.yml` automatically. Ensure it stays valid.

### 6. Full E2E Verification Lifecycle

After code changes:

1. Run `npx playwright test`
2. Fix any failures autonomously
3. Verify data flow end-to-end
4. Push to GitHub
5. Trigger live server deployment
6. Confirm live site works

### 7. Laravel-Specific Rules

- Always run `C:\xampp\php\php.exe artisan` (never bare `php artisan`)
- Always run `C:\xampp\php\composer.bat` (never bare `composer`)
- Clear cache after config changes: `C:\xampp\php\php.exe artisan optimize:clear`
- Use `APP_URL=http://127.0.0.1:8000` for local testing

### 8. Database Rules

- Local DB: MySQL via XAMPP (`DB_DATABASE=yttccomb_bdnsi`, `DB_HOST=127.0.0.1`)
- Always backup before migrations: `C:\xampp\mysql\bin\mysqldump.exe -u root yttccomb_bdnsi > backup.sql`
- Use `migrate:fresh --seed` only in CI, never locally without backup

### 9. Frontend Rules

- Vite + React + Inertia.js
- Tailwind CSS for styling
- Build: `npm run build` → outputs to `public/build/`
- Dev HMR: `npm run dev` + separate terminal for Laravel

### 10. Deployment Rules

- SSH credentials in `.env` (never hardcode in scripts)
- FTP via `basic-ftp` npm package
- Deploy script: `node auto_deploy.mjs`
- GitHub webhook secret in repo secrets as `DEPLOY_WEBHOOK_URL`

---

## Project Architecture

```text
D:\BDNSI/
├── app/              # Laravel PHP (Models, Controllers, Middleware)
├── resources/        # React components, Blade views, CSS
├── routes/           # web.php, api.php
├── database/         # Migrations, Seeders, Factories
├── public/           # Public assets, compiled JS/CSS
├── .github/workflows/ # CI/CD (autonomous.yml)
├── .agents/          # Antigravity IDE config (AGENTS.md, mcp_config.json)
├── tests/            # PHPUnit tests
└── playwright.config.js # E2E test config
```

## Known Issues & Fixes

| Issue | Fix |
| --- | --- |
| `npm` blocked | ExecutionPolicy = RemoteSigned (already fixed) |
| `php` not in PATH | Use full path: `C:\xampp\php\php.exe` |
| `composer` not in PATH | Use: `C:\xampp\php\composer.bat` |
| Session errors | `php artisan session:table && php artisan migrate` |
| Vite manifest missing | Run `npm run build` first |
| 500 on live | Check `storage/` permissions on server |

---

## MCP Tools Available in Antigravity IDE

- **chrome-devtools-mcp** (project): Browser automation, screenshots, debugging
- **chrome-devtools** (global): Built-in Antigravity Chrome DevTools

Use `chrome-devtools-mcp` for:

- Taking screenshots of local dev server
- Clicking through UI flows
- Running Lighthouse audits
- Debugging JavaScript errors in browser
