# run_analysis.R
# Getting and Cleaning Data: Course project Nov, 2014
# Data source:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# Dataset documentation available at:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
# You should create one R script called run_analysis.R that does the following.
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation
#    for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data 
#    set with the average of each variable for each activity and each 
#    subject.
# DATA EXTRACTION (mixed with limited transformation to improve readibility)
  # download file from the web
    projecturl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(projecturl,destfile="./getdata_projectfiles_UCI HAR Dataset.zip")
  # unzip it in the working folder (legacy named folders used for readability)
    unzip("getdata_projectfiles_UCI HAR Dataset.zip") #unzips folders in working or getwd()
  # read unzipped files into a data frame
  # 2. extracting only the measurments on the mean and standard deviation
    test.data <-  read.table("./UCI HAR Dataset/test/X_test.txt")[,c(1, 2, 3, 4, 5, 6, 81, 82, 83, 84, 85, 86, 121, 122, 123, 124, 125, 126, 161, 162, 163, 164, 165, 166, 201, 202, 214, 215, 227, 228, 240, 241, 253, 254, 266, 267, 268, 269, 270, 271, 294, 295, 296, 345, 346, 347, 348, 349, 350, 373, 374, 375, 424, 425, 426, 427, 428, 429, 452, 453, 454, 503, 504, 513, 516, 517, 526, 529, 530, 539, 542, 543, 552, 555, 556, 557, 558, 559, 560, 561)]
    train.data <-  read.table("./UCI HAR Dataset/train/X_train.txt")[,c(1, 2, 3, 4, 5, 6, 81, 82, 83, 84, 85, 86, 121, 122, 123, 124, 125, 126, 161, 162, 163, 164, 165, 166, 201, 202, 214, 215, 227, 228, 240, 241, 253, 254, 266, 267, 268, 269, 270, 271, 294, 295, 296, 345, 346, 347, 348, 349, 350, 373, 374, 375, 424, 425, 426, 427, 428, 429, 452, 453, 454, 503, 504, 513, 516, 517, 526, 529, 530, 539, 542, 543, 552, 555, 556, 557, 558, 559, 560, 561)]
    test.subject.ids <- read.table("./UCI HAR Dataset/test/subject_test.txt")
    names(test.subject.ids)<-sub("V1","SubjectID",names(test.subject.ids)) #rename vague generalized names to something meaningful
    test.activity.id <- read.table("./UCI HAR Dataset/test/y_test.txt")
    train.activity.id <- read.table("./UCI HAR Dataset/train/y_train.txt")
    train.subject.ids <- read.table("./UCI HAR Dataset/train/subject_train.txt")
    # rename V1 to and id variable
      names(train.subject.ids)<-sub("V1","SubjectID",names(train.subject.ids))#rename vague generalized names to something meaningful
# DATA TRANSFORMATION 
  # 3 variable labels created with some excel magic but their derivation is 
      #    in the codebook, because it takes far too many lines here, making it
      #     unreadable.
      # put column labels into vector and use colnames function to add column labels
  # 4. appropriately labels the dataset with descriptive names
    labels.1 <- c("BodyAcc-mean-X",  "BodyAcc-mean-Y",  "BodyAcc-mean-Z",  "BodyAcc-std-X",  "BodyAcc-std-Y",  "BodyAcc-std-Z",  "BodyAccJerk-mean-X",  "BodyAccJerk-mean-Y",  "BodyAccJerk-mean-Z",  "BodyAccJerk-std-X",  "BodyAccJerk-std-Y",  "BodyAccJerk-std-Z",  "BodyGyro-mean-X",  "BodyGyro-mean-Y",  "BodyGyro-mean-Z",  "BodyGyro-std-X",  "BodyGyro-std-Y",  "BodyGyro-std-Z",  "BodyGyroJerk-mean-X",  "BodyGyroJerk-mean-Y",  "BodyGyroJerk-mean-Z",  "BodyGyroJerk-std-X",  "BodyGyroJerk-std-Y",  "BodyGyroJerk-std-Z",  "BodyAccMag-mean",  "BodyAccMag-std",  "GravityAccMag-mean",  "GravityAccMag-std",  "BodyAccJerkMag-mean",  "BodyAccJerkMag-std",  "BodyGyroMag-mean",  "BodyGyroMag-std",  "BodyGyroJerkMag-mean",  "BodyGyroJerkMag-std",  "BodyAcc-mean-X",  "BodyAcc-mean-Y",  "BodyAcc-mean-Z",  "BodyAcc-std-X",  "BodyAcc-std-Y",  "BodyAcc-std-Z",  "BodyAcc-meanFreq-X",  "BodyAcc-meanFreq-Y",  "BodyAcc-meanFreq-Z",  "BodyAccJerk-mean-X",  "BodyAccJerk-mean-Y",  "BodyAccJerk-mean-Z",  "BodyAccJerk-std-X",  "BodyAccJerk-std-Y",  "BodyAccJerk-std-Z",  "BodyAccJerk-meanFreq-X",  "BodyAccJerk-meanFreq-Y",  "BodyAccJerk-meanFreq-Z",  "BodyGyro-mean-X",  "BodyGyro-mean-Y",  "BodyGyro-mean-Z",  "BodyGyro-std-X",  "BodyGyro-std-Y",  "BodyGyro-std-Z",  "BodyGyro-meanFreq-X",  "BodyGyro-meanFreq-Y",  "BodyGyro-meanFreq-Z",  "BodyAccMag-mean",  "BodyAccMag-std",  "BodyAccMag-meanFreq",  "BodyBodyAccJerkMag-mean",  "BodyBodyAccJerkMag-std",  "BodyBodyAccJerkMag-meanFreq",  "BodyBodyGyroMag-mean",  "BodyBodyGyroMag-std",  "BodyBodyGyroMag-meanFreq",  "BodyBodyGyroJerkMag-mean",  "BodyBodyGyroJerkMag-std",  "BodyBodyGyroJerkMag-meanFreq",  "angle.BodyAccMean,gravity.",  "angle.BodyAccJerkMean.,gravityMean.",  "angle.BodyGyroMean,gravityMean.",  "angle.BodyGyroJerkMean,gravityMean.",  "angle.X,gravityMean.",  "angle.Y,gravityMean.",  "angle.Z,gravityMean.")
    colnames(test.data) <- labels.1
    colnames(train.data) <- labels.1
  # 1 merge the two datasets, all the stuff leads up to this
    # append subject IDS and activity IDS
      test.ids <- cbind(test.subject.ids, test.activity.id)
      train.ids <- cbind(train.subject.ids, train.activity.id)
    # replace generic column names with something meaningful
      names(test.ids)<-sub("V1","ActivityID",names(test.ids))
      names(train.ids)<-sub("V1","ActivityID",names(train.ids))
      names(test.df)<-sub("V1","SubjectID",names(test.df))
    # join or cbind ids to data
      test.df <- cbind(test.ids, test.data)
      train.df <- cbind(train.ids, train.data)
      activity.df <- rbind(test.df, train.df)
  # 5 creation of a tidy dataset with means per subject and activity
    # calculate the means by activity and subject:
      by(activity.df[,3:80], activity.df$SubjectID, colMeans)
      aggdata <-aggregate(activity.df, by=list(activity.df$SubjectID,activity.df$ActivityID),FUN=mean)
      look.2 <- as.data.frame(aggdata)
    # get rid of duplicative columns the agg function inserted: Group.1
    #     and identifers in the wrong column position(Subject s/b after Activity)
      look.2$Group.1 <- NULL
      look.2$ActivityID <- NULL
    # rename remaining columns in correct columnal location to something
    #        more meaningful
      names(look.2) <-sub("Group.2", "Activity", names(look.2))
      names(look.2) <-sub("SubjectID", "Subject", names(look.2))
    # write dataset meeting requirements 1.-5. into working or getwd() folder
    write.table(look.2, file="tidy.txt", sep=",") # write to a text file, is csv
# DATA LOADING
  # load the file back into R from working folder getwd()
    tidy.df <- as.data.frame(read.table("./tidy.txt")) 
#=====================================================================
# Note, I was debating whether or not to rename the Activities
# by name, e.g., walking, sitting, laying, instead of my number 1-5. I could
# go either way. I'm used to looking at spreadsheets so the 
# actual name is convenient, but not for large datasets one scrolls over.
# But I'm far more of a data analyst
# that traditionally represents values with a number, rather than a character,
# particularly one that is of uneven length and not always menomic.
# (SPSS allows you to toggle displaying numeric values with their character descriptions.)
# My habit is to represent quantitative data as a number, rather
# than a character. It saves the trouble of trying to represent
# a one as 1, rather than a lower case l. Some folks can see the
# font hinting at the bottom of the character readily,
# but my eyes can't, unless its size 13 point or above. (I'm near ancient
# from an 80 column punched card input era of computing, wearing
# hexidecimal glasses :)
#=====================================================================
