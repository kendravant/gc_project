README
========================================================

This repository contains the data munging R code required to create a normalised feature set for mean, standard deviation and mean frequency features from the UCI_HAR dataset.

The file run_analysis.R reads in the datasets:

* X _test.txt
* X_train.txt
* y_text.txt
* t_train.txt
* subject_test.txt
* subject_train.txt

and merges the test and training datasets together. The raw data files are expected to be located in a directory UCI_HAR_Dataset contained within the working directory.

run_analysis.R also reads in the feature and activity names from: 

* features.txt
* activity_labels.txt

and creates standardised variable names using the word.word.word convention

Two data sets are created and written out to file:

**meanAndStandardDeviationFeatures.txt** which contains only the features containing mean, mean frequency and standard deviation measurements along with the subject ID and activity
	
**featureAveragebySubjectAndActivity.txt** which contains the average for each selected feature by subject ID and activity

The averages can be used to normalise the mean and standard deviation features, creating a clean set for training a classification algorithm.


run_analysis.R was written using R v3.1.0 "Spring Dance". To execute the script in your own workspace type

	> source("run_analysis.R")


The following required libraries are automatically loaded when the script is executed: 

* reshape2 (v1.2.2)
* plyr (v1.8.1)

If you do not have these packages installed in your version of R type

	> install.packages("reshape2","plyr")

Details of the variable names and data sources can be found in Codebook.md