# Automated Git Pushes

This repository is configured to make multiple pushes per day automatically using GitHub Actions, without requiring your PC to be running 24/7.

## How it works

A GitHub Actions workflow (`.github/workflows/scheduled-push.yml`) is scheduled to run every 6 hours. The workflow:
1. Updates a file called `daily_record.txt` with a timestamp
2. Commits this change to the repository
3. Pushes the commit to the repository

## Setup Instructions

1. Create a GitHub repository if you don't already have one
2. Push this repository to GitHub:
   ```
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin YOUR_REPOSITORY_URL
   git push -u origin main
   ```
3. **Enable workflow permissions** in your repository:
   - Go to your repository → Settings → Actions → General
   - Under "Workflow permissions", select "Read and write permissions"
   - Save changes
   
   OR
   
   **Set up a Personal Access Token**:
   - Go to GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
   - Generate a new token with "repo" scope
   - Add this token as a repository secret named `PAT` under your repository's Settings → Secrets and variables → Actions

4. The GitHub Actions workflow will automatically be detected and start running

## GitHub Actions Schedule

The workflow is configured to run:
- Every 6 hours (at 0:00, 6:00, 12:00, and 18:00)
- The schedule is configured in the `.github/workflows/scheduled-push.yml` file
- You can also manually trigger the workflow from the "Actions" tab on GitHub

### Understanding the GitHub Actions Schedule

The cron schedule `0 */6 * * *` means:
- `0` - At minute 0 (the top of the hour)
- `*/6` - Every 6th hour
- `* * *` - Every day, every month, every day of the week

This ensures your repository gets at least 4 pushes per day at regular intervals, without needing to keep your PC running.

## Alternative Free Options

If you prefer not to use GitHub, other free options include:

1. GitLab CI/CD - Similar to GitHub Actions but for GitLab repositories
2. Oracle Cloud Free Tier - Offers always-free compute instances
3. Railway.app - Offers limited free hosting with scheduled jobs
4. Render.com - Provides limited free background workers