##Course Project

###Assignment: Getting and Cleaning Data Course Project
***
The purpose of this assignment was to tidy a dataset and do some simple analysis on the dataset. The original source dataset can be found here [HERE](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

These are the steps our **run_analysis.R** script executes:-

1. Merges the training and the test datasets to create one new dataset.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the dataset

4. Appropriately labels the dataset with descriptive activity names.

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###Steps to work on this course project

1. Download the source data and put into your working directory. After unzipping the file you'll have a UCI HAR Dataset folder    in which the datasets are found.

2. Put **run_analysis.R** in the parent-directory (SAME DIRECTORY) as the UCI HAR Dataset folder, then set it as your working     directory using setwd() function from within R-Studio or from the R console.

3. Run source("**run_analysis.R**"), this script will tidy the main dataset and output the average of each variable for each  
   activity and each subject and tabulated the results **tidydata.txt** in your working directory. 

   
###Dependencies

**run_analysis.R** script will load the dependencies for you. It requires libraries plyr and data.table to be installed.