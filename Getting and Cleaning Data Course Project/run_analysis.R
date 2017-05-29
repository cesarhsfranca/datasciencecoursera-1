# Human Activity Recognition Analysis
# Getting and Cleaning Data Course Project
# Version 1.0
# 
# Date:   May 2017
# Author: Hadi Rahmat-Khah
#         Kettering University
#         Flint, MI

# Loads the necessary libraries
library(stringr)
library(dplyr)

# Sets the input filenames.
featureNamesFilename <- "./data/UCI HAR Dataset/features.txt"
activityLabelsFilename <- "./data/UCI HAR Dataset/activity_labels.txt"

testSetFilename <- "./data/UCI HAR Dataset/test/X_test.txt"
testLabelsFilename <- "./data/UCI HAR Dataset/test/y_test.txt"
testSubjectsFilename <- "./data/UCI HAR Dataset/test/subject_test.txt"

trainSetFilename <- "./data/UCI HAR Dataset/train/X_train.txt"
trainLabelsFilename <- "./data/UCI HAR Dataset/train/y_train.txt"
trainSubjectsFilename <- "./data/UCI HAR Dataset/train/subject_train.txt"

# Reads the feature names.
featureNames <- read.delim(featureNamesFilename,
                          sep = "", 
                          header = F,
                          col.names = c("NULL", "featureName"),
                          colClasses = c("NULL", "character"))

# Updates each feature name so that each token is separated by a period.
refineFeatureName <- function(x) {
  paste(str_match_all(x, 
                      "[[:digit:]]+|[[:alpha:]]+")[[1]], 
        collapse = ".")
}

# Updates all feature names.
featureNames <- sapply(featureNames[,1], refineFeatureName)

# Reads the activity labels.
activityLabels <- read.delim(activityLabelsFilename,
                           sep = "", 
                           header = F,
                           col.names = c("class", "activity"),
                           colClasses = c("numeric", "character"))

# Returns the activity name.
updateActivityName <- function(x) {
  activityLabels[x,2]
}

# Creates a date frame for each data set that contains the 561 feature columns,
# the activity names and the suject IDs.
loadDataSet <- function(datasetFilename, labelsFilename, subjectsFilename) {
  # Reads the data set using the appropriate column names.
  dataset <- read.delim(datasetFilename, 
                       sep = "", 
                       header = F,
                       col.names = featureNames)
  
  # Reads the activity labels for the above data set.
  labels <- read.delim(labelsFilename, 
                          sep = "", 
                          header = F,
                          col.names = "activity",
						  colClasses = c("numeric"))

  # Retrives the activity names for all records of the data set.
  labels <- sapply(labels, updateActivityName)
  
  # Reads the subject IDs.
  subjects <- read.delim(subjectsFilename,
                         sep = "", 
                         header = F,
                         col.names = c("subject"),
                         colClasses = c("numeric"))

  # Combine all the above data frames in one.
  cbind(dataset, labels, subjects)
}

testDataset <- loadDataSet(
                  testSetFilename, 
                  testLabelsFilename,
                  testSubjectsFilename)

trainDataset <- loadDataSet(
                  trainSetFilename,
                  trainLabelsFilename,
                  trainSubjectsFilename)

# Merges the training and the test sets to create one data set.
dataset <- rbind(trainDataset, testDataset)

# Extracts only the measurements on the mean and standard deviation for
# each measurement.
datasetMeanSTD <- dataset[, grep("std|mean|activity|subject", names(dataset), ignore.case = T)]

# Creates a tidy data set with the average of each variable for each 
# activity and each subject.
tidyMeanValuesByActivitySubject <- datasetMeanSTD %>% 
                                    group_by(subject, activity) %>% 
                                    summarise_each(funs(mean))

select(filter(tidyMeanValuesByActivitySubject, subject %in% c(1,2)), activity:tBodyAcc.mean.Z)
