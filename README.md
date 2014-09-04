tidy-project
============

This repository contains run_analysis.R script.  The script loads a training and test data set from the Human Activity Recognition Using Smartphones Dataset.  


Objective
============
The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. I will be graded by my peers on a series of yes/no questions related to the project. I will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with my script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that I performed to clean up the data called CodeBook.md. I should also include a README.md in the repo with my scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

I should create one R script called run_analysis.R that does the following:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


run_analysis.R
===========

This is how this script works.

* Load the row labels (subject and activity code)
* Load the column labels (features)
* Extract the indices of the mean and standard deviation features by grep'ing for mean() and std()
* Create column type vector where index postion of mean and std are of 'numeric' type
* Map activity codes to activity names
* Load data set with read.table while only loading the mean and std columns
* Bind the Subject, Activity Code and Activity columns to data set.
* Merge training and test data sets
* Use by function to find averages of feature columns grouped by subject and activity (temporarily remove activity name for easy calculation)
* Create output data frame by iterating through list of 'by' objects, converting to data frame and row binding
* Re-label columns with 'avg.' prefix and re-add activity name column    
* Sort data frame by subject and activity code
* Write output to disk


The repo includes the following files:
=========================================

- 'README.md'
- 'CodeBook.md': describes the variables, the data, and any transformations or work that I performed to clean up the data
- 'run_analysis.R': script performing analysis
- 'output.txt': tidy output file


