## 1. Read and merge the training data set and the test data set
##    Read in the training data set
#     Read "subject-train.txt", "X_train.txt" and "Y_train.txt" into three data frames
	sub_train <- read.table("subject_train.txt")
	X_train <- read.table("X_train.txt", colClasses="numeric")
	Y_train <- read.table("y_train.txt")

#     Add variable names for the three data frames
	attNames <- read.table("features.txt")
	names(X_train) <- attNames[,2]
	names(Y_train) <- "Activity_id"
	names(sub_train) <- "Subject"

#     Merge the three data frames to form the training data set
	training <- cbind(sub_train, Y_train, X_train)

##    Read in the test data set
#     Read "subject_test.txt", "X_test.txt" and "Y_test.txt" into three data frames
	sub_test <- read.table("subject_test.txt")
	X_test <- read.table("X_test.txt", colClasses="numeric")
	Y_test <- read.table("y_test.txt")

#     Add variable names for the three data frames
	names(X_test) <- attNames[,2]
	names(Y_test) <- "Activity_id"
	names(sub_test) <- "Subject"

#     Merge the three data frames to form the test data set
	test <- cbind(sub_test, Y_test, X_test)

##    Merge the training data set and the test data set
	completeData <- rbind(training, test)


## 2. Extract the mean and standard deviation of each measurement, and 
## 4. Label the columns with descriptive variable names
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
	

## 3. Name the acitivities
	activity <- data.frame("id"=1:6,"Activity"=c("WALKING","WALKING_UPSTAIRS",
                                             "WALKING_DOWNSTAIRS","SITTING",
                                             "STANDING","LAYING"))
	targetData <- merge(targetData, activity, by.x="Activity_id", by.y="id", all=TRUE)


## 5. Create the new data set
	targetData <- targetData[order(targetData$Subject, targetData$Activity_id), ]

	library(reshape2)
	x <- melt(targetData, id=c("Subject","Activity"), measure.vars=c(3:35)) 
	finalData <- dcast(x, Subject+Activity ~ variable,mean)        


##    Save the new data set in a TXT file
	write.table(finalData, "ProjectResult.txt", row.name=FALSE)
  