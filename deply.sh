#!/bin/sh

# Delete the existing gh-pages branch
git branch -D gh-pages

# Create a new empty gh-pages branch
git checkout --orphan gh-pages

# Delete all files and folders except for the .gitignore file
find . -maxdepth 1 ! -name '.gitignore' -exec rm -rf {} \;

# Copy the static files to the current directory
cp -r static/* .

# Commit and push the changes to the gh-pages branch
git add .
git commit -m "Deploy static files"
git push origin gh-pages --force

# Switch back to the main branch
git checkout main
