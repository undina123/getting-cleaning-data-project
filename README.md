#Getting and Cleaning Data Course Project

##What you find in this repository

    - **CodeBook.md:** information about raw and tidy data set, made transformations and tidy data set variables 
    - **TREADME.md:** this file
    - **Trun_analysis.R:** R script to transform raw data set in a tidy one

##Describing R script

1. **Step 0:** all needed files are read into R
2. **Step 1:** First add to train and test data subject number and activity number using cbind
3. Then combine train and test into one data set using rbind
4. **Step 2:**  We extract only the measurements on the mean and standard deviation for each measurement
plus  subject nr and labels using grep
5. **Step 3:** Using package qdap we add activity name by activity number 
6. **Step 4:** We put names of variables in the file 'features.txt' to lower case using the command tolower
7. We replace prefix 't' to denote time, prefix 'f' to denote frequency-domain-signals, 'acc' to denote accelerometer and 'gyro' with gyroscope 
8. We label the merged data set with using changed file 'features.txt'
9. **Step 5:** From the data set in step 4, we creates a second, independent tidy data set with the average of each variable for each activity and each subject. For that we use teh function aggregate
10. Group names are changed to "activityname","subject"
11. 3 last columns excluded since contain "activityname","subject" in beginning and  "activitylabel" which is not needed


