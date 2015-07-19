###Dataset:
	*The Human Activity Recognition Using Smartphones Data Set was obtained from the UCI Machine Learning Repository
	*Link: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
###Variables
	* The downloaded folder consisted of test and train data split into x_train, y_train, x_test, y_test, subject_train and subject_test
	* TrainwSL and TestwSL consist of data obtained from merging the above mentioned test and train files
	* Full consists of test and train data combined together which will be used for further analysis 
	* NeededData consists of all variables consisting of mean and standard deviation data 
	* These variables are the mean or standard deviation of each subject and activity. This is indicated by the presence of mean or std in their names. 
	* ActivityNames (Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying) SubjectName (the integer subject ID) variables in the NeededData data frame represent the respective activity and subject names 
	* cleanData consists of the calculated means of each variable for each activity and each subject using the aggregate function
	* write the results into a text file called tidy.txt using the writ.table function
