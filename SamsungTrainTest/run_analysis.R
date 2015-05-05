features <- read.table("UCI HAR Dataset\\features.txt", header = FALSE)
  # 561 rows; V1, V2
subject_train <- read.table("UCI HAR Dataset\\train\\subject_train.txt", header = FALSE) 
  # 7352 rows, 561 columns
x_train <- read.table("UCI HAR Dataset\\train\\X_train.txt", header = FALSE)
  # 11228 rows, 561 columns
y_train <- read.table("UCI HAR Dataset\\train\\y_train.txt", header = FALSE)
  # 7352 rows, 1 columns
subject_test <- read.table("UCI HAR Dataset\\test\\subject_test.txt", header = FALSE) # 7352 rows
  # 2947 rows, 1 columns
x_test <- read.table("UCI HAR Dataset\\test\\X_test.txt", header = FALSE)
  # 4312 rows, 561 columns
y_test <- read.table("UCI HAR Dataset\\test\\y_test.txt", header = FALSE)
  # 2947 rows, 1 columns
activity_labels <- read.table("UCI HAR Dataset\\activity_labels.txt", header=FALSE)
  # 6 rows, 2 colummns

# Merge train and test data
train <- cbind(subject_train, y_train, x_train) # 7352 rows, 563 columns
test <- cbind(subject_test, y_test, x_test) # 2947 rows, 563 variables
merged <- rbind (train, test) # 10299 rows, 563 variables

# Extracts only the measurements on the mean and standard deviation for each measurement.
features_filter <- grep("-(mean|std)\\(\\)", features[, 2]) ## 66 length array
extracted <- merged[,c(1,2,features_filter+2)] # 10299 rows, 66 variables
desired_names <- features[features_filter,2]
for (i in seq(length(desired_names),1)) {
  desired_names[i+2] <- desired_names[i]  
}
desired_names <- factor(desired_names, levels = c("subject","activity",levels(desired_names)))

# Appropriately labels the data set with descriptive variable names. 
desired_names[1] <- as.factor("subject")
desired_names[2] <- as.factor("activity")
names(extracted) <- desired_names
#verify:   View(extracted[1:2,])

# Uses descriptive activity names to name the activities in the data set
extracted[,2] <- activity_labels[extracted[,2],2]

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(plyr)
tidy<-ddply(extracted, .(subject, activity), function(x) colMeans(x[, 3:68]))
write.table(tidy, "tidy.txt", row.name=FALSE) # 180 rows, 68 columns
