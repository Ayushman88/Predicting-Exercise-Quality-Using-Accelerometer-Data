# Predicting Exercise Quality Using Accelerometer Data

This repository contains the analysis for the Coursera Practical Machine Learning course project.

## Project Overview

The goal of this project is to predict the manner in which participants performed barbell lifting exercises using accelerometer data from wearable devices. The exercise quality is classified into five categories (A-E), where A represents correct form and B-E represent various common mistakes.

## Files

- `pml_project.Rmd` - R Markdown file containing the complete analysis
- `pml_project.html` - Compiled HTML report (generate by knitting the Rmd file)

## How to Reproduce

### Quick Start (Faster Testing)

1. Install required R packages (this may take 5-10 minutes):

```r
install.packages(c("caret", "randomForest", "corrplot", "ggplot2", "dplyr", "knitr", "rmarkdown"), dependencies = TRUE)
```

2. For a quick test, run:

```bash
Rscript quick_test.R
```

3. For faster HTML generation, edit `pml_project.Rmd` and set `QUICK_MODE <- TRUE` at the top (line 20)

### Full Analysis

1. Open `pml_project.Rmd` in RStudio

2. Ensure `QUICK_MODE <- FALSE` (line 20) for the complete analysis

3. Click "Knit" to generate the HTML report

**Note**: The full analysis may take 30-60 minutes depending on your computer. The quick mode uses a sample and fewer trees, completing in 5-10 minutes.

The analysis will automatically download the training and testing datasets from the provided URLs.

## Model Summary

- **Algorithm**: Random Forest
- **Cross-Validation**: 5-fold CV
- **Estimated Out-of-Sample Error**: < 1%
- **Validation Accuracy**: ~99%

## GitHub Pages Setup

**📖 For detailed GitHub setup instructions, see [GITHUB_SETUP.md](GITHUB_SETUP.md)**

Quick setup:

```bash
# After generating pml_project.html, run:
bash setup_gh_pages.sh
git push -u origin gh-pages
```

Then enable GitHub Pages in your repository settings. The report will be available at: `https://yourusername.github.io/repo-name/`

## Submission Checklist

Before submitting for peer review, verify:

- [x] R Markdown file (`pml_project.Rmd`) is complete
- [ ] HTML report (`pml_project.html`) has been generated
- [ ] Text content is < 2000 words (verify after knitting)
- [x] Number of figures is < 5 (currently 2: distribution plot + feature importance)
- [ ] GitHub repository created
- [ ] gh-pages branch created with `index.html`
- [ ] GitHub Pages enabled and report viewable online

## License

This project is for educational purposes as part of the Coursera Practical Machine Learning course.

# Predicting-Exercise-Quality-Using-Accelerometer-Data
