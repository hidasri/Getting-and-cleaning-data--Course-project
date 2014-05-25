
### Course Project: run_analysis.R

This script assumes the Samsung data is extracted in your working directory (so there is a folder called UCI HAR Dataset/). 

Here are a list of steps performed in run_analysis.R

* Read feature lables and activity labels
* Read the training and testing data,labels and subject numbers
* Find names of the features that has the string 'mean()' or 'std()' in it.
* Filter the data set based on the names of the features found in the previous step and merge the data.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.



