#!/bin/bash

# Configuration variables
REPO_PATH="."
REMOTE_NAME="origin"  # Change this if your remote has a different name
BRANCH_NAME="main"    # Change this to your target branch

# Navigate to the repository
cd "$REPO_PATH" || { echo "Failed to navigate to repository path"; exit 1; }

# Check if this is a git repository
if [ ! -d ".git" ]; then
    echo "Not a git repository. Initialize it first."
    exit 1
fi

# Get current date and time for commit message
CURRENT_DATE=$(date +"%Y-%m-%d %H:%M:%S")

# Update the daily record file
echo "Daily update: $CURRENT_DATE" >> daily_record.txt

# Add changes to git
git add daily_record.txt

# Commit the changes
git commit -m "Daily commit: $CURRENT_DATE"

# Push to remote repository
git push $REMOTE_NAME $BRANCH_NAME

echo "Successfully pushed to $REMOTE_NAME/$BRANCH_NAME at $CURRENT_DATE"