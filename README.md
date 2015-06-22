# Script Description of the Clearing Data Project

## Background
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data in this course project represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The objective of this course project is to create an independent tidy data set with the mean of each measurement for each activity abd each subject. 


## Requirements to run "run_analysis.R"

* To run "run_analysis.R", the "reshape2" R package is needed. You could use command "install.packages("reshape2")" to download the "reshape2" R package.

* The "run_analysis.R" generates a tidy data set which consists of the mean of each measurement for each activity abd each subject.


## Data files needed to run the "run_analysis.R"

* features.txt
* subject-train.txt
* subject_test.txt
* X_train.txt
* X_test.txt
* Y_train.txt
* Y_test.txt


## Scripts in run_analysis.R

%# Read and merge the training data set and the test data set
/##  Read in the training data set
/#     Read "subject-train.txt", "X_train.txt" and "Y_train.txt" into three data frames
sub_train <- read.table("subject_train.txt")
X_train <- read.table("X_train.txt", colClasses="numeric")
Y_train <- read.table("y_train.txt")

/#     Add variable names for the three data frames
attNames <- read.table("features.txt")
names(X_train) <- attNames[,2]
names(Y_train) <- "Activity_id"
names(sub_train) <- "Subject"

/#     Merge the three data frames to form the training data set
training <- cbind(sub_train, Y_train, X_train)

/##  Read in the test data set
/#     Read "subject_test.txt", "X_test.txt" and "Y_test.txt" into three data frames
sub_test <- read.table("subject_test.txt")
X_test <- read.table("X_test.txt", colClasses="numeric")
Y_test <- read.table("y_test.txt")

/#     Add variable names for the three data frames
names(X_test) <- attNames[,2]
names(Y_test) <- "Activity_id"
names(sub_test) <- "Subject"

/#     Merge the three data frames to form the test data set
test <- cbind(sub_test, Y_test, X_test)

/##  Merge the training data set and the test data set
completeData <- rbind(training, test)


/### Extract the mean and standard deviation of each measurement
targetData <- completeData[,1:8]
for (i in 1:4) {
  x <- completeData[,(i*40+3):(i*40+8)]
  targetData <- cbind(targetData, x)
}

x <- completeData[,c(203,204,216,217,229,230,242,243,255,256)]
targetData <- cbind(targetData, x)

for (i in 0:2) {
  x <- completeData[,(i*79+268):(i*79+273)]
  targetData <- cbind(targetData, x)
}

x <- completeData[,c(505,506,518,519,531,532,544,545)]
targetData <- cbind(targetData, x)


/### Name the acitivities
activity <- data.frame("id"=1:6,"Activity"=c("WALKING","WALKING_UPSTAIRS",
                                             "WALKING_DOWNSTAIRS","SITTING",
                                             "STANDING","LAYING"))
targetData <- merge(targetData,activity, by.x="Activity_id", by.y="id", all=TRUE)


/### Label the variables
targetData <- targetData[order(targetData$Subject, targetData$Activity_id), ]
varNames <- names(targetData)
varNames[3] <- "tBodyAcc.X.Mean";            varNames[4] <- "tBodyAcc.Y.Mean"
varNames[5] <- "tBodyAcc.Z.Mean";            varNames[6] <- "tBodyAcc.X.StandardDeviation"           
varNames[7] <- "tBodyAcc.Y.StandardDeviation"; 
varNames[8] <- "tBodyAcc.Z.StandardDeviation"           
varNames[9] <- "tGravityAcc.X.Mean";         varNames[10] <- "tGravityAcc.Y.Mean"       
varNames[11] <- "tGravityAcc.Z.Mean";        varNames[12] <- "tGravityAcc.X.StandardDeviation"        
varNames[13] <- "tGravityAcc.Y.StandardDeviation";         
varNames[14] <- "tGravityAcc.Z..StandardDeviation"        
varNames[15] <- "tBodyAccJerk.X.Mean";       varNames[16] <- "tBodyAccJerk.Y.Mean"      
varNames[17] <- "tBodyAccJerk.Z.Mean";       varNames[18] <- "tBodyAccJerk.X.StandardDeviation"       
varNames[19] <- "tBodyAccJerk.Y.StandardDeviation";        
varNames[20] <- "tBodyAccJerk.Z.StandardDeviation"       
varNames[21] <- "tBodyGyro.X.Mean";          varNames[22] <- "tBodyGyro.Y.Mean"         
varNames[23] <- "tBodyGyro.Z.Mean";          varNames[24] <- "tBodyGyro.X.StandardDeviation"          
varNames[25] <- "tBodyGyro.Y.StandardDeviation";
varNames[26] <- "tBodyGyro.Z.StandardDeviation"          
varNames[27] <- "tBodyGyroJerk.X.Mean";      varNames[28] <- "tBodyGyroJerk.Y.Mean"     
varNames[29] <- "tBodyGyroJerk.Z.Mean";      varNames[30] <- "tBodyGyroJerk.X.StandardDeviation"      
varNames[31] <- "tBodyGyroJerk.Y.StandardDeviation";  
varNames[32] <- "tBodyGyroJerk.Z.StandardDeviation"      
varNames[33] <- "tBodyAccMag.Mean";          varNames[34] <- "tBodyAccMag.StandardDeviation"          
varNames[35] <- "tGravityAccMag.Mean";       varNames[36] <- "tGravityAccMag.StandardDeviation"       
varNames[37] <- "tBodyAccJerkMag.Mean";      varNames[38] <- "tBodyAccJerkMag.StandardDeviation"      
varNames[39] <- "tBodyGyroMag.Mean";         varNames[40] <- "tBodyGyroMag.StandardDeviation"         
varNames[41] <- "tBodyGyroJerkMag.Mean";     varNames[42] <- "tBodyGyroJerkMag.StandardDeviation"     
varNames[43] <- "fBodyAcc.X.Mean";           varNames[44] <- "fBodyAcc.Y.Mean"          
varNames[45] <- "fBodyAcc.Z.Mean";           varNames[46] <- "fBodyAcc.X.StandardDeviation"           
varNames[47] <- "fBodyAcc.Y.StandardDeviation"; 
varNames[48] <- "fBodyAcc.Z.StandardDeviation"           
varNames[49] <- "fBodyAccJerk.X.Mean";       varNames[50] <- "fBodyAccJerk.Y.Mean"      
varNames[51] <- "fBodyAccJerk.Z.Mean";       varNames[52] <- "fBodyAccJerk.X.StandardDeviation"       
varNames[53] <- "fBodyAccJerk.Y.StandardDeviation";        
varNames[54] <- "fBodyAccJerk.Z.StandardDeviation"       
varNames[55] <- "fBodyGyro.X.Mean";          varNames[56] <- "fBodyGyro.Y.Mean"         
varNames[57] <- "fBodyGyro.Z.Mean";          varNames[58] <- "fBodyGyro.X.StandardDeviation"          
varNames[59] <- "fBodyGyro.Y.StandardDeviation";
varNames[60] <- "fBodyGyro.Z.StandardDeviation"          
varNames[61] <- "fBodyAccMag.Mean";          varNames[62] <- "fBodyAccMag..StandardDeviation"          
varNames[63] <- "fBodyBodyAccJerkMag.Mean";  varNames[64] <- "fBodyBodyAccJerkMag.StandardDeviation"  
varNames[65] <- "fBodyBodyGyroMag.Mean";     varNames[66] <- "fBodyBodyGyroMag.StandardDeviation"     
varNames[67] <- "fBodyBodyGyroJerkMag.Mean"; varNames[68] <- "fBodyBodyGyroJerkMag.StandardDeviation" 

names(targetData) <- varNames


/### Create the new data set
library(reshape2)
x <- melt(targetData, id=c("Subject","Activity"), 
          measure.vars=c("tBodyAcc.X.Mean","tBodyAcc.Y.Mean", "tBodyAcc.Z.Mean",           
                         "tGravityAcc.X.Mean", "tGravityAcc.Y.Mean", "tGravityAcc.Z.Mean",
                         "tBodyAccJerk.X.Mean", "tBodyAccJerk.Y.Mean", "tBodyAccJerk.Z.Mean",
                         "tBodyGyro.X.Mean", "tBodyGyro.Y.Mean", "tBodyGyro.Z.Mean",
                         "tBodyGyroJerk.X.Mean", "tBodyGyroJerk.Y.Mean", "tBodyGyroJerk.Z.Mean",
                         "tBodyAccMag.Mean", "tGravityAccMag.Mean", "tBodyAccJerkMag.Mean", 
                         "tBodyGyroMag.Mean", "tBodyGyroJerkMag.Mean", 
                         "fBodyAcc.X.Mean", "fBodyAcc.Y.Mean", "fBodyAcc.Z.Mean", 
                         "fBodyAccJerk.X.Mean", "fBodyAccJerk.Y.Mean",  "fBodyAccJerk.Z.Mean",
                         "fBodyGyro.X.Mean", "fBodyGyro.Y.Mean", "fBodyGyro.Z.Mean", 
                         "fBodyAccMag.Mean", "fBodyBodyAccJerkMag.Mean", 
                         "fBodyBodyGyroMag.Mean", "fBodyBodyGyroJerkMag.Mean"))
finalData <- dcast(x, Subject+Activity ~ variable,mean)        


/### Save the new data set in a TXT file
write.table(finalData, "ProjectResult.txt", row.name=FALSE)
