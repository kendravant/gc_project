## Codebook for Getting and Cleaning Project, April 2014 ##
========================================================

Raw data (from the UCI Machine Learning Repository, Dataset: Human Activity Recognition Using Smartphones)

* X_test.txt
* X_train.txt
* y_text.txt
* t_train.txt
* subject_test.txt
* subject_train.txt

Associated metadata from

* features.txt
* activity_labels.txt


Tidy data

* meanAndStandardDeviationActivities.csv
* activityAveragebySubject.csv


### Study Design ###
--------------------

From the UCI_HAR dataset features_info.txt we have a general introduction to the origins of the data:

"The features in this dataset come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a 
median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the 
acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another 
low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and 
tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, 
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, 
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."



### meanAndStandardDeviationActivities ###
------------------------------------------
10,299 observations of 79 variables: 46 means and 33 standard deviations

This dataset contains only the features which are either a mean or a standard deviation.
* mean is the mean value
* std is the standard deviation
* mean.freq is the weighted average of the frequency components


####Variables list####

    subject.id               Identifier of the person performing the activity
    activity                 Activity (one of WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
    t.body.acc.mean.x
    t.body.acc.mean.y
    t.body.acc.mean.z
    t.body.acc.std.x
    t.body.acc.std.y
    t.body.acc.std.z
    t.gravity.acc.mean.x
    t.gravity.acc.mean.y
    t.gravity.acc.mean.z
    t.gravity.acc.std.x
    t.gravity.acc.std.y
    t.gravity.acc.std.z
    t.body.acc.jerk.mean.x
    t.body.acc.jerk.mean.y
    t.body.acc.jerk.mean.z
    t.body.acc.jerk.std.x
    t.body.acc.jerk.std.y
    t.body.acc.jerk.std.z
    t.body.gyro.mean.x
    t.body.gyro.mean.y
    t.body.gyro.mean.z
    t.body.gyro.std.x
    t.body.gyro.std.y
    t.body.gyro.std.z
    t.body.gyro.jerk.mean.x
    t.body.gyro.jerk.mean.y
    t.body.gyro.jerk.mean.z
    t.body.gyro.jerk.std.x
    t.body.gyro.jerk.std.y
    t.body.gyro.jerk.std.z
    t.body.acc.mag.mean
    t.body.acc.mag.std
    t.gravity.acc.mag.mean
    t.gravity.acc.mag.std
    t.body.acc.jerk.mag.mean
    t.body.acc.jerk.mag.std
    t.body.gyro.mag.mean
    t.body.gyro.mag.std
    t.body.gyro.jerk.mag.mean
    t.body.gyro.jerk.mag.std
    f.body.acc.mean.x
    f.body.acc.mean.y
    f.body.acc.mean.z
    f.body.acc.std.x
    f.body.acc.std.y
    f.body.acc.std.z
    f.body.acc.mean.freq.x
    f.body.acc.mean.freq.y
    f.body.acc.mean.freq.z
    f.body.acc.jerk.mean.x
    f.body.acc.jerk.mean.y
    f.body.acc.jerk.mean.z
    f.body.acc.jerk.std.x
    f.body.acc.jerk.std.y
    f.body.acc.jerk.std.z
    f.body.acc.jerk.mean.freq.x
    f.body.acc.jerk.mean.freq.y
    f.body.acc.jerk.mean.freq.z
    f.body.gyro.mean.x
    f.body.gyro.mean.y
    f.body.gyro.mean.z
    f.body.gyro.std.x
    f.body.gyro.std.y
    f.body.gyro.std.z
    f.body.gyro.mean.freq.x
    f.body.gyro.mean.freq.y
    f.body.gyro.mean.freq.z
    f.body.acc.mag.mean
    f.body.acc.mag.std
    f.body.acc.mag.mean.freq
    f.body.body.acc.jerk.mag.mean
    f.body.body.acc.jerk.mag.std
    f.body.body.acc.jerk.mag.mean.freq
    f.body.body.gyro.mag.mean
    f.body.body.gyro.mag.std
    f.body.body.gyro.mag.mean.freq
    f.body.body.gyro.jerk.mag.mean
    f.body.body.gyro.jerk.mag.std
    f.body.body.gyro.jerk.mag.mean.freq


### activityAveragebySubject ###
--------------------------------
180 observations of 79 variables

Each observation is the average of the variable for a given subject and activity

####Variables list####

    subject.id                    Identifier of the person performing the activity
    activity                      Activity (one of WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
    average(t.body.acc.mean.x)
    average(t.body.acc.mean.y)
    average(t.body.acc.mean.z)
    average(t.body.acc.std.x)
    average(t.body.acc.std.y)
    average(t.body.acc.std.z)
    average(t.gravity.acc.mean.x)
    average(t.gravity.acc.mean.y)
    average(t.gravity.acc.mean.z)
    average(t.gravity.acc.std.x)
    average(t.gravity.acc.std.y)
    average(t.gravity.acc.std.z)
    average(t.body.acc.jerk.mean.x)
    average(t.body.acc.jerk.mean.y)
    average(t.body.acc.jerk.mean.z)
    average(t.body.acc.jerk.std.x)
    average(t.body.acc.jerk.std.y)
    average(t.body.acc.jerk.std.z)
    average(t.body.gyro.mean.x)
    average(t.body.gyro.mean.y)
    average(t.body.gyro.mean.z)
    average(t.body.gyro.std.x)
    average(t.body.gyro.std.y)
    average(t.body.gyro.std.z)
    average(t.body.gyro.jerk.mean.x)
    average(t.body.gyro.jerk.mean.y)
    average(t.body.gyro.jerk.mean.z)
    average(t.body.gyro.jerk.std.x)
    average(t.body.gyro.jerk.std.y)
    average(t.body.gyro.jerk.std.z)
    average(t.body.acc.mag.mean)
    average(t.body.acc.mag.std)
    average(t.gravity.acc.mag.mean)
    average(t.gravity.acc.mag.std)
    average(t.body.acc.jerk.mag.mean)
    average(t.body.acc.jerk.mag.std)
    average(t.body.gyro.mag.mean)
    average(t.body.gyro.mag.std)
    average(t.body.gyro.jerk.mag.mean)
    average(t.body.gyro.jerk.mag.std)
    average(f.body.acc.mean.x)
    average(f.body.acc.mean.y)
    average(f.body.acc.mean.z)
    average(f.body.acc.std.x)
    average(f.body.acc.std.y)
    average(f.body.acc.std.z)
    average(f.body.acc.mean.freq.x)
    average(f.body.acc.mean.freq.y)
    average(f.body.acc.mean.freq.z)
    average(f.body.acc.jerk.mean.x)
    average(f.body.acc.jerk.mean.y)
    average(f.body.acc.jerk.mean.z)
    average(f.body.acc.jerk.std.x)
    average(f.body.acc.jerk.std.y)
    average(f.body.acc.jerk.std.z)
    average(f.body.acc.jerk.mean.freq.x)
    average(f.body.acc.jerk.mean.freq.y)
    average(f.body.acc.jerk.mean.freq.z)
    average(f.body.gyro.mean.x)
    average(f.body.gyro.mean.y)
    average(f.body.gyro.mean.z)
    average(f.body.gyro.std.x)
    average(f.body.gyro.std.y)
    average(f.body.gyro.std.z)
    average(f.body.gyro.mean.freq.x)
    average(f.body.gyro.mean.freq.y)
    average(f.body.gyro.mean.freq.z)
    average(f.body.acc.mag.mean)
    average(f.body.acc.mag.std)
    average(f.body.acc.mag.mean.freq)
    average(f.body.body.acc.jerk.mag.mean)
    average(f.body.body.acc.jerk.mag.std)
    average(f.body.body.acc.jerk.mag.mean.freq)
    average(f.body.body.gyro.mag.mean)
    average(f.body.body.gyro.mag.std)
    average(f.body.body.gyro.mag.mean.freq)
    average(f.body.body.gyro.jerk.mag.mean)
    average(f.body.body.gyro.jerk.mag.std)
    average(f.body.body.gyro.jerk.mag.mean.freq)
