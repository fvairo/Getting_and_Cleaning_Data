
#Merge the training and the test sets to create a single data set
{
  X <- rbind(x_train, x_test)
  Y <- rbind(y_train, y_test)
  Subject <- rbind(subject_train, subject_test)
  Merged_Data <- cbind(Subject, Y, X)
}

#Extract only the measurements on the mean and standard deviation for each measurement

{
  tidy_data <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))
}

#Use descriptive activity names to name the activities in the data set.

{
  tidy_data$code <- activities[tidy_data$code, 2]
}

#Appropriately labels the data set with descriptive variable names
{
  names(tidy_data)[2] = "activity"
  names(tidy_data)<-gsub("Acc", "Accelerometer", names(tidy_data))
  names(tidy_data)<-gsub("Gyro", "Gyroscope", names(tidy_data))
  names(tidy_data)<-gsub("BodyBody", "Body", names(tidy_data))
  names(tidy_data)<-gsub("Mag", "Magnitude", names(tidy_data))
  names(tidy_data)<-gsub("^t", "Time", names(tidy_data))
  names(tidy_data)<-gsub("^f", "Frequency", names(tidy_data))
  names(tidy_data)<-gsub("tBody", "TimeBody", names(tidy_data))
  names(tidy_data)<-gsub("-mean()", "Mean", names(tidy_data), ignore.case = TRUE)
  names(tidy_data)<-gsub("-std()", "STD", names(tidy_data), ignore.case = TRUE)
  names(tidy_data)<-gsub("-freq()", "Frequency", names(tidy_data), ignore.case = TRUE)
  names(tidy_data)<-gsub("angle", "Angle", names(tidy_data))
  names(tidy_data)<-gsub("gravity", "Gravity", names(tidy_data))
}

#Create a second, independent tidy data set with the average of each variable for each activity and each subject

{
  final_data_set <- tidy_data %>%
    group_by(subject, activity) %>%
    summarise_all(funs(mean))
  write.table(final_data_set, "final_data_set.txt", row.name=FALSE)
}
