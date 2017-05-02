dataclean <- function(){
  data_dir <- "UCI HAR Dataset"
  file_path <- function(...) {paste (data_dir,...,sep="/")}
  
  # 1. Merges the training and the test sets to create one data set.
  xtrain <- read.table(file_path("train/X_train.txt"))
  xtest <- read.table(file_path("test/X_test.txt"))
  data <- merge(xtrain, xtest, all=T)
  
  # 2. Extracts only the measurements on the mean and standard deviation for each measurement.
  column_names <- read.table(file_path("features.txt"))[,2]
  colnames(data) <- column_names
  selected <- grepl('-(mean|std)\\(',column_names)
  data <- subset(data, select=selected)
  
  # 3. Uses descriptive activity names to name the activities in the data set
  colnames(data) <- gsub("^t", "Time", colnames(data))
  colnames(data) <- gsub("^f", "Frequency", colnames(data))
  colnames(data) <- gsub("BodyBody", "Body", colnames(data))
  colnames(data) <- gsub("\\(\\)", "", colnames(data))
  colnames(data) <- gsub("Acc", "Acceleration", colnames(data))
  colnames(data) <- gsub("Gyro", "Gyroscope", colnames(data))
  colnames(data)
  
  # 4. Appropriately labels the data set with descriptive variable names.
  activities_train <- read.table(file_path("train/y_train.txt"))
  activities_test <- read.table(file_path("test/y_test.txt"))
  activities <- rbind(activities_train,activities_test)[,1]
  labels <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS",
              "SITTING", "STANDING", "LAYING")
  activities <- labels[activities]
  data <- cbind(Activity = activities,data)
  
  #5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  subjects_train <- read.table(file_path("train/subject_train.txt"))
  subjects_test <- read.table(file_path("test/subject_test.txt"))
  subjects <- rbind(subjects_train,subjects_test)[,1]
  data <- cbind(Subject = subjects,data)
  require('dplyr')
  average_data <- data %>% group_by(subject, activity) %>% summarise_each(funs(mean))
  write.table(average_data,row.name = FALSE,file = "tidy_data_set.txt")
}