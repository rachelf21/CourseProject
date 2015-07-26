
run_analysis <- function() {
        
        ## *********STEP 0 DOWNLOAD AND UNZIP FILES*********
 
        fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
        
        ##download and unzips files
        if(!dir.exists("./data")) dir.create("./data")
        setwd("./data")
        download.file(fileURL,"Samsung.zip",method="curl")
        unzip("Samsung.zip")
        file.remove("Samsung.zip")

        ## *********STEP 1 MERGE TEST AND TRAIN DATA IN ONE FILE*********
        ## retrieve and combine test data
        setwd("UCI HAR Dataset/test")
        subject_test<-read.table("subject_test.txt")
        activity_test<-read.table("y_test.txt")
        details_test<-read.table("X_test.txt")
        test_data<-cbind(subject_test,activity_test,details_test)
        
        ## retrieve and combine train data
        setwd("../train")
        subject_train<-read.table("subject_train.txt")
        activity_train<-read.table("y_train.txt")
        details_train<-read.table("X_train.txt")
        train_data<-cbind(subject_train,activity_train,details_train)
        
        ## merge test and train data
        all_data<-rbind(test_data, train_data)
        setwd("../")
        
             
        ## ******* STEP 2 EXTRACT ONLY DATA FOR MEAN AND STD FOR EACH MEASUREMENT *******
        features<-read.table("features.txt")
        labels<-c("Subject","Activity",as.character(features[,2]))
        colnames(all_data)<-labels
        pos<-sort(c(1,2,grep("mean\\(",labels), grep("std",labels)))
        labels<-labels[pos]    
        all_data<-all_data[,pos]
        
        
        ## ********* STEP 3 USE DESCRIPTIVE NAMES FOR ACTIVITIES 
        activities<-read.table("activity_labels.txt")
        activities<-activities[,2]
        all_data$Activity<-factor(all_data$Activity, labels=activities)
        
        ## ******* STEP 4 LABEL DATASET WITH DESCRIPTIVE VARIABLE NAMES
        newlabels<-gsub("-",".",labels)
        newlabels<-gsub(",","_",newlabels)
        newlabels<-gsub("\\(","",newlabels)
        newlabels<-gsub("\\)","",newlabels)
        colnames(all_data)<-newlabels
        
        ## ********* STEP 5 CREATE TIDY DATA WITH AVERAGE OF EACH VARIABLE FOR EACH SUBJECT AND ACTIVITY 
         library(dplyr)
        
         all_data_grouped<-group_by(all_data,Subject,Activity)
         summary<-summarise_each(all_data_grouped,funs(mean))
         
         write.table(summary, row.name=FALSE, file = "my_summary.txt")
         saveRDS(summary, "my_summary.rds")


}