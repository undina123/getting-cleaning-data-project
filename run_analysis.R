#######################################################################
# Step 0: Reading data
training_set<-read.table("train/X_train.txt")
training_labels<-read.table("train/y_train.txt")
test_set<-read.table("test/X_test.txt")
test_labels<-read.table("test/y_test.txt")
features<-read.table("features.txt",stringsAsFactors=FALSE)
training_subject<-read.table("train/subject_train.txt")
test_subject<-read.table("test/subject_test.txt")
activity_labels<-read.table("activity_labels.txt")

#######################################################################
# Step 1: Merges the training and the test sets to create one data set.
# First add to train and test data subject number and activity number
#1. cbind X_train.txt (7352x561) with subject_train (7352x1)
#   and with ytrain  to get a df with 7352x563
#2. cbind X_test.txt (2947x561) with subject_test (2947x1 )
#   and with ytest to get a df with 2947x563
#3. row bind results of 1 and 2 above to get a df with 10299x563

training<-cbind(training_set,training_subject,training_labels)
test<-cbind(test_set,test_subject,test_labels)
allresults<-rbind(training, test)

#######################################################################
#Step 2: Extracts only the measurements on the mean and 
# 	   standard deviation for each measurement
#        plus  subject nr and labels
# use grep  to get indices of features with "mean(" - to exclude "meanFreq"
# and "std"
meanindex<-grep("mean\\(", features[,2])
stdindex<-grep("std", features[,2])
mean_std_data<-allresults[ ,c(stdindex,meanindex,562,563)]


#######################################################################
#Step 3: Uses descriptive activity names to name the activities in the data set
# if needed
# install.packages("qdap") 
# using Excel vlookup analogue (function lookup) to correspond new variable 
# activityname to activity label with the help of file activity_labels.txt

library(qdap)
mean_std_data$activityname<-lookup(mean_std_data[,68],activity_labels)

#######################################################################
#Step 4: Appropriately labels the data set with descriptive variable names
#Names of variables should be all lower case when possible
#replacing prefix 't' to denote time
#replacing prefix 'f' frequency-domain-signals- 
#replacing acc with accelerometer
#replacing gyro with gyroscope
features[ ,2]<-tolower(features[ ,2])
features[ ,2]<-gsub("^t", "time-", features[ ,2])
features[ ,2]<-gsub("^f", "frequency-domain-signals-", features[ ,2])
features[ ,2]<-gsub("acc", "-accelerometer-", features[ ,2])
features[ ,2]<-gsub("gyro", "-gyroscope-", features[ ,2])
features[ ,2]<-gsub("--", "-", features[ ,2])
names(mean_std_data)<-c(features[c(stdindex,meanindex),2],"subject","activitylabel","activityname")

#######################################################################
#Step 5: From the data set in step 4, creates a second, independent tidy data 
# set with the average of each variable for each activity and each subject.
# group names are changed to "activityname","subject"
# 3 last columns excluded since contain "activityname","subject" in beginning and  "activitylabel" which is not needed

aggdata <-aggregate(mean_std_data, by=list(mean_std_data$activityname,mean_std_data$subject),  FUN=mean, na.rm=TRUE)
names(aggdata)[1:2]<-c("activityname","subject")
tidydata<-aggdata[, 1:68]

#######################################################################
#Step 6: Create  txt file created with write.table() using row.name=FALSE 
write.table(tidydata,file ="tidydata.txt",row.name=FALSE)


