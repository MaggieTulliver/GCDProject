Getting and Cleaning Data – Course Project

This repository contains the run_analysis.R function that I wrote for the course project for The Getting and Cleaning Data on Coursera.

To run this program, download and save the function, change your working directory to the directory where you have saved the function, load the script by running the command: source(“run_analysis.R”) and then call the function by typing run_analysis()

You need not have the data already downloaded to your working directory.

The function will
a)	Check to see if the data directory already exists, if not, it will download and unzip the data from source
b)	Setwd to the UCI HAR Dataset directory
c)	Merge train and test data sets individually with the subject and activity data for each set, while appropriately labeling the activities
d)	Merge the train and test sets together and extract the columns for mean and standard deviation
e)	Appropriately label variables (colnames)
f)	Summarize the data by computing mean of each variable per subject and per activity
g)	Write the data to averagedata.txt inside the UCI HAR dataset directory. The file has the subject and activity as the first 2 columns and the mean and std variables as the next 66 columns, all separated by single spaces. The data is ordered by subject and then activity (the sort order for activity is not lexical but retains the levels of the original data set)

Data and processing details can be found in the codebook.md file.

NOTE: The function has been tested to work fine on a Windows OS. Not sure if minor changes to directory paths may be needed in other environments.
