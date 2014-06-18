Data Source:
------------
------------

The dataset for this project was downloaded from  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

The data represents collected from the accelerometers from the Samsung Galaxy S smartphone. A full description of the data is available at  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Processing:
-----------
-----------

The run_analysis function does the following processing to clean up and summarize the data  

1)	Download and unzip the dataset if it does not already exist  
2)	Set the working directory to the UCI HAR Dataset directory  
3)	Read the variable names from the feature file to use as column names in the merged and final dataset and the activity labels from the activity_labels file to use instead of numbers for the activities  
4)	For each of the train and test sets - Read the subject, activity and X data and merges them together using cbind, using the activity labels (e.g., walking, standing etc instead of the numerical levels)  
5)	Merge the train and test data sets using rbind  
6) Using grep, keep only the columns that have a mean or std (for standard deviation) at the end of the column name, and the subject and activity columns  
7)	Remove all parentheses from column names and change them all to lowercase. Also change variable names from *BodyBody* to *Body*  
8)	Calculate the average of each variable per subject per activity using the aggregate function (the subject and activity columns need to be renamed to subject and activity as the names are changed by the aggregate function)  
9) 	Write the dataframe for the averages to a space-separated text file using the write.table function and removing all the row indices. The text file is named averagedata.txt and is placed in the working directory (UCI HAR Dataset)  


Variables
---------
---------

These are the variables in the final tidy data set as they relate to the variables in the original datasource. For description of the variables in the original data, refer to the README.txt and features_info.txt files in the UCI HAR Dataset directory.  

subject – Integers 1- 30 representing the 30 participants in the test and train sets – obtained from the subject_test and subject_train files.

activity – The activities that the subjects participated in during measurements, obtained from the Y_train and Y_test files, and converted to the labels as described in the activity_labels  
1.  WALKING  
2.  WALKING_UPSTAIRS  
3.  WALKING_DOWNSTAIRS  
4.  SITTING  
5.  STANDING  
6.  LAYING  

Columns 3 – 68 - average per subject per activity of the corresponding value in the original data. The values in the original data were normalized and values range from -1 to 1  

* tbodyacc-mean-x –  from tBodyAcc-mean()-X in the original data  
* tbodyacc-mean-y - from tBodyAcc-mean()-Y in the original data  
* tbodyacc-mean-z - from tBodyAcc-mean()-Z in the original data  
* tbodyacc-std-x - from tBodyAcc-std()-X in the original data  
* tbodyacc-std-y - from tBodyAcc-std()-Y in the original data  
* tbodyacc-std-z - from tBodyAcc-std()-Z in the original data  
* tgravityacc-mean-x – from tGravityAcc-mean()-X in the original data  
* tgravityacc-mean-y – from tGravityAcc-mean()-Y in the original data  
* tgravityacc-mean-z – from tGravityAcc-mean()-Z in the original data  
* tgravityacc-std-x – from tGravityAcc-std()-X in the original data  
* tgravityacc-std-y – from tGravityAcc-std()-Y in the original data  
* tgravityacc-std-z – from tGravityAcc-std()-Z in the original data  
* tbodyaccjerk-mean-x – from tBodyAccJerk-mean()-X in the original data  
* tbodyaccjerk-mean-y – from tBodyAccJerk-mean()-Y in the original data  
* tbodyaccjerk-mean-z – from tBodyAccJerk-mean()-Z in the original data  
* tbodyaccjerk-std-x – from tBodyAccJerk-std()-X in the original data  
* tbodyaccjerk-std-y – from tBodyAccJerk-std()-Y in the original data  
* tbodyaccjerk-std-z – from tBodyAccJerk-std()-Z in the original data  
* tbodgyro-mean-x – from tBodyGyro-mean()-X in the original data  
* tbodygyro-mean-y – from tBodyGyro-mean()-Y in the original data  
* tbodygyro-mean-z – from tBodyGyro-mean()-Z in the original data  
* tbodgyro-std-x – from tBodyGyro-std()-X in the original data  
* tbodygyro-std-y – from tBodyGyro-std()-Y in the original data  
* tbodygyro-std-z – from tBodyGyro-std()-Z in the original data  
* tbodgyrojerk-mean-x – from tBodyGyroJerk-mean()-X in the original data  
* tbodygyrojerk-mean-y – from tBodyGyroJerk-mean()-Y in the original data  
* tbodygyrojerk-mean-z – from tBodyGyroJerk-mean()-Z in the original data  
* tbodgyrojerk-std-x – from tBodyGyroJerk-std()-X in the original data  
* tbodygyrojerk-std-y – from tBodyGyroJerk-std()-Y in the original data  
* tbodygyrojerk-std-z – from tBodyGyroJerk-std()-Z in the original data  
* tbodyaccmag-mean – from tBodyAccMag-mean() in the original data  
* tbodyaccmag-std – from tBodyAccMag-std() in the original data
* tgravityaccmag-mean – from tGravityAccMag-mean() in the original data    
* tgravityaccmag-std – from tGravityAccMag-std() in the original data  
* tbodyaccjerkmag-mean – from tBodyAccJerkMag-mean() in the original data  
* tbodyaccjerkmag-std – from tBodyAccJerkMag-std() in the original data  
* tbodygyromag-mean – from tBodyGyroMag-mean() in the original data  
* tbodygyromag-std – from tBodyGyroMag-std() in the original data  
* tbodygyrojerkmag-mean – from tBodyGyroJerkMag-mean() in the original data  
* tbodygyrojerkmag-std – from tBodyGyroJerkMag-std() in the original data  
* fbodyacc-mean-x –  from fBodyAcc-mean()-X in the original data  
* fbodyacc-mean-y - from fBodyAcc-mean()-Y in the original data  
* fbodyacc-mean-z - from fBodyAcc-mean()-Z in the original data  
* fbodyacc-std-x - from fBodyAcc-std()-X in the original data  
* fbodyacc-std-y - from fBodyAcc-std()-Y in the original data  
* fbodyacc-std-z - from fBodyAcc-std()-Z in the original data  
* fbodyaccjerk-mean-x – from fBodyAccJerk-mean()-X in the original data  
* fbodyaccjerk-mean-y – from fBodyAccJerk-mean()-Y in the original data  
* fbodyaccjerk-mean-z – from fBodyAccJerk-mean()-Z in the original data  
* fbodyaccjerk-std-x – from fBodyAccJerk-std()-X in the original data  
* fbodyaccjerk-std-y – from fBodyAccJerk-std()-Y in the original data
* fbodyaccjerk-std-z – from fBodyAccJerk-std()-Z in the original data    
* fbodgyro-mean-x – from fBodyGyro-mean()-X in the original data  
* fbodygyro-mean-y – from fBodyGyro-mean()-Y in the original data  
* fbodygyro-mean-z – from fBodyGyro-mean()-Z in the original data  
* fbodgyro-std-x – from fBodyGyro-std()-X in the original data  
* fbodygyro-std-y – from fBodyGyro-std()-Y in the original data  
* fbodygyro-std-z – from fBodyGyro-std()-Z in the original data  
* fbodyaccmag-mean – from fBodyAccMag-mean() in the original data  
* fbodyaccmag-std – from fBodyAccMag-std() in the original data  
* fbodyaccjerkmag-mean – from fBodyBodyAccJerkMag-mean() in the original data  
* fbodyaccjerkmag-std – from fBodyBodyAccJerkMag-std() in the original data  
* fbodygyromag-mean – from fBodyBodyGyroMag-mean() in the original data  
* fbodygyromag-std – from fBodyBodyGyroMag-std() in the original data  
* fbodygyrojerkmag-mean – from fBodyBodyGyroJerkMag-mean() in the original data  
* fbodygyrojerkmag-std – from fBodyBodyGyroJerkMag-std() in the original data  
