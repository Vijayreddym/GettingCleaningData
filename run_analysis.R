
#
# This is part /Getting and Cleaning Data Course Project
#
# This function collect, work with, and clean a data set and produces a tidy dat set 
# which can be used for further anlysis.
# 
# 1.Merges the training and the test sets to create one data set.
# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3.Uses descriptive activity names to name the activities in the data set
# 4.Appropriately labels the data set with descriptive variable names. 
# 5.From the data set in step 4, creates a second, independent tidy data set 
#   with the average of each variable for each activity and each subject.


directory <- "C:/DataScience/CourseraProjects/UCI HAR Dataset"

run_analysis <- function()
{
        
        # ****** 1.Merges the training and the test sets to create one data set.
        fl <- list.files(directory, pattern="*.txt", full.names= T, recursive= TRUE) 
        fl
        
        Features <- read.table(file.path(directory, "features.txt"), header = FALSE)
        head(Features)
        
        ##ActivityData
        ActivityDataTest <- read.table(file.path(directory, "test", "Y_test.txt"), header = FALSE)
        #str(ActivityDataTest)
        ActivityDataTrain <- read.table(file.path(directory, "train", "Y_train.txt"), header = FALSE)
        #str(ActivityDataTrain)
        ActivityData = rbind(ActivityDataTest, ActivityDataTrain)
        
        
        ##Subject
        SubjectDataTrain <- read.table(file.path(directory, "train", "subject_train.txt"),header = FALSE)
        #str(SubjectDataTrain)
        SubjectDataTest  <- read.table(file.path(directory, "test" , "subject_test.txt"),header = FALSE)
        #str(SubjectDataTest)
        SubjectData = rbind(SubjectDataTest, SubjectDataTrain)
        
        ##Features
        FeaturesDataTest  <- read.table(file.path(directory, "test" , "X_test.txt" ),header = FALSE)
        #str(FeaturesDataTest)
        FeaturesDataTrain <- read.table(file.path(directory, "train", "X_train.txt"),header = FALSE)
        #str(FeaturesDataTrain)
        FeaturesData = rbind(FeaturesDataTest, FeaturesDataTrain)
        
        names(ActivityData) <- c("activity")
        #tail(ActivityData)
        names(SubjectData) <- c("subject")
        #tail(SubjectData)
        #head(Features)
        names(FeaturesData) <- Features$V2
        
        ActivtySubjust = cbind(SubjectData, ActivityData)
        MergedData = cbind(FeaturesData, ActivtySubjust)
        
        # ****** 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
        #Features$V2
        MeanStdFeatures<- Features$V2[grep("mean\\(\\)|std\\(\\)", Features$V2)]
        MeanStdFeatures
        ActivtiyNames <- c(as.character(MeanStdFeatures), "subject" , "activity")
        #ActivtiyNames
        AnalysisData <- subset(MergedData, select = ActivtiyNames)
        head(AnalysisData)
        
        # ****** 3.Uses descriptive activity names to name the activities in the data set
        labels <- read.table(file.path(directory, "activity_labels.txt"), header = FALSE)
        AnalysisData$activity<- factor(AnalysisData$activity, levels = c(1, 2, 3, 4, 5, 6), 
                                       labels=c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING","LAYING"))
        head(AnalysisData$activity,30);
        
        # ****** 4.Appropriately labels the data set with descriptive variable names. 
        names(AnalysisData)<-gsub("^t", "time", names(AnalysisData))
        names(AnalysisData)<-gsub("^f", "frequency", names(AnalysisData))
        names(AnalysisData)<-gsub("Acc", "Accelerometer", names(AnalysisData))
        names(AnalysisData)<-gsub("Gyro", "Gyroscope", names(AnalysisData))
        names(AnalysisData)<-gsub("Mag", "Magnitude", names(AnalysisData))
        names(AnalysisData)<-gsub("BodyBody", "Body", names(AnalysisData))
        names(AnalysisData)
        
        # ****** 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
        library(plyr);
        AnalysisData2<-aggregate(. ~subject + activity, AnalysisData, mean)
        AnalysisData2<-AnalysisData2[order(AnalysisData2$subject,AnalysisData2$activity),]
        head(AnalysisData2)
        write.table(AnalysisData2, file.path(directory, "tidydata.txt"),row.name=FALSE)
}

