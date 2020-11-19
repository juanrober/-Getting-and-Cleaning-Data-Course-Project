# Getting Clean Data Project Code book (libro de códigos)

## 1. Merge the data.

+ Get the values from the second column of the features.txt file, and assign it to a vector.
+ Load the following data frames:
++ X_train.txt
++ y_train.txt
++ subject_train.txt
++ X_test.txt
++ y_test.txt
++ subject_test.txt
+ Merge the data frames with the data from the subject_train.txt, y_train.txt and X_train.txt files.
+ Merge the data frames with the data form the subject_test.txt, y_test.txt and X_test.txt files.
+ Merge the two data frames merged before.

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.

+ Finds the only the columns that contain variables that are the mean and standard deviation of measurements and subsequently subsets the combined data to only these variables.

## 3. Uses descriptive activity names to name the activities in the data set and labels the data set with descriptive variable names.

+ Fromm the activity_labels.txt files get the proper labels.
+ Add the labels to the activities data frame.

## 4. Appropriately labels the data set with descriptive variable names.

+ Label the the data set with this criteria:

leading t or f is based on time or frequency measurements.
Body = related to body movement.
Gravity = acceleration of gravity
Acc = accelerometer measurement
Gyro = gyroscopic measurements
Jerk = sudden movement acceleration
Mag = magnitude of movement
mean and SD are calculated for each subject for each activity for each mean and SD measurements. The units given are g’s for the accelerometer and rad/sec for the gyro and g/sec and rad/sec/sec for the corresponding jerks.

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

+ Write the final data base in tidy format as a txt file.

