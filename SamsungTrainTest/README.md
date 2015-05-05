## Getting and Cleaning Data Project Assignment

### Files

**CodeBook.md** describes the variables and the data.

**run_analysis.R** contains all the code to perform the analyses.

**tidy.txt** contains the tidy data file, and uploaded in the course project's form.


#### Before running the script
The working directory should contain the Samsung data in its original format and folder structure (the folder name should be *UCI HAR Dataset* as it is after you extract the source files from the zip file).

#### Merges the training and the test sets to create one data set.
Tables subject_train, y_train and x_train combined into a data frame with 7352 rows and 563 variables
Tables subject_test, y_test, x_test cobmined into a data frame 2947 rows, 563 variables
Two data frames above then combined into a data frame of 10299 rows, 563 variables

#### Extracts only the measurements on the mean and standard deviation for each measurement. 
The original table of features contains 561 rows.
After filtering mean/std we have 66 remaining features that I will use for filtering. 
66 columns (features) were filtered out.

#### Uses descriptive activity names to name the activities in the data set
Values from the 2nd column ("activity") is replaced from a number code into an english word name

#### Appropriately labels the data set with descriptive variable names. 
66 column names are updated to the corresponding feature name
When I combined 561 feature-based columns with 2 tables, there are 2 extra columns added, that I need to rename to "Subject" and "Activity" rexspectively, and two additional factors and levels were created. 

#### From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
The data set is aggegated with brouping by two columns "Activity" and "Subject"
The aggregate function (mean) is used