# Human Activity Recognition Analysis
## Getting and Cleaning Data Course Project

Author: Hadi Rahmat-Khah  
Date:   May 2017  
Ver:    1.0

## Description
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

In this project, the following operatins are performed:
1. Loads the Human Activity Recognition Using Smartphones Dataset:
   1. Reads and refines the feature names.
   2. Reads the activity names.
   3. Reads the test and the training sets (the loadDataSet function):
      1. Labels the columns of the data set with the feature names.
      2. Adds the activity names to the data set.
      3. Adds the subject id to the data set.
2. Merges the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement.
4. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Files

* 'README.md'
* 'codebook.md': Describes the variables, the data, and transformations performed to clean up the data.
* 'run_analysis.R': Performs the analysis.
* 'prep.R': Downloads the data set and extract it in the data subfolder.

## License
The use of this project must be in accordance with the Coursera Honor Code: https://learner.coursera.help/hc/en-us/articles/209818863
