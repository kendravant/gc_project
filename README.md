README
========================================================

The file run_analysis.R reads in the datasets:

	X_test.txt
	X_train.txt
	y_text.txt
	t_train.txt
	subject_test.txt
	subject_train.txt

and merges the test and training datasets together

It also reads in the feature and activity names from: 

	features.txt
	activity_labels.txt

and creates standardised variable names using the word.word.word convention

Two data sets are created and written out to file

	meanAndStandardDeviationFeatures.txt 

		which contains only the mean and standard deviation features along with the subject ID and activity
	

	featureAveragebySubjectAndActivity.txt 

		which contains the average for each feature by subject ID and activity


Required libraries (loaded by run_analysis.R): 

	reshape
	plyr