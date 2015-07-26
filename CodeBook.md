# CodeBook for the Clearing Data Project

## Source of Raw Data

The raw data for the project was obtained from the following link: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A full description of the raw date is available at the following site:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## Steps to transform from the raw data to the tidy data set
### 1. Read and merge the training data set and the test data set to form the complete data set
* Prepare the training data set, including reading "subject-train.txt", "X_train.txt" and "Y_train.txt" into three data frames, adding variable names for the three data frames, and merging the three data frames to form the training data set
* Prepare the test data set, including reading "subject_test.txt", "X_test.txt" and "Y_test.txt" into three data frames, adding variable names for the three data frames, and merging the three data frames to form the test data set
* Merge the training data set and the test data set

### 2. Extract the mean and standard deviation of each measurement from the complete data set, and then label the columns with descriptive variable names

### 3. Link the acitivity names with Activity_id in the data set

### 4. Create the tidy data set of the average of each mean measurement for each activity and each subject


## Variables in the tidy data set (in the order of columns in the tidy data set)

| Variable (header)		| Description     |
|---------------------|-----------------|
| Subject 		        | Index of subjects (1-30)  |
| Activity 		   | Activity names  
| tBodyAcc.X.Mean 	    | Average of time-domian x-axis signals for body acceleration
| tBodyAcc.Y.Mean       | Average of time-domian y-axis signals for body acceleration 
| tBodyAcc.Z.Mean 	    | Average of time-domian z-axis signals for body acceleration
| tGravityAcc.X.Mean 	  | Average of time-domian x-axis signals for gravity acceleration
| tGravityAcc.Y.Mean 	  | Average of time-domian y-axis signals for gravity acceleration
| tGravityAcc.Z.Mean 	  | Average of time-domian z-axis signals for gravity acceleration
| tBodyAccJerk.X.Mean 	| Average of time-domian Jerk signals for body acceleration in x-axis 
| tBodyAccJerk.Y.Mean 	| Average of time-domian Jerk signals for body acceleration in y-axis
| tBodyAccJerk.Z.Mean 	| Average of time-domian Jerk signals for body acceleration in z-axis
| tBodyGyro.X.Mean 	    | Average of time-domian x-axis signals from gyroscope
| tBodyGyro.Y.Mean 	    | Average of time-domian y-axis signals from gyroscope
| tBodyGyro.Z.Mean 	    | Average of time-domian z-axis signals from gyroscope
| tBodyGyroJerk.X.Mean 	| Average of time-domian x-axis Jerk signals from gyroscope
| tBodyGyroJerk.Y.Mean 	| Average of time-domian y-axis Jerk signals from gyroscope
| tBodyGyroJerk.Z.Mean  | Average of time-domian z-axis Jerk signals from gyroscope
| tBodyAccMag.Mean 	    | Average of time-domian Euclidean magnitudes of body acceleration
| tGravityAccMag.Mean 	| Average of time-domian Euclidean magnitudes of gravity acceleration
| tBodyAccJerkMag.Mean 	| Average of time-domian Euclidean magnitudes of Jerk acceleration
| tBodyGyroMag.Mean 	  | Average of time-domian Euclidean magnitudes of angular velocity
| tBodyGyroJerkMag.Mean | Average of time-domian Euclidean magnitudes of Jerk angular velocity
| fBodyAcc.X.Mean 	    | Average of frequency-domian x-axis signals for body acceleration
| fBodyAcc.Y.Mean 	    | Average of frequency-domian y-axis signals for body acceleration
| fBodyAcc.Z.Mean 	    | Average of frequency-domian z-axis signals for body acceleration
| fBodyAccJerk.X.Mean 	| Average of frequency-domian Jerk signals for body acceleration in x-axis
| fBodyAccJerk.Y.Mean 	| Average of frequency-domian Jerk signals for body acceleration in y-axis
| fBodyAccJerk.Z.Mean 	| Average of frequency-domian Jerk signals for body acceleration in z-axis
| fBodyGyro.X.Mean 	    | Average of frequency-domian x-axis signals from gyroscope
| fBodyGyro.Y.Mean 	    | Average of frequency-domian y-axis signals from gyroscope
| fBodyGyro.Z.Mean 	    | Average of frequency-domian z-axis signals from gyroscope
| fBodyAccMag.Mean 	    | Average of frequency-domian Euclidean magnitudes of body acceleration
| fBodyBodyAccJerkMag.Mean  | Average of frequency-domian Euclidean magnitudes of Jerk acceleration
| fBodyBodyGyroMag.Mean | Average of frequency-domian Euclidean magnitudes of angular velocity
| fBodyBodyGyroJerkMag.Mean | Average of frequency-domian Euclidean magnitudes of Jerk angular velocity

