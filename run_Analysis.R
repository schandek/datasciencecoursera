## Step1: Merges the training and the test sets to create one data se

test_subj <- read.table("./UCI HAR Dataset/test/subject_test.txt",stringsAsFactors=FALSE)
test_activity <- read.table("./UCI HAR Dataset/test/y_test.txt",stringsAsFactors=FALSE) 

train_subj <- read.table("./UCI HAR Dataset/train/subject_train.txt",stringsAsFactors=FALSE)
train_activity <- read.table("./UCI HAR Dataset/train/y_train.txt",stringsAsFactors=FALSE)

tot_subj <- rbind(test_subj, train_subj)
tot_activity <- rbind(test_activity, train_activity)

merge_t <- cbind(tot_subj, tot_activity)

##tot_subj<- merge(test_subj,train_subj, all=TRUE)

x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", stringsAsFactors=FALSE)

x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", stringsAsFactors=FALSE)

merge_x <- rbind(x_test, x_train)

merge_datasets <- cbind(merged,merge_x)

## Step2: Extracts only the measurements on the mean and standard deviation for
## each measurement.

extract <- c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,240,241,253,
             254,266:271,345:350,424:429,503,504,516,517,529,530,542,543)

trim_dataset <- merge_datasets[,c(1,2,extract+2)]


## Step 3: Uses descriptive activity names to name the activities in the data set


## Step 4: Appropriately labels the data set with descriptive variable names. 
feature_list <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors=FALSE)
names <- feature_list[,2]
colnames(trim_dataset) <- c("subject_id", "activity_name", names[extract])


##  Step5: From the data set in step 4, create a second, independent tidy data set with 
## the average of each variable for each activity and each subject.

x <- trim_dataset[order(trim_dataset$subject_id,trim_dataset$activity_name),]
write.table(x,"tidydata.txt")
new_x <- split(x, list(x$subject_id, x$activity_name))
#trim_dataset <- trim_dataset[order(trim_dataset$subject_id, trim_dataset$activity_name),]


