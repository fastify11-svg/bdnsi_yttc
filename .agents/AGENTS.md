# Workspace Rules & Development Workflow

**Project Context**: This is a Next-Gen Affiliate & Agent Management System (Software Service), NOT an e-commerce retail site.

**Workflow Pipeline**: Antigravity IDE (Generation) -> GitHub -> VS Code (Local Testing/Playwright) -> Bug Fix Loop.

1. **Development & Sprints**: Code should be generated in small sprints (Small Sprints) and logic must be kept clean.
2. **GitHub Auto-Sync**: Whenever code is written or modified, automatically commit and push (or prepare to push) to the GitHub repository so that changes are seamlessly synced locally.
3. **VS Code Environment Automation**: Continuously ensure `.vscode/extensions.json`, `.vscode/settings.json`, and `.vscode/tasks.json` are maintained in the project root. The `extensions.json` file must include necessary extensions for the project, including "ms-playwright.playwright" and "GitHub.copilot". This ensures that whenever the project is pulled locally and reloaded, VS Code will prompt to install all required extensions automatically.
4. **Automated Testing & Feedback Loop**: When the user tests the code locally and provides bug logs or errors from Playwright / GitHub Actions, fixing these bugs must be the top priority. After fixing, the changes should be pushed back to GitHub immediately.
