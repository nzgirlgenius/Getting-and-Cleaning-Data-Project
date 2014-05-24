## This program 
##  . creates a merged tidy data set
##  . extracts and analyses the average of each variable for each activity 
##    and each subject

## Download the file from the web
## Do this only once

## download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
##              , destfile = "HARData.zip")

## Extract zip file to suggested folder name


## Load the datasets
## X_train, y_train, subject_train
## X_test, y_test, subject_test
## Common: features, activity_labels
library(plyr)
library(reshape2)

trainingdata<-read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE, stringsAsFactors = FALSE,sep="", colClasses = "numeric")
testdata<-read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE, stringsAsFactors = FALSE, sep="", colClasses = "numeric")
activitytrain<-read.table("UCI HAR Dataset/train/Y_train.txt", header = FALSE, stringsAsFactors = FALSE, sep="", colClasses = "integer")
activitytest<-read.table("UCI HAR Dataset/test/Y_test.txt", header = FALSE, stringsAsFactors = FALSE, sep="", colClasses = "integer")
subjecttrain<-read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE, stringsAsFactors = FALSE, sep="", colClasses = "integer")
subjecttest<-read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE, stringsAsFactors = FALSE, sep="", colClasses = "integer")
activitylabels<-read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE
                           , stringsAsFactors = FALSE, sep=""
                           , colClasses = c("integer", "character"))
features<-read.table("UCI HAR Dataset/features.txt",header = FALSE
                     , stringsAsFactors = FALSE, sep = "", colClasses = c("integer","character"))

##Merge the training/test datasets for subject/activity with desciptive column nmes
subject<-rbind(subjecttrain,subjecttest)
activity<-rbind(activitytrain,activitytest)
colnames(activity)<-"activitycode"
colnames(activitylabels)<-c("activitycode","activitydescription")                           
activitymerged<-join(activity,activitylabels, match = "first")
colnames(subject)<-"subjectid"

##Cleanup features column names and reduce the set to mean/std measures
V3<-(gsub("-|\\(|\\)|,","",sub("^f"," freqdomain" 
                               ,sub("^t"," timedomain" 
                                    ,sub("acc","accelerometer" 
                                         ,sub("gyro","gyroscope"
                                              ,sub("mag","magnitude" 
                                                   ,sub("bodybody","body" 
                                                 ,tolower(features$V2)))))))))
features<-cbind(features,V3)
featurecolnames<-features[grepl("(mean|std)[^angle]",features[,3]),]

##Combine the training and test datasets for mean/std features. Apply new column names.
combineddataset<-rbind(trainingdata[,featurecolnames$V1],testdata[,featurecolnames$V1])
colnames(combineddataset)<-featurecolnames$V3
combineddataset<-cbind(subject,activitymerged,combineddataset)

## Melt data into a summariseable form
melteddataset<-melt(combineddataset,id=c("subjectid", "activitydescription"),measure = featurecolnames[,3])
## Aggregate the melteddataset as average for all 'variables'. 
## round to same significant figures as original data
averageddataset<-dcast(melteddataset,subjectid + activitydescription~variable,mean)
averageddataset[,3:ncol(averageddataset)]<-signif(averageddataset[,3:ncol(averageddataset)],8)

## Export to txt file
write.table(x=averageddataset,file = "averageddataset.txt",row.names=FALSE)