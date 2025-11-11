# GitHub Setup Guide for Peer Review Submission

This guide will help you set up your GitHub repository with the required files and gh-pages branch for easy viewing.

## Step 1: Create GitHub Repository

1. Go to [GitHub](https://github.com) and create a new repository
2. Name it something like `pml-project` or `exercise-quality-prediction`
3. **Do NOT** initialize with README, .gitignore, or license (we already have these)

## Step 2: Initialize Git and Push Files

```bash
# Navigate to your project directory
cd /Users/ayushmanmishra/coursera

# Initialize git (if not already done)
git init

# Add all files
git add .

# Make initial commit
git commit -m "Initial commit: Coursera PML project"

# Add your GitHub repository as remote (replace YOUR_USERNAME and REPO_NAME)
git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git

# Push to main branch
git branch -M main
git push -u origin main
```

## Step 3: Generate HTML Report

**Important**: You must generate the HTML file before creating the gh-pages branch.

### Option A: Using RStudio (Recommended)
1. Open `pml_project.Rmd` in RStudio
2. Click the "Knit" button
3. This will generate `pml_project.html`

### Option B: Using Command Line
```bash
Rscript -e "rmarkdown::render('pml_project.Rmd')"
```

## Step 4: Create gh-pages Branch

Run the setup script:
```bash
bash setup_gh_pages.sh
```

Or manually:

```bash
# Create and switch to gh-pages branch
git checkout -b gh-pages

# Copy HTML file to index.html (required for GitHub Pages)
cp pml_project.html index.html

# Add and commit
git add index.html
git commit -m "Add HTML report for GitHub Pages"

# Push gh-pages branch
git push -u origin gh-pages

# Switch back to main branch
git checkout main
```

## Step 5: Enable GitHub Pages

1. Go to your repository on GitHub
2. Click **Settings** → **Pages**
3. Under "Source", select **gh-pages** branch
4. Click **Save**
5. Your report will be available at: `https://YOUR_USERNAME.github.io/REPO_NAME/`

## Step 6: Verify Submission Requirements

✅ **R Markdown file** (`pml_project.Rmd`) - Present  
✅ **Compiled HTML file** (`pml_project.html` or `index.html` on gh-pages) - Present  
✅ **Text < 2000 words** - Verify after knitting  
✅ **Figures < 5** - Currently 2 figures (barplot + feature importance)  
✅ **gh-pages branch** - Created and pushed  

## Final Checklist

- [ ] Repository created on GitHub
- [ ] All files pushed to main branch
- [ ] HTML report generated (`pml_project.html`)
- [ ] gh-pages branch created
- [ ] `index.html` added to gh-pages branch
- [ ] GitHub Pages enabled in repository settings
- [ ] Report viewable online at GitHub Pages URL
- [ ] Share the repository link for peer review

## Troubleshooting

**HTML file not showing?**
- Make sure `index.html` is in the root of the gh-pages branch
- Check that GitHub Pages is enabled and pointing to gh-pages branch
- Wait a few minutes for GitHub to process the changes

**Can't push to GitHub?**
- Make sure you've authenticated (use GitHub CLI or SSH keys)
- Check that the remote URL is correct: `git remote -v`

**Need to update the report?**
- Make changes to `pml_project.Rmd`
- Re-knit to generate new HTML
- Copy to `index.html` on gh-pages branch
- Commit and push

