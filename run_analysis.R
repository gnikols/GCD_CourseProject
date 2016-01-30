# Grant Nikols 20160130

# You should create one R script called run_analysis.R that does the 
#    following.
# 1 Merges the training and the test sets to create one data set.
# 2 Extracts only the measurements on the mean and standard deviation
#    for each measurement.
# 3 Uses descriptive activity names to name the activities in the 
#    data set
# 4 Appropriately labels the data set with descriptive variable names.
# 5 From the data set in step 4, creates a second, independent 
#    tidy data set with the average of each variable for each 
#    activity and each subject.

setwd("C:/Users/Rnikols/datascience/3 Getting and Cleaning Data")

subject_train <- read.table('./UCI HAR Dataset/train/subject_train.txt',header=FALSE)
x_train <- read.table('./UCI HAR Dataset/train/x_train.txt',header=FALSE)
y_train <- read.table('./UCI HAR Dataset/train/y_train.txt',header=FALSE)
subject_test <- read.table('./UCI HAR Dataset/test/subject_test.txt',header=FALSE)
x_test <- read.table('./UCI HAR Dataset/test/x_test.txt',header=FALSE)
y_test <- read.table('./UCI HAR Dataset/test/y_test.txt',header=FALSE)
features <- read.table('./UCI HAR Dataset/features.txt',header=FALSE)
activity_labels <- read.table('./UCI HAR Dataset/activity_labels.txt',header=FALSE)

# 1 Merges the training and the test sets to create one data set.

x_merge <- rbind(x_train,x_test)
y_merge <- rbind(y_train,y_test)
subject_merge <- rbind(subject_train,subject_test)

# 2 Extracts only the measurements on the mean and standard deviation
#    for each measurement.

features_extract <- grep("-(mean|std)\\(\\)",features[,2])
x_extract <- x_merge[,features_extract]

# 3 Uses descriptive activity names to name the activities in the 
#    data set

y_merge[,1] <- activity_labels[y_merge[,1],2]

# 4 Appropriately labels the data set with descriptive variable names.

colnames(x_extract) <- features[features_extract,2]
colnames(y_merge) <- "activity_label"
colnames(subject_merge) <- "subject"

# 5 From the data set in step 4, creates a second, independent 
#    tidy data set with the average of each variable for each 
#    activity and each subject.

data_bind <- cbind(x_extract,y_merge,subject_merge)

data_final <- ddply(data_bind, .(subject,activity_label),  function(x) colMeans(x[,1:66]))

write.table(data_final, "data_final.txt", row.name=FALSE)