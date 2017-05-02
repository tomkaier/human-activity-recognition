Getting and Cleaning Human Activity Recognition Using Smartphones Data Set

As per Coursera assignment for week 4:

The goal is to prepare tidy data that can be used for later analysis.

The data source will be: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

And its explanation could be found: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# All data transformation and cleaning is performed by dataclean.R:

## 1. Merges the training and the test sets to create one data set: X_train.txt and X_test.txt datasets, binding them together  into 1 main dataset

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.

## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. For this step, the dplyr package is used to perform the calculations. This is then saved as tidy_data_set.txt
