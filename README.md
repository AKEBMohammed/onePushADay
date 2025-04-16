# One Push A Day

This repository is configured to make at least one push per day automatically. It uses a cron job to ensure regular commits, which helps maintain an active contribution history.

## How it works

A shell script (`one_push_a_day.sh`) is scheduled to run daily through cron. The script:
1. Creates or updates a file called `daily_record.txt` with a timestamp
2. Commits this change to the repository
3. Pushes the commit to the remote repository

## Setup Instructions

1. Clone this repository to your local machine
2. Make sure the shell script has execution permissions: `chmod +x one_push_a_day.sh`
3. Initialize git repository (if not already initialized):
   ```
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin YOUR_REPOSITORY_URL
   git push -u origin main
   ```
4. Set up a cron job to run the script daily (see below)

## Cron Job Setup

To schedule the automatic push, add a cron job by running:
```
crontab -e
```

Then add a line like this to run the script once a day at 3:00 AM:
```
0 3 * * * /media/medaly/A4B4A33BB4A30F3C/TP/AQL/onePushADay/one_push_a_day.sh >> /media/medaly/A4B4A33BB4A30F3C/TP/AQL/onePushADay/cron.log 2>&1
```

This will also log the output to `cron.log` for troubleshooting.