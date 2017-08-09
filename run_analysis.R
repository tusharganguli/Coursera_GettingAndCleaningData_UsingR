# You should create one R script called run_analysis.R that 
# does the following.
# 
# 1.  Merges the training and the test sets to create one data set.
# 2.  Extracts only the measurements on the mean and standard 
#     deviation for each measurement.
# 3.  Uses descriptive activity names to name the activities in 
#     the data set
# 4.  Appropriately labels the data set with descriptive variable names.
# 5.  From the data set in step 4, creates a second, independent 
#     tidy data set with the average of each variable for each activity 
#     and each subject.


rm(list=ls())
library(dplyr)

# set the path to the project directory
#setwd("F:/online courses/coursera/DataScience-JohnHopkins/3 - Getting and Cleaning Data/project/getdata%2Fprojectfiles%2FUCI HAR Dataset/")             

# read the subject of each individual from subject_(train/test).txt
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject <- rbind(subject_train, subject_test)
rm(subject_test,subject_train)

# read the corresponding activities performed.
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
activity_idx <- rbind(y_train, y_test)
rm(y_test,y_train)

# read the feature variables
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
feature_vector <- rbind(x_train, x_test)
rm(x_train,x_test)


# read features.txt and recover all indexes and column names for mean
feature_names <- read.table("UCI HAR Dataset/features.txt")
mean_idx <- grep("*mean*",feature_names$V2)
mean_colnames <- grep("*mean*",feature_names$V2, value = TRUE)
# improve readability of column names
mean_colnames <- mean_colnames  %>% {gsub("^t","timeBased",.) } %>%
                                { gsub("*Acc*","Accleration",.) } %>%
                                { gsub("mean\\(\\)", "Mean",.) } %>%
                                { gsub("meanFreq\\(\\)", "MeanFrequency",.) } %>%
                                { gsub("^f", "frequencyBased",.) } %>%
                                { gsub("-","",.) } %>%
                                { gsub("BodyBody","Body",.) } %>%
                                { gsub("([XYZ]$)","\\1Axis",.) }

# retrieve the column with means
mean_values <- feature_vector[,mean_idx]
colnames(mean_values) <- mean_colnames
rm(mean_idx,mean_colnames)

# recover all indexes and column names for standard deviation
std_idx <- grep("*std*",feature_names$V2)
std_colnames <- grep("*std*",feature_names$V2, value = TRUE)

# improve readability of column names
std_colnames <- std_colnames %>% { gsub("^t","timeBased",.) } %>%
                              { gsub("*Acc*","Accleration",.) } %>%
                              { gsub("std\\(\\)", "StandardDeviation", .) } %>%
                              { gsub("^f", "frequencyBased", .) } %>%
                              { gsub("-","",.) } %>%
                              { gsub("BodyBody","Body",.) } %>%
                              { gsub("([XYZ]$)","\\1Axis",.) }

# retrieve the column with standard deviation
std_values <- feature_vector[,std_idx]
colnames(std_values) <- std_colnames
rm(std_idx,std_colnames)
rm(feature_names)

# create the single data set with all values
mean_and_std <- cbind(subject,activity_idx,mean_values,std_values)
colnames(mean_and_std)[1] <- "Subject"
colnames(mean_and_std)[2] <- "Activity"
rm(subject,activity_idx,feature_vector, mean_values,std_values)

# create a second, independent tidy data set with the average 
# of each variable for each activity and each subject.
averageData <- mean_and_std %>% group_by(Subject,Activity) %>% summarise_all(mean) 

# update the category names for the Activity column
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
for(i in 1:6) {
  averageData$Activity <- gsub(as.character(i),activity_labels$V2[i],averageData$Activity)
}
rm(activity_labels,i)

# write the tidy data set to a text file
write.table(averageData, file = "averageData.txt",row.names = FALSE)
