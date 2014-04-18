# Load required libraries
library(reshape)

# Merging the training and test sets

subjectTest <- read.table("UCI_HAR_Dataset//test//subject_test.txt")
subjectTrain <- read.table("UCI_HAR_Dataset//train//subject_train.txt")
XTest <- read.table("UCI_HAR_Dataset//test//X_test.txt")
XTrain <- read.table("UCI_HAR_Dataset//train//X_train.txt")
yTest <- read.table("UCI_HAR_Dataset//test//y_test.txt")
yTrain <- read.table("UCI_HAR_Dataset//train//y_train.txt")

X <- rbind(XTest,XTrain)
y <- rbind(yTest,yTrain) 
subject <- rbind(subjectTest,subjectTrain)

# Reading in the feature names
features <- read.table("UCI_HAR_Dataset//features.txt")
names(features) <- c("colNumber","featureName")

# Selecting just the features which are mean or std
featuresWithMean <- grep("mean",features$featureName)
featuresWithStd <- grep("std",features$featureName)
featuresToKeep <- sort(c(featuresWithMean,featuresWithStd))
XSelectedFeatures <- X[,featuresToKeep]

# Adding column names to X data and subject dataframe
names(XSelectedFeatures) <- as.character(features$featureName[featuresToKeep])
names(subject) <- c("subjectID")

XSelectedFeaturesBySubject <- split(cbind(subject,XSelectedFeatures),subject)
averagesTable <- as.data.frame(t(sapply(XSelectedFeaturesBySubject, function(x) colMeans(x))))


newNames <- paste("average(",names(averagesTable),")",sep="")
newNames[1] <- c("subjectID")
names(averagesTable) <- newNames

# Writing out the tidy datasets

write.table(XSelectedFeatures,"tidydata1.txt",row.names=FALSE)
write.table(averagesTable,"tidydata2.txt",row.names=FALSE)
