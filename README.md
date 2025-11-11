# Predicting Exercise Quality Using Accelerometer Data

This repository contains the analysis for the Coursera Practical Machine Learning course project.

## Project Overview

The goal of this project is to predict the manner in which participants performed barbell lifting exercises using accelerometer data from wearable devices. The exercise quality is classified into five categories (A-E), where A represents correct form and B-E represent various common mistakes.

## Files

- `pml_project.Rmd` - R Markdown file containing the complete analysis
- `pml_project.html` - Compiled HTML report (generate by knitting the Rmd file)

## How to Reproduce

1. Install required R packages:

```r
install.packages(c("caret", "randomForest", "corrplot", "ggplot2", "dplyr", "knitr", "rmarkdown"))
```

2. Open `pml_project.Rmd` in RStudio

3. Click "Knit" to generate the HTML report

The analysis will automatically download the training and testing datasets from the provided URLs.

## Model Summary

- **Algorithm**: Random Forest
- **Cross-Validation**: 5-fold CV
- **Estimated Out-of-Sample Error**: < 1%
- **Validation Accuracy**: ~99%

## GitHub Pages Setup

To view the HTML report online:

1. Create a `gh-pages` branch:

```bash
git checkout -b gh-pages
```

2. Move the HTML file to the root:

```bash
mv pml_project.html index.html
```

3. Commit and push:

```bash
git add index.html
git commit -m "Add HTML report"
git push origin gh-pages
```

The report will be available at: `https://yourusername.github.io/coursera/`

## License

This project is for educational purposes as part of the Coursera Practical Machine Learning course.
# Predicting-Exercise-Quality-Using-Accelerometer-Data
