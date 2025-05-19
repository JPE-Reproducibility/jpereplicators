#!/bin/bash

# ===========================
# 🛠️ Git Workshop Script
# ===========================
# This script walks through the core Git commands demonstrated during the workshop.
# Run each section step-by-step and explain what it does.



# open vscode
# explain - create directory
# create a text file in editor
# open terminal
# create text file in terminal
echo "This is the first version of the file." > notes.txt

# This is a text file
# Code is text.

# We only track code (text!) with version control. 
# We can track small datasets.

# In our JPE workflow, we will *never* track data with version control - data will be downloaded directly from the dataverse deposit, where authors submit their packages.

# So, each paper will be a github repo. The repo contains all code, the paper and the appendix pdfs, and the reports we generate. It will *not* contain the data. Instead, if you want to work on a package, you have 2 steps to do:

# 1. get the repository from github
# 2. download the package from datavaserse *on top* of the repository.

# ---------------------------
# 1. Initialize a Git Repository
# ---------------------------
echo "Initializing a new Git repository..."
mkdir git-workshop-demo && cd git-workshop-demo
git init  # Creates a new .git directory

# ---------------------------
# 2. Create and Add a File
# ---------------------------
echo "Creating a new text file..."
echo "This is the first version of the file." > notes.txt
cat notes.txt

# ---------------------------
# 3. Check Status and Stage the File
# ---------------------------
echo "Checking git status..."
git status  # Shows untracked file
echo "Staging the file..."
git add notes.txt  # Stages the file for commit

# ---------------------------
# 4. Commit the File
# ---------------------------
echo "Committing the file..."
git commit -m "Initial commit with notes.txt"  # Records the file in history

# ---------------------------
# 5. Modify the File and Commit Again
# ---------------------------
echo "Editing the file..."
echo "This is the second version of the file." >> notes.txt
cat notes.txt
echo "Staging and committing the updated file..."
git add notes.txt
git commit -m "Add second version to notes.txt"

# ---------------------------
# 6. View Commit History
# ---------------------------
echo "Showing commit log..."
git log --oneline  # Summarized log for clarity

# ---------------------------
# 7. Check Out a Previous Version
# ---------------------------
echo "Checking out the first commit..."
FIRST_COMMIT=$(git rev-list --max-parents=0 HEAD)
git checkout $FIRST_COMMIT notes.txt
echo "File contents from the first commit:"
cat notes.txt

# ---------------------------
# 8. Return to Latest Version
# ---------------------------
echo "Resetting file to latest version on main branch..."
git checkout main notes.txt
cat notes.txt

# ---------------------------
# 9. Connect to Remote Repository (Explain Only)
# ---------------------------
echo
echo "📝 REMINDER:"
echo "You would connect to a remote repo like this:"
echo "git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPO.git"
echo "Then push with:"
echo "git push -u origin main"
echo "Make sure to authenticate using your GitHub PAT when prompted."

# Done!
echo
echo "✅ Workshop demo completed!"
