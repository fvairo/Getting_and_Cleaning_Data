Files and Variables

x_train, y_train, subject_train: train data set from downloaded files
x_test, y_test, subject_test: test data set from the downloaded files.
x_data, y_data and subject_data: data sets merged for analysis.
features: data with appropriately labels

run_analysis.R script

- Merges the training and the test sets to create a unified data set.
- Extracts the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 

Labels

Acc - Accelerometer
Gyro - Gyroscope
BodyBody - Body
Mag - Magnitude
*f - Frequency
*t - Time

- Creates an independent tidy data set with the average of each variable for each activity and each subject.

final_data_set.txt: summary of tidy_data_set with the means of each variable after grouped