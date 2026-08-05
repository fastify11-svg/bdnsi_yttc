# Branch Protection Strategy

To enforce the 100% bug-free auto-deploy CI/CD lifecycle, branch protection must be enabled on GitHub for the `main` branch.

## Requirements
1. **Require pull request reviews before merging**: Ensures at least one code review before anything enters the main branch.
2. **Require status checks to pass before merging**:
   - `Laravel CI / laravel-tests` (E2E Tests & Unit Tests) must pass.
3. **Do not allow bypassing the above settings**: Even administrators must pass CI/CD pipeline tests.

## Continuous Deployment
When code is successfully merged into `main` and passes the CI/CD pipeline, the `.github/workflows/deploy.yml` will trigger the `DEPLOY_WEBHOOK_URL` to initiate a pull and restart on the production server automatically.
