# Human Activity Recognition Analysis
## Getting and Cleaning Data Course Project
Version 1.0

Date:   May 2017
Author: Hadi Rahmat-Khah
        Kettering University
        Flint, MI

## Project Description:
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

In this project, the following is performed:
   0. Loads the Human Activity Recognition Using Smartphones Dataset:
      0.1) Reads and refines the feature names.
	  0.2) Reads the activity names.
	  0.3) Reads the test and the training sets (the loadDataSet function):
	     0.3.1) Labels the columns of the data set with the feature names.
	     0.3.2) Adds the activity names to the data set.
         0.3.3) Adds the subject id to the data set.
   1. Merges the training and the test sets to create one data set.
   2. Extracts only the measurements on the mean and standard deviation for each measurement.
   5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## The dataset includes the following files:

- 'README.md'

- 'codebook.md': Describes the variables, the data, and transformations performed to clean up the data.

- 'run_analysis.R': Performs the analysis.

- 'prep.R': Downloads the data set and extract it in the data subfolder.

## License:
The use of this peoject must be in accordance with the Coursera Honor Code: https://learner.coursera.help/hc/en-us/articles/209818863
