# Codebook  
This script will perform the following steps on the data provided as part of this course project
* All data sets are imported

* Test and training data sets are combined using rbind

* Extract out only columns for the mean and standard deviations for each measurement

* Renaming names to more meaningful names

* Combine all the data sets into a single data set before computing the averages for each subject and activity type



# Variables Generated
* x_train, x_test, y_train, y_test, subject_train, subject_test contain the test and training data downloaded from the files

* x_combined, y_combined, subject_combined are the combined test and training data sets

* features are various measurements which is used to create mean_std vector which is used to filter the means and standard deviation columns

* all_combined is the merged data set from x_combined, y_combined and subject_combined sets.

* The final product is tidy_data.txt which contains the averages for each measurement and this was generated using colMeans() from the ddply() function. 
