# Creates tidy datasets containing both test and training data for 
# Samsung Galaxy S accelerometer data 


# Load required libraries
library(reshape)
library(plyr)

# Read in the data
XTest <- read.table("UCI_HAR_Dataset//test//X_test.txt", nrows = 2950, comment.char = "", colClasses = c("numeric"))
XTrain <- read.table("UCI_HAR_Dataset//train//X_train.txt", nrows = 7355, comment.char = "", colClasses = c("numeric"))
yTest <- read.table("UCI_HAR_Dataset//test//y_test.txt", colClasses = c("factor"))
yTrain <- read.table("UCI_HAR_Dataset//train//y_train.txt", colClasses = c("factor"))
subjectTest <- read.table("UCI_HAR_Dataset//test//subject_test.txt", colClasses = c("factor"))
subjectTrain <- read.table("UCI_HAR_Dataset//train//subject_train.txt", colClasses = c("factor"))

# Read in the feature and activity names
features <- read.table("UCI_HAR_Dataset//features.txt")
activities <- read.table("UCI_HAR_Dataset//activity_labels.txt",stringsAsFactor=FALSE)
names(features) <- c("colNumber","featureName")
names(activities) <- c("activityID","activityName")

# Combine the training and test data and remove intermediate variables
X <- rbind(XTest,XTrain)
y <- rbind(yTest,yTrain) 
y <- revalue(y$V1, c("1"=activities$activityName[1], 
                     "2"=activities$activityName[2],
                     "3"=activities$activityName[3],
                     "4"=activities$activityName[4],
                     "5"=activities$activityName[5],
                     "6"=activities$activityName[6]))
subject <- rbind(subjectTest,subjectTrain)
rm(subjectTest, subjectTrain, yTest, yTrain, XTest, XTrain)


# Select only the features which are either a mean or a standard deviation
featuresWithMean <- grep("mean",features$featureName)
featuresWithStd <- grep("std",features$featureName)
featuresToKeep <- sort(c(featuresWithMean,featuresWithStd))
XSelectedFeatures <- X[,featuresToKeep]


# Create a dataset with the subject ID, the activity and the mean and standard deviation features
# and write this out to the file meanAndStandardDeviationActivities.txt
meanAndStandardDeviationFeatures <-  cbind(subject,y,XSelectedFeatures)
names(meanAndStandardDeviationFeatures) <- c("subjectID","activity", as.character(features$featureName[featuresToKeep]))
write.table(meanAndStandardDeviationFeatures,"meanAndStandardDeviationFeatures.txt",row.names=FALSE)


# Create a dataset of the average for each feature by activity and by subject
allFeatures = cbind(subject,y,X)
names(allFeatures) <- c("subjectID","activity", as.character(features$featureName))
meltedData <- melt(allFeatures, id = c("subjectID","activity"))
averagesTable <-cast(meltedData, subjectID + activity ~ variable, mean)
averagesTable$subjectID <- as.numeric(averagesTable$subjectID)
averagesTable <- arrange(averagesTable, averagesTable$subjectID)
  
# Update the names in the averages table
newNames <- paste("average(",names(averagesTable),")",sep="")
newNames[1] <- c("subjectID")
newNames[2] <- c("activity")
names(averagesTable) <- newNames

# Write out the dataset with activity averages per subject per activity 
# to the file featureAveragebySubjectAndActivity.txt
write.table(averagesTable,"featureAveragebySubjectAndActivity.txt",row.names=FALSE)
