GettingCleaningData
===================

Repo for Getting &amp; Cleaning Data course project

## Data Clean-up: Human Activity Recognition Using Smartphones 

run_analysis.R is a data analysis script for human activity recognition data using a Samsung Galaxy S II.  The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The script provided merges these two data sets, provides column names, accurately describes the activities being performed, and extracts only mean and standard deviation variables from the data(Note: Mean frequency data was excluded from this analysis, as it was a separate calculation from the mean data).  Then averages are calculated on these variables based on the volunteer and on the activity.  

This script was creating using R version 0.98.501.

# Setup:
The original datasets necessary for running this script can be found here: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

To run properly, set your working directory to the data set folder, "UCI HAR Dataset". 

Expected output should be a tidy data set, 180 rows and 68 columns.  Description of variables can be found in CodeBook.md.


