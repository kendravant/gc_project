# Creates two tidy datasets containing both test and training data for Samsung Galaxy S accelerometer data 
# Set 1 (meanAndStandardDeviationFeatures.txt) contains only the mean and standard deviation features
# Set 2 (featureAveragebySubjectAndActivity.txt) contains the average for each selected feature by subject and activity

# Load required libraries
library(plyr)
library(reshape2)

# Read in the data
XTest <- read.table("UCI_HAR_Dataset//test//X_test.txt", nrows = 2950, comment.char = "", colClasses = c("numeric"))
XTrain <- read.table("UCI_HAR_Dataset//train//X_train.txt", nrows = 7355, comment.char = "", colClasses = c("numeric"))
yTest <- read.table("UCI_HAR_Dataset//test//y_test.txt", colClasses = c("factor"))
yTrain <- read.table("UCI_HAR_Dataset//train//y_train.txt", colClasses = c("factor"))
subjectTest <- read.table("UCI_HAR_Dataset//test//subject_test.txt")
subjectTrain <- read.table("UCI_HAR_Dataset//train//subject_train.txt")

# Read in the feature and activity names
features <- read.table("UCI_HAR_Dataset//features.txt")
activities <- read.table("UCI_HAR_Dataset//activity_labels.txt",stringsAsFactor=FALSE)
names(features) <- c("colNumber","featureName")
names(activities) <- c("activityID","activityName")

# Combine the training and test data set and translate the y values from codes to activity names 
X <- rbind(XTrain,XTest)
y <- rbind(yTrain,yTest) 
y <- revalue(y$V1, c("1"=activities$activityName[1], 
                     "2"=activities$activityName[2],
                     "3"=activities$activityName[3],
                     "4"=activities$activityName[4],
                     "5"=activities$activityName[5],
                     "6"=activities$activityName[6]))
subject <- rbind(subjectTrain,subjectTest)

# Remove intermediate variables
rm(subjectTest, subjectTrain, yTest, yTrain, XTest, XTrain)

# Select only the features which are either a mean or a standard deviation
# This includes mean(), std() and meanFreq()
featuresToKeep <- grep("mean|std()",features$featureName)

# Create a tidy names vector (note that the order of the statements in the below matters!)
namesVector1 <- c("subject.id","activity", as.character(features$featureName[featuresToKeep]))
namesVector1 <- gsub("([a-z])([A-Z])", "\\1.\\2", namesVector1, perl = TRUE)
namesVector1 <- gsub("-",".", namesVector1, perl=TRUE)
namesVector1 <- gsub("()","", namesVector1, fixed=TRUE)
namesVector1 <- tolower(namesVector1)

# Create a dataset with the subject ID, the activity and the mean and standard deviation features 
# and write it out to the file meanAndStandardDeviationFeatures.txt
meanAndStandardDeviationFeatures <-  cbind(subject,y,X[,featuresToKeep])
names(meanAndStandardDeviationFeatures) <- namesVector1
meanAndStandardDeviationFeatures <- arrange(meanAndStandardDeviationFeatures, 
                                            meanAndStandardDeviationFeatures$subject.id)
write.csv(meanAndStandardDeviationFeatures,"meanAndStandardDeviationFeatures.csv",row.names=FALSE)
write.table(meanAndStandardDeviationFeatures,"meanAndStandardDeviationFeatures.txt",row.names=FALSE)

# Create a tidy names vector
namesVector2 <- paste("average(",namesVector1,")",sep="")
namesVector2[1:2] <- c("subject.id","activity")

# Create a dataset of the average for each feature by activity and by subject
# and write it out to the file featureAveragebySubjectAndActivity.txt
meltedData <- melt(meanAndStandardDeviationFeatures, id = c("subject.id","activity"))
averagesTable <-dcast(meltedData, subject.id + activity ~ variable, mean)
names(averagesTable) <- namesVector2
write.csv(averagesTable,"featureAveragebySubjectAndActivity.csv",row.names=FALSE)
write.table(averagesTable,"featureAveragebySubjectAndActivity.txt",row.names=FALSE)
