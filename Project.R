library(plyr);

#Reading the data sets
x_test  <- read.table("./Data/test/X_test.txt")
x_train <- read.table("./Data/train/X_train.txt")
y_test <- read.table("./Data/test/y_test.txt")
y_train <- read.table("./Data/train/y_train.txt")
subject_test  <- read.table("./Data/test/subject_test.txt")
subject_train <- read.table("./Data/train/subject_train.txt")

#Combining the data sets
subject_combined <- rbind(subject_test, subject_train)
x_combined<- rbind(x_test, x_train)
y_combined<- rbind(y_test, y_train)


#Extracting means and standard deviations for each variable
features <- read.table("./Data/features.txt")

#identify columns with only means and std in the names
mean_std <- grep("-(mean|std)\\(\\)", features[, 2])
#filter those columns out
x_combined<- x_combined[, mean_std]
#set correct column names
names(x_combined) <- features[mean_std, 2]

#Setting descriptive names for activities and variables 
activityLabels <- read.table("./Data/activity_labels.txt")
y_combined[,1] <- activityLabels[y_combined[,1],2]
names(y_combined) <-"activity"
names(subject_combined) <-"subject"

#combining the entire data set
all_combined <- cbind(x_combined, y_combined, subject_combined)

#Create a tidy data set of the averages
tidy_data <- ddply(all_combined, .(subject, activity), function(x) colMeans(x[, 1:66]))
## last two columns are activity and subject should not have averages hence only till 66

##Export the tidy data set in txt format
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)


