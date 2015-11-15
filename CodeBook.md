The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, it captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. The set of variables that were estimated from these signals are: mean(): Mean value, std(): Standard deviation, etc. These signals were used to estimate variables of the feature vector for each pattern. Acc denotes acceleration, and Gyro for gyroscope reading. '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
prefix 't' to denote time domain, prefix 'f' to indicate frequency domain signals
"tBodyAcc-XYZ" denotes time domain body acceeleration in the X, Y, and Z directions. Likewise variables such as "tGravityAcc-XYZ", "tBodyAccJerk-XYZ", etc...



In order to make the feature name more descriptive, the R script made the following change ro the feature names:
"tBodyAcc" -> "time-domain-Body-Acceleration", "fBodyAcc" -> "frequency-domain-Body-Acceleration", "tGravityAcc" -> "time-domain-Gravity-Acceleration", "tBodyGyro" -> "time-domain-Body-Gyroscope", "fBodyGyro" -> "frequency-domain-Body-Gyroscope"
