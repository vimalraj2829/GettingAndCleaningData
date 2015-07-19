setwd("~/Coursera/DataCleaning/UCI HAR Dataset")


# Merge the training and test sets to create one data set
##Load actual train data
train<- read.table("train/X_train.txt", header=FALSE, colClasses=rep("numeric",561))
##Load Activity labels
TrainLable<- read.table("train/y_train.txt", header = FALSE,colClasses="character")
##Load subject numbers
TrainSubject<-read.table("train/subject_train.txt", header=FALSE, colClasses="numeric")
##combine all train data
TrainwSubject<-cbind(train,TrainSubject)
TrainwSL<-cbind(TrainwSubject,TrainLable)

##Load actual test data
test<-read.table("test/X_test.txt", header=FALSE, colClasses=rep("numeric",561))
##Load Activity labels
TestLabel <- read.table("test/y_test.txt", header = FALSE,colClasses="character")
##Load subject numbers
TestSubject<-read.table("test/subject_test.txt", header=FALSE, colClasses="numeric")
##combine all train data
TestwSubject<-cbind(test,TestSubject)
TestwSL<-cbind(TestwSubject,TestLabel)
Full<- rbind(TrainwSL,TestwSL)

##Making feature names more readable
ColNames<-read.table("C:/Users/Vimal/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt", header=FALSE, colClasses="character")
ColNames$V2 = gsub('-mean', 'Mean', ColNames$V2)
ColNames$V2 = gsub('-std', 'Std', ColNames$V2)
ColNames$V2 = gsub('[-()]', '', ColNames$V2)


##Filter the column names with names containing mean and std
ColNames <- ColNames[grep(".*Mean.*|.*Std.*",ColNames$V2),]
##Get index of rows we will be using 
required <- c(grep(".*Mean.*|.*Std.*",ColNames$V2),562,563)

#Extract required data from the full data set
NeededData <- Full[,required]

#Add extracted column names 
names(NeededData) <- c(ColNames$V2,"SubjectName","ActivityNames")

##Covert Activity and Subject columns to factor type 
NeededData$ActivityNames <- as.factor(NeededData$ActivityNames)
NeededData$SubjectName <- as.factor(NeededData$SubjectName)

# Step 3
# Use descriptive activity names to name the activities in the data set
##Replace activity numbers with actual names 
library("stringr")
NeededData$ActivityNames<-str_replace(NeededData$ActivityNames,"1","Walking") 
NeededData$ActivityNames<-str_replace(NeededData$ActivityNames,"2","Walking_Upstairs") 
NeededData$ActivityNames<-str_replace(NeededData$ActivityNames,"3","Walking_Downstairs")
NeededData$ActivityNames<-str_replace(NeededData$ActivityNames,"4","Sitting") 
NeededData$ActivityNames<-str_replace(NeededData$ActivityNames,"5","Standing")
NeededData$ActivityNames<-str_replace(NeededData$ActivityNames,"6","Laying")

#Create an aggregate tidy file to sum up the averages
cleanData <- aggregate(NeededData, by = list(NeededData$ActivityNames,NeededData$SubjectName),mean)
cleanData <- cleanData[,1:88]
write.table(cleanData, "tidy.txt",sep="\t",row.name=FALSE)

