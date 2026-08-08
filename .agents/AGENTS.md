# Workspace Rules & Autonomous Development Workflow (v3.0)

**Project Context**: This is a Next-Gen Affiliate & Agent Management System (Software Service).

**Autonomous Single-Environment Workflow Guidelines**:
1. **No External Editor Dependency**: All coding, execution, and testing must happen autonomously within Antigravity IDE. Ignore or remove external editor configurations like `.vscode`. The user will not manually run or test code in VS Code.
2. **Autonomous GitHub Sync (Auto-Push)**: After completing any sprint, feature, or bug fix module, autonomously commit and push the changes to GitHub. Use meaningful and professional commit messages. Do NOT wait for user commands to sync to GitHub.
3. **Internal Execution & Testing**: Manage servers, builds, and test executions (e.g., Playwright or unit tests) entirely via the internal terminal. Ensure all commands are correctly mapped in `package.json` for independent testing.
4. **Self-Healing Bug Fix Loop**: Rely exclusively on internal command outputs and logs. If a command fails or a test errors out, autonomously read the logs, detect the bug, fix the code, re-test, and automatically push the updated code once resolved. Do not expect manual error logs from the user.
5. **CI/CD Pipeline Automation**: Ensure GitHub Actions configurations (`.github/workflows`) are optimized so that every autonomous push triggers automated testing and deployment pipelines without manual intervention.

6. **Full Lifecycle End-to-End Verification**: After completing any code changes, MUST run local Playwright E2E tests to verify functionality. If bugs or issues are found, autonomously fix them. Once 100% bug-free and fully synced (data flow and connectivity checked), push the code to GitHub AND automatically deploy/push the changes to the live server. Continue this exhaustive verification cycle autonomously until fully completed.
