# Helper script to generate prediction files
# This script can be run after the R Markdown analysis to generate
# the prediction files for the Coursera quiz submission

# Load required libraries
library(caret)
library(randomForest)

# Set seed for reproducibility
set.seed(12345)

# Download and load data
train_url <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv"
test_url <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv"

training <- read.csv(train_url, na.strings = c("NA", "#DIV/0!", ""))
testing <- read.csv(test_url, na.strings = c("NA", "#DIV/0!", ""))

# Data cleaning (same as in Rmd file)
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

# Train model
inTrain <- createDataPartition(training_clean$classe, p = 0.7, list = FALSE)
train_set <- training_clean[inTrain, ]

ctrl <- trainControl(method = "cv", number = 5, verboseIter = FALSE)

rf_model <- train(classe ~ ., 
                  data = train_set,
                  method = "rf",
                  trControl = ctrl,
                  ntree = 100,
                  importance = TRUE)

# Make predictions
test_predictions <- predict(rf_model, testing_clean)

# Function to write prediction files
pml_write_files = function(x){
  n = length(x)
  for(i in 1:n){
    filename = paste0("problem_id_", i, ".txt")
    write.table(x[i], file = filename, quote = FALSE, 
                row.names = FALSE, col.names = FALSE)
  }
}

# Generate prediction files
pml_write_files(test_predictions)

cat("Prediction files generated successfully!\n")
cat("Predictions:", as.character(test_predictions), "\n")

