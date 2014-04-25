README
========================================================

The file run_analysis.R reads in the datasets:

	X_test.txt
	X_train.txt
	y_text.txt
	t_train.txt
	subject_test.txt
	subject_train.txt

and merges the test and training datasets together.

It also reads in the feature and activity names from: 

	features.txt
	activity_labels.txt

and creates standardised variable names using the word.word.word convention

Two data sets are created and written out to csv files

	*meanAndStandardDeviationFeatures.csv*

		which contains only the features containing mean and standard deviation measurements along with the subject ID and activity
	

	*featureAveragebySubjectAndActivity.csv* 

		which contains the average for each selected feature by subject ID and activity


Required libraries (loaded by run_analysis.R): 

	reshape2
	plyr


Details of the variable names and data sources can be found in Codebook.md