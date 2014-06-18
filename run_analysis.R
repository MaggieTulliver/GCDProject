run_analysis <- function() {
  
  ## checks to see if the directory for the data already exists, 
  ## If not, then download and unzip file from source and setwd 
  ## Using http instead of https and mode = "wb" 
  ## to eliminate download issues in Win
  
  datadir <- "UCI HAR Dataset"
  if (!file.exists(datadir)){
  download.file("http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip",
              destfile = "HARdata.zip", mode = "wb")
  unzip("HARdata.zip")
  file.remove("HARdata.zip")
  }
  setwd(datadir)
  
  ## Read feature nams and activity labels from features.txt and 
  ## activity_labels.txt file
  
  fileread <- read.table("features.txt", sep = "", colClasses = "character")
  featurenames <- fileread$V2
  
  fileread <- read.table("activity_labels.txt", sep = "", colClasses= "character")
  activitylabels <- fileread$V2
  
  rm(fileread)
  
  ## read X_train, subject_train and X_test files, 
  ## name X_train with featurenames from above,
  ## read subject_Train as factors
  ## cbind data from X_train, subject_train and X_test files
  
  Xtrain <- read.table("train/X_train.txt", sep = "")
  names(Xtrain) <- featurenames
  
  subjecttrain <- read.table("train/subject_train.txt", sep = "", colClasses = "character")
  names(subjecttrain) <- "subject"
  
  Ytrain <- read.table("train/y_train.txt", sep = "")
  names(Ytrain) <- "activity"
  Ytrain$activity <- as.factor(Ytrain$activity)
  levels(Ytrain$activity) <- activitylabels
  
  traindata <- cbind(subjecttrain, Ytrain, Xtrain)
  
  
  ## Do same as above for test data
  
  Xtest <- read.table("test/X_test.txt", sep = "")
  names(Xtest) <- featurenames
  
  subjecttest <- read.table("test/subject_test.txt", sep = "", colClasses = "character")
  names(subjecttest) <- "subject"
    
  Ytest <- read.table("test/y_test.txt", sep = "")
  names(Ytest) <- "activity"
  Ytest$activity <- as.factor(Ytest$activity)
  levels(Ytest$activity) <- activitylabels
  
  testdata <- cbind(subjecttest, Ytest, Xtest)
  
  ##rbind train and test data
  ##remove stuff not needed
  alldata <- rbind(traindata, testdata)
  rm(traindata, testdata, Ytrain, Ytest, Xtrain, Xtest, subjecttrain, subjecttest)
  
  ## only keep columns that have mean or standard deviation (and subject, activity)
  ## remove parentheses from all names and make them lowercase 
  
  cols_to_keep <- grep("-mean\\(\\)|-std\\(\\)", names(alldata))
  cols_to_keep <- c(1, 2, cols_to_keep)
  alldata <- alldata[ ,cols_to_keep]
  names(alldata) <- tolower(names(alldata))
  names(alldata) <- gsub("\\(\\)", "", names(alldata))
  names(alldata) <- gsub("BodyBody)", "Body", names(alldata))
  
  ## calculate average of mean and standard deviation values per subject
  ## and activity and write to text file
  
  averagedata <- aggregate(alldata[ ,3:68], by=list(alldata$subject, alldata$activity), FUN=mean, na.rm=TRUE)
  names(averagedata)[1] <- "subject"
  names(averagedata)[2] <- "activity"
  averagedata[ ,1] <- as.numeric(averagedata [ ,1])
  
  averagedata <- averagedata[order(averagedata$subject, averagedata$activity), ]
  
  write.table(averagedata, "averagedata.txt", sep = " ", row.names=FALSE, quote=FALSE)
}                                                                           
