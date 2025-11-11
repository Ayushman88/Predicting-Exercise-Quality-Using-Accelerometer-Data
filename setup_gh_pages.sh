#!/bin/bash

# Script to set up gh-pages branch for GitHub Pages
# This makes it easy for graders to view your HTML report online

echo "=== Setting up gh-pages branch for GitHub Pages ==="
echo ""

# Check if HTML file exists
if [ ! -f "pml_project.html" ]; then
    echo "ERROR: pml_project.html not found!"
    echo "Please generate the HTML file first by:"
    echo "  1. Opening pml_project.Rmd in RStudio and clicking 'Knit', OR"
    echo "  2. Running: Rscript -e \"rmarkdown::render('pml_project.Rmd')\""
    exit 1
fi

echo "✓ HTML file found: pml_project.html"
echo ""

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo "Initializing git repository..."
    git init
    git add .
    git commit -m "Initial commit"
    echo "✓ Git repository initialized"
    echo ""
fi

# Check current branch
current_branch=$(git branch --show-current 2>/dev/null || echo "main")

# Create or switch to gh-pages branch
if git show-ref --verify --quiet refs/heads/gh-pages; then
    echo "gh-pages branch already exists. Switching to it..."
    git checkout gh-pages
else
    echo "Creating gh-pages branch..."
    git checkout -b gh-pages
fi

# Copy HTML to index.html
echo "Copying pml_project.html to index.html..."
cp pml_project.html index.html

# Add and commit
git add index.html
git commit -m "Add HTML report for GitHub Pages" 2>/dev/null || echo "No changes to commit"

echo ""
echo "=== Setup Complete ==="
echo ""
echo "Next steps:"
echo "1. Push the gh-pages branch:"
echo "   git push -u origin gh-pages"
echo ""
echo "2. Go to your GitHub repository → Settings → Pages"
echo "3. Select 'gh-pages' branch as source"
echo "4. Your report will be available at:"
echo "   https://YOUR_USERNAME.github.io/REPO_NAME/"
echo ""
echo "Switching back to $current_branch branch..."
git checkout $current_branch 2>/dev/null || git checkout -b main

