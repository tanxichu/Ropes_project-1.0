@echo off
setlocal

REM Set GitHub repository URL
set "github_repo=https://github.com/tanxichu/Ropes_project"

REM Configure Git user information
echo Configuring Git user information...
git config --global user.name "xichu"
git config --global user.email "tanxichu@hotmail.com"

REM Add current repository as a safe directory
echo Adding current repository as a safe directory...
git config --global --add safe.directory "D:/Rope Project/Vue_worker"

REM Initialize Git repository
echo Initializing Git repository...
git init

REM Add all files to the repository
echo Adding files to the repository...
git add .

REM Commit files
echo Committing files...
git commit -m "Initial commit"

REM Remove existing remote repository (if exists)
echo Removing existing remote repository (if exists)...
git remote remove origin

REM Link to remote GitHub repository
echo Linking to remote GitHub repository...
git remote add origin "%github_repo%"

REM Switch to main branch
echo Switching to main branch...
git branch -M main

REM Push to GitHub
echo Pushing to GitHub...
git push -u origin main

echo Upload complete.
endlocal

