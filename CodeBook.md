The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, it captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. The set of variables that were estimated from these signals are: mean(): Mean value, std(): Standard deviation, etc. These signals were used to estimate variables of the feature vector for each pattern. Acc denotes acceleration, and Gyro for gyroscope reading. '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
prefix 't' to denote time domain, prefix 'f' to indicate frequency domain signals
"tBodyAcc-XYZ" denotes time domain body acceeleration in the X, Y, and Z directions. Likewise variables such as "tGravityAcc-XYZ", "tBodyAccJerk-XYZ", etc...

In order to make the feature name more descriptive, the R script made the following change ro the feature names:
"tBodyAcc" -> "time-domain-Body-Acceleration", "fBodyAcc" -> "frequency-domain-Body-Acceleration", "tGravityAcc" -> "time-domain-Gravity-Acceleration", "tBodyGyro" -> "time-domain-Body-Gyroscope", "fBodyGyro" -> "frequency-domain-Body-Gyroscope"

The input data are stored in text files that are read using "read.table" of R. Three data frame variables, "X_table" for macchine generated data, "Y_table" for activity ID, and "Subject_table" for subject ID. Train data and test date are combined by row-binding two data. Feature names are read from another text file, and they become column names of the data set. It then selects column names having mean or std. It then creates a tidy data set with the average of each variable for each activity and each subject. The column name of  this tidy data set are changed to be more descriptive. Finally, this data frame is written to a text file called "tidy_data.txt."


The raw data

The raw data came from UCI HAR Dataset repository. They were unzipped into UCI HAR Dataset directory. It contains "activity_labels.txt" for 6 activity lavels s.a. 1 WALKING, 2 WALKING_UPSTAIRS, 3 WALKING_DOWNSTAIRS, 4 SITTING, 5 STANDING, 6 LAYING; "features.txt" for 561 feature labels; test directory and train directory, each containing X_test.txt for 10299 objects of 561 variables of machine reads, y_test.txt for 10299 activity labels, subject_test.txt for 10299 subject ID's indicating who performed that particular activity, as well as a subdirectory containing Inertial Signals.
NO CHANGES WERE MADE TO THIS DATA SO THAT IT REMAINS RAW DATA.

The tidy data

1. The tidy data contains 35 object of 50 variables. The variables are either mean or standard deviation. Each column represents a single variable satisfying the tidy data principle.
2. A raw contains an unique combination of Subject ID and activity, s.a. (subject 7 & walking), (subject 8 & walking), (subject 8 & walking_upstairs) satisfying the tidy data principles of "each different observation of that variable should be in a different row."
3. There is only one final table containing all variables so that no linking of multiple tables are necessary.
