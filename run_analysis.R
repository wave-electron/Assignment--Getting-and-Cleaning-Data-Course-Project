#  run_analysis.R
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average
#    of each variable for each activity and each subject.

  library(plyr)
  library(data.table)

#===============================================================================
# STEP1. Merges the training and the test sets to create one data set. 
#===============================================================================

  x.train <- read.table("./train/X_train.txt")
  y.train <- read.table("./train/y_train.txt")
  subject.train <- read.table("./train/subject_train.txt")

  x.test <- read.table("./test/X_test.txt")
  y.test <- read.table("./test/y_test.txt")
  subject.test <- read.table("./test/subject_test.txt")

  # bind x datasets
  x.data <- rbind(x.train, x.test)

  # bind y datasets
  activity.data <- rbind(y.train, y.test)

  # create 'subject' data set
  subject.data <- rbind(subject.train, subject.test)
  names(subject.data) <- c("subject")

#==============================================================================  
# STEP2.Extracts only the measurements on the mean and sd for each measurement.
#===============================================================================

  # read in features dataset only second column.

  features <- read.table("./features.txt",header=FALSE,sep="")[, 2]

  # make a logical indexing vector on features to extract only mean and sd for each measurement
  # we do this using grepl function because it returns a logical vector for match or not match against
  # our features.

  features.logical <- grepl("-(mean|std)\\(\\)", features)
 

  # subset features with our logical indexing vector

  features.subset <- features[features.logical]
  
  # let's tidy the naming convention for our feature variables
  
  # Lets find and replace "-" with "."
  features.tidynames <- gsub("-",".",features.subset)
  # let's lower the case
  features.tidynames <- tolower(features.tidynames)
  # remove the "("
  features.tidynames <- gsub("\\(|","",features.tidynames)
  # remove the ")"
  features.tidynames <- gsub("\\)|","",features.tidynames)
  

  # again use our logical indexing vector to extract only mean and sd for each measurement for
  # our x test & train datasets.

  x.data <- x.data[, as.factor(features.tidynames)]
  names(x.data) <- features.tidynames

#================================================================================
# STEP3. Uses descriptive activity names to name the activities in the data set.
# STEP4. Appropriately labels the data set with descriptive variable names.
#================================================================================

  # lets read our descriptive activity names.

  activity.labels <- read.table("./activity_labels.txt")

  # Merge the activity labels with the activity data

  activity <- factor(activity.data[, 1], labels=activity.labels[, 2])

  # Combine all the columns together into tidydata set.

  tidy.data <- cbind(x.data,activity,subject.data)

#================================================================================
# STEP5. From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.
#================================================================================

  tidy.data.averages <- ddply(tidy.data, .(subject, activity), function(x) colMeans(x[, 1:66]))

  write.table(tidy.data.averages, "tidydata.txt", row.name=FALSE)

