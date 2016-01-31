#Code Book


###Project Data Source
***
Description of the data for the project:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
<br/>
###Overview
***
30 volunteer subjects fitted with Samsung Galaxy S II smartphones on their waste performed 6 types of activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). The smartphones were able to capture data metrics about their physical movements whilst performing these 6 activities. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

<br/>
###Data Files
***
* ***features_info.txt***:    Shows information about the variables used on the feature vector.

* ***features.txt***:         List of all features.

* ***activity_labels.txt***:  Links the class labels with their activity name.

* ***train/X_train.txt***:    Training set.

* ***train/y_train.txt***:    Training labels.

* ***test/X_test.txt***:      Test set.

* ***test/y_test.txt***:      Test labels.

* ***README.txt***:           Dataset Helpfile. 

<br/>
###Subsetting Features
***
The required features for the tidy dataset was the mean & standard deviation measurements. 
We used the expression `-(mean|std)\\(\\)`  to subset our features.


<br/>
###Omitted Data Files
***
This analysis omitted the following dataset directories from its data analysis

1. ./UCI HAR Dataset/test/Inertial Signals/ 
2. ./UCI HAR Dataset/train/Inertial Signals/     

<br/>
###Tidy data Implementation
***

The Following Conventions Adhered To: [Google's R Style Guide](https://google.github.io/styleguide/Rguide.xml)

The preferred form for variable names is all lower case letters and words separated with dots (variable.name) as per
the Google's R Style Guide. 

* Removed all instances of hypen `"-"` and replaced with `"."` in the naming
* Lowered the case
* Removed all instances of `"()"` in the naming

Below is a sample of the variable names used in the new tidy data compared against the raw data.

| ***Raw data***    | ***Tidy data*** |
|-------------------|-----------------|
|                   | subject         |
|                   | activity        |
| tBodyAcc-mean()-X | tbodyacc.mean.x |
| tBodyAcc-mean()-Y | tbodyacc.mean.y |
| tBodyAcc-mean()-Z | tbodyacc.mean.z |
| tBodyAcc-std()-X  | tbodyacc.std.x  |
| tBodyAcc-std()-Y  | tbodyacc.std.y  |
| tBodyAcc-std()-Z	| tbodyacc.std.z  |



