
run_analysis <- function() {
        
        ## *********STEP 1 MERGE TEST AND TRAIN DATA IN ONE FILE*********
 
        fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
        
        ##download and unzips files
        if(!dir.exists("./data")) dir.create("./data")
        setwd("./data")
        download.file(fileURL,"Samsung.zip",method="curl")
        unzip("Samsung.zip")
        file.remove("Samsung.zip")

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
        
        
        ## ******* STEP 4 LABEL DATA SET WITH DESCRIPTIVE VARIABLE NAMES
        features<-read.table("features.txt")
        labels<-c("Subject","Activity",as.character(features[,2]))
        colnames(all_data)<-labels
        
        
        ## ******* STEP 2 EXTRACT ONLY MEASUREMENT ON MEAN AND STD FOR EACH MEASUREMENT *******
        pos<-sort(c(1,2,grep("mean\\(",labels), grep("std",labels)))
        all_data<-all_data[,pos]
        
        ## ********* STEP 3 USE DESCRIPTIVE NAMES FOR ACTIVITIES 
        activities<-read.table("activity_labels.txt")
        activities<-activities[,2]
        all_data$Activity<-factor(all_data$Activity, labels=activities)
        
        ## ********* STEP 5 CREATE TIDY DATA WITH AVERAGE OF EACH VARIABLE FOR EACH SUBJECT AND ACTIVITY 
        cols<-colnames(all_data[3:68])
        temp<-data.frame()
        for (w in 1:30) {
                subject_data<-all_data[all_data$Subject==w,]
                data_melt<-melt(subject_data,id=c("Subject","Activity"),measure.vars=cols)
                subjects<-dcast(data_melt,Activity ~ variable, mean)
                Subject<-rep(w,nrow(subjects))
                subjects<-cbind(Subject,subjects)
                subjects<-rbind(temp,subjects)
                temp<-subjects
        }
        summary<-saveRDS(subjects, "my_summary.rds")
        write.table(subjects, row.name=FALSE, file = "summary_file.txt")
}