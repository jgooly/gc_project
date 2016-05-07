## Problem statement:

# You should create one R script called run_analysis.R that does the following.

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Load libraries
library(readr)
library(dplyr)
library(stringr)
library(reshape2)

# Read the data
a_l <- read_table('activity_labels.txt', col_names = c('activity_key', 'activity_label'))
feats <- read_table('features.txt', col_names = FALSE)  # Need to parse numeric key from column.

subject_test <- read_table('test/subject_test.txt', col_names = 'subject_key')
X_test <- read_table('test/X_test.txt', col_names = FALSE)  # Neet to add X_test column name and descriptor.
y_test <- read_table('test/y_test.txt', col_names = 'label')

subject_train <- read_table('train/subject_train.txt', col_names = 'subject_key')
X_train <- read_table('train/X_train.txt', col_names = FALSE)  # Neet to add X_train column name and descriptor.
y_train <- read_table('train/y_train.txt', col_names = 'label')

## Munging ##

# Combine test and train data.
data <- rbind(X_test, X_train)

# Combine test and train labels.
labels <- rbind(y_test, y_train)

# Combine test and train subject ids
subject_ids <- rbind(subject_test, subject_train)

# Write function to parse numeric key from feature names in feats data frame and add column names.
feature_fun <- function(df) {
  feats <- str_split_fixed(df$X1, ' ', 2)
  feats_df <- data.frame(feats)
  names(feats_df) <- c('feature_key', 'feature')
  feats_df
}

features <- feature_fun(feats)

# Create function to add feature names to features
add_ft_names <- function(df, feature_names_vector) {
  names(df) <- feature_names_vector
  df
}

# Add names to X_test data frame. 
names(data) <- features$feature

# Add test label key.
data$label <- labels$label

# Add test label value. 
data <- left_join(data, a_l, by = c('label'='activity_key'))

# Add subject id to test data.
data$subject_id <- subject_ids$subject_key

# Hold vars for post-processing of mean and std extraction.
temp_vars <- data[, c('activity_label', 'subject_id')]

#################################
### Task 1, 3, and 4 complete ###
#################################

# Extract mean or std measurements
data_subset <- data[, which(str_detect(names(data), 'mean|std'))]
data_clean <- cbind(temp_vars, data_subset)

#######################
### Task 2 complete ###
#######################

# Make tidy data.
data_t <- melt(data_clean, id = c('activity_label', 'subject_id'))

# Calculate mean of value for each activity_label, subject_id, and variable.
data_t2 <- data_t %>%
  group_by(subject_id, activity_label, variable) %>%
  summarise(mean_value = mean(value)) %>%
  ungroup()

# Write out data_t2 to text file. 
write.table(data_t2, file = "tidy_data.txt")

#######################
### Task 5 complete ###
#######################
