# Script Description of the Clearing Data Project

## Background
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data in this course project represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The objective of this course project is to create an independent tidy data set with the mean of each measurement for each activity abd each subject. 


## Requirements to run "run_analysis.R"

* To run "run_analysis.R", the "reshape2" R package is needed. You could use command "install.packages("reshape2")" to download the "reshape2" R package.

* The "run_analysis.R" generates a tidy data set which consists of the mean of each measurement for each activity and each subject.


## Data files needed to run the "run_analysis.R"

* features.txt
* subject-train.txt
* subject_test.txt
* X_train.txt
* X_test.txt
* Y_train.txt
* Y_test.txt


## Scripts in run_analysis.R

### 1. Read and merge the training data set and the test data set
####   Form the training data set
#####  Reading "subject-train.txt", "X_train.txt" and "Y_train.txt" into three data frames

	sub_train <- read.table("subject_train.txt")
	X_train <- read.table("X_train.txt", colClasses="numeric")
	Y_train <- read.table("y_train.txt")

#####  Adding variable names for the three data frames

	attNames <- read.table("features.txt")
	names(X_train) <- attNames[,2]
	names(Y_train) <- "Activity_id"
	names(sub_train) <- "Subject"

#####  Merging the three data frames to form the training data set

	training <- cbind(sub_train, Y_train, X_train)

####   Form in the test data set: Reading "subject_test.txt", "X_test.txt" and "Y_test.txt" into three data frames

	sub_test <- read.table("subject_test.txt")
	X_test <- read.table("X_test.txt", colClasses="numeric")
	Y_test <- read.table("y_test.txt")

#####  Adding variable names for the three data frames

	names(X_test) <- attNames[,2]
	names(Y_test) <- "Activity_id"
	names(sub_test) <- "Subject"

#####  Merging the three data frames to form the test data set

	test <- cbind(sub_test, Y_test, X_test)

####   Merge the training data set and the test data set

	completeData <- rbind(training, test)


### 2. Extract the mean and standard deviation of each measurement, and label the columns with descriptive variable names
	targetData <- completeData[,1:2]

	targetMean <- completeData[,grep("mean()", names(completeData), fixed=TRUE)]
	names(targetMean) <- sub("-mean()-X", replacement=".X.Mean", names(targetMean), 
                           fixed = TRUE)
	names(targetMean) <- sub("-mean()-Y", replacement=".Y.Mean", names(targetMean), 
                           fixed = TRUE)
	names(targetMean) <- sub("-mean()-Z", replacement=".Z.Mean", names(targetMean), 
                           fixed = TRUE)
	names(targetMean) <- sub("-mean()", replacement=".Mean", names(targetMean), 
                           fixed = TRUE)

	targetSTD <- completeData[,grep("std()", names(completeData), fixed=TRUE)]
	names(targetSTD) <- sub("-std()-X", replacement=".X.StandardDeviation", 
                          names(targetSTD), fixed = TRUE)
	names(targetSTD) <- sub("-std()-Y", replacement=".Y.StandardDeviation", 
                          names(targetSTD), fixed = TRUE)
	names(targetSTD) <- sub("-std()-Z", replacement=".Z.StandardDeviation", 
                          names(targetSTD), fixed = TRUE)
	names(targetSTD) <- sub("-std()", replacement=".StandardDeviation", 
                          names(targetSTD), fixed = TRUE)

	targetData <- cbind(targetData, targetMean)
	targetData <- cbind(targetData, targetSTD)
	

### 3. Name the acitivities
	activity <- data.frame("id"=1:6,"Activity"=c("WALKING","WALKING_UPSTAIRS",
                                             "WALKING_DOWNSTAIRS","SITTING",
                                             "STANDING","LAYING"))
	targetData <- merge(targetData, activity, by.x="Activity_id", by.y="id", all=TRUE)


### 4. Create the new data set
	targetData <- targetData[order(targetData$Subject, targetData$Activity_id), ]

	library(reshape2)
	x <- melt(targetData, id=c("Subject","Activity"), measure.vars=c(3:35)) 
	finalData <- dcast(x, Subject+Activity ~ variable,mean)        


### 5. Save the new data set in a TXT file
	write.table(finalData, "ProjectResult.txt", row.name=FALSE)
