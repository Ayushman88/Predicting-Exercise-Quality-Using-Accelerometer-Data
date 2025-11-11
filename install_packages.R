# Script to install all required packages
# Run this first: Rscript install_packages.R

cat("Installing required packages...\n")
cat("This may take 5-10 minutes. Please be patient.\n\n")

packages <- c("caret", "randomForest", "corrplot", "ggplot2", "dplyr", "knitr", "rmarkdown")

for (pkg in packages) {
  if (!require(pkg, character.only = TRUE, quietly = TRUE)) {
    cat("Installing", pkg, "...\n")
    install.packages(pkg, repos = "https://cran.rstudio.com/", dependencies = TRUE)
  } else {
    cat(pkg, "already installed.\n")
  }
}

cat("\n=== Installation Complete ===\n")
cat("All required packages are now installed.\n")
cat("You can now run: Rscript quick_test.R\n")
cat("Or open pml_project.Rmd in RStudio and click 'Knit'\n")

