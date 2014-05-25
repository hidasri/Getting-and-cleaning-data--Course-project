## Merging traing and test data

## Read feature and activity leabels
feature_labels<-read.table("UCI HAR Dataset/features.txt")["V2"]
activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt")["V2"]


## Read training data
X_train<-read.table("UCI HAR Dataset/train/X_train.txt")
names(X_train)<-feature_labels$V2

y_train<-read.table("UCI HAR Dataset/train/y_train.txt")
names(y_train)<-"Labels"

sub_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
names(sub_train)<-"SubjectNumbers"

## Read testing data
X_test=read.table("UCI HAR Dataset/test/X_test.txt")
names(X_test)<-feature_labels$V2

y_test=read.table("UCI HAR Dataset/test/y_test.txt")
names(y_test)<-"Labels"

sub_test=read.table("UCI HAR Dataset/test/subject_test.txt")
names(sub_test)<-"SubjectNumbers"

## Find indices that has mean() and std() in the name
indices_of_means_and_stds<-grep("mean\\(\\)|std\\(\\)",feature_labels$V2)
means_and_std_colnames<-colnames(X_test)[indices_of_means_and_stds]
X_test_subset<-cbind(sub_test,y_test,subset(X_test,select=means_and_std_colnames))
X_train_subset<-cbind(sub_train,y_train,subset(X_train,select=means_and_std_colnames))

## Merge data
merged_data<-rbind(X_test_subset, X_train_subset)

## Making anindependent tidy data set with the average of each variable for each activity and each subject
tidy<-aggregate(merged_data[,3:ncol(merged_data)],list(Subject=merged_data$SubjectNumbers, Activity=merged_data$Labels), mean)
tidy<-tidy[order(tidy$SubjectNumbers),]

## Use descriptive activity names to name the activities in the data set
tidy$Activity<-activity_labels[tidy$Activity,]

write.table(tidy, file="./tidydata.txt", sep="\t", row.names=FALSE)



