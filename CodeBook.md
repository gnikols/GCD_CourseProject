<h2>Project Description</h2>

This project had five steps:

* Merge the training and test data to create one dataset.  This was completed using the rbind function.
* Extract only the data describing the mean and standard deviation for each measurement.  This was accomplished by using the grep function and searching for mean and std columns.
* Use descriptive activity names for each individual activity.  This was done using the activity_labels dataset.
* Appropriately label the variables in the dataset.  This was completed using the colnames function.
* Create second, independent dataset with the average of each variable for each activity and subject.  This was accomplished using the ddply function from the plyr package.

<h2>Variables</h2>

* `subject_train`, `x_train`, `y_train`, `subject_test`, `x_test`, `y_test`, `features`, and `activity_labels` are tables containing the base data sets downloaded from the internet.
* `x_merge`, `y_merge`, and `subject_merge` are datasets that are created by merging the x, y, and subject train and test datasets respectively.
* `features_extract` and `x_extract` are subsets of the `features` and `x_merge` datasets that only describe means and standard deviations.
* `data_bind` is a table that has bound the `x_extract`, `y_merge`, and `subject_merge` data sets together.
* `data_final` is the final dataset created after applying the ddply function to the `data_bind` dataset.