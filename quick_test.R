# Quick test script to verify the analysis works
# This uses a smaller sample and fewer trees for faster execution

library(caret)
library(randomForest)

# Set seed
set.seed(12345)

cat("Loading data...\n")
train_url <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv"
test_url <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv"

training <- read.csv(train_url, na.strings = c("NA", "#DIV/0!", ""))
testing <- read.csv(test_url, na.strings = c("NA", "#DIV/0!", ""))

cat("Data loaded. Training:", nrow(training), "rows\n")

# Data cleaning
na_threshold <- 0.95
na_proportion <- colMeans(is.na(training))
cols_to_remove <- names(na_proportion[na_proportion > na_threshold])

metadata_cols <- c("X", "user_name", "raw_timestamp_part_1", "raw_timestamp_part_2",
                   "cvtd_timestamp", "new_window", "num_window")

cols_to_remove <- unique(c(cols_to_remove, metadata_cols))

training_clean <- training[, !names(training) %in% cols_to_remove]
testing_clean <- testing[, !names(testing) %in% cols_to_remove]

nzv <- nearZeroVar(training_clean, saveMetrics = TRUE)
training_clean <- training_clean[, !nzv$nzv]
testing_clean <- testing_clean[, names(testing_clean) %in% names(training_clean)]

cat("Data cleaned. Features:", ncol(training_clean) - 1, "\n")

# Use a sample for quick testing (remove this for full analysis)
cat("Using sample of 2000 rows for quick test...\n")
training_sample <- training_clean[sample(nrow(training_clean), 2000), ]

# Split data
inTrain <- createDataPartition(training_sample$classe, p = 0.7, list = FALSE)
train_set <- training_sample[inTrain, ]
validation_set <- training_sample[-inTrain, ]

cat("Training model (this may take a few minutes)...\n")
# Quick model with fewer trees and no CV
rf_model <- randomForest(classe ~ ., data = train_set, ntree = 50, importance = TRUE)

cat("Making predictions...\n")
validation_pred <- predict(rf_model, validation_set)
conf_matrix <- confusionMatrix(validation_pred, validation_set$classe)

cat("\n=== QUICK TEST RESULTS ===\n")
cat("Accuracy:", round(conf_matrix$overall["Accuracy"], 4), "\n")
cat("Out-of-sample error:", round(1 - conf_matrix$overall["Accuracy"], 4), "\n")
cat("\nConfusion Matrix:\n")
print(conf_matrix$table)

cat("\n=== TEST PREDICTIONS (first 5) ===\n")
test_pred <- predict(rf_model, testing_clean)
cat("Predictions:", as.character(test_pred[1:5]), "\n")

cat("\nQuick test completed successfully!\n")
cat("Note: This used a sample. For full analysis, run pml_project.Rmd\n")

