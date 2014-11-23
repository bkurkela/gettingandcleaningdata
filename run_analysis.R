#Getting and Cleaning Data Course Project
#load all necessary data files
x_test <- read.table(file="test/X_test.txt")
y_test <- read.table(file="test/y_test.txt", col.names="Activity")
subject_test <- read.table(file="test/subject_test.txt", col.names="Subject")
x_train <- read.table(file="train/X_train.txt")
y_train <- read.table(file="train/y_train.txt", col.names="Activity")
subject_train <- read.table(file="train/subject_train.txt", col.names="Subject")

#load two reference files - used as descriptive indexes
activity_labels <- read.table(file="activity_labels.txt", col.names=c("Activity", "Activity_Label"))
features <- read.table(file="features.txt")

#add labels to the exercise type
y_test <- merge(y_test, activity_labels, all.x=TRUE, sort = FALSE)
y_train <- merge(y_train, activity_labels, all.x=TRUE, sort = FALSE)
#add column names to the measurements data sets
colnames(x_test) <- features$V2
colnames(x_train) <- features$V2

#select columns that are means and standard deviations of each measurement
x_test <- x_test[,c(grep("std",features$V2), grep("mean", features$V2))]
x_train <- x_train[,c(grep("std",features$V2), grep("mean", features$V2))]

#column bind the three data sets for the test and train data sets separately, 
#then row bind the two together
full_data <- rbind(cbind(subject_test, y_test, x_test), cbind(subject_train, y_train, x_train))

#create a summary table by summarising data set using dplyr package
library(dplyr)
by_activity_label <- full_data %>% group_by(Activity_Label, Subject, Activity)
final_output<- by_activity_label %>% summarise_each(funs(mean))

#write output data set to a txt file
write.table(final_output, file = "final_output.txt", row.name=FALSE)
