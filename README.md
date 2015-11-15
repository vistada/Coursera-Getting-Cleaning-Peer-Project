# Peer Assessments of Getting and Cleaning Data

### The following will show an execution of the code run_analysis.R describing how the code works.

read dataset and row bind datasets of train and test for measurements, activity Id, and subject Id


```r
X_table <- rbind(read.table('train/X_train.txt'), read.table('test/X_test.txt'))
Y_table <- rbind(read.table('train/y_train.txt', col.names='Activity.Id'),
                read.table('test/y_test.txt', col.names='Activity.Id'))
Subject_table <- rbind(read.table('train/subject_train.txt', col.names='Subject.Id'),
                   read.table('test/subject_test.txt', col.names='Subject.Id'))
```
summary of Y_table displays

```r
head(Y_table)
```

```
##   Activity.Id
## 1           5
## 2           5
## 3           5
## 4           5
## 5           5
## 6           5
```

extract or read feature names, and make them variable names, i.e., column names


```r
Features <- read.table('features.txt', col.names=c('Feature.Id', 'Feature.Name'))
names(X_table) <- Features$Feature.Name
```

five column names of X_table

```r
head(names(X_table))
```

```
## [1] "tBodyAcc-mean()-X" "tBodyAcc-mean()-Y" "tBodyAcc-mean()-Z"
## [4] "tBodyAcc-std()-X"  "tBodyAcc-std()-Y"  "tBodyAcc-std()-Z"
```

select column names having "mean" or "std", and create a corresponding data frame


```r
Column_index <- grep("-(mean|std)\\(\\)-", Features$Feature.Name)
Mean_StandardDeviation_Table <- X_table[, Column_index]
```

It shows only column names having "mean"" or "std" are selected

```r
str(Mean_StandardDeviation_Table)
```

```
## 'data.frame':	10299 obs. of  48 variables:
##  $ tBodyAcc-mean()-X     : num  0.289 0.278 0.28 0.279 0.277 ...
##  $ tBodyAcc-mean()-Y     : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...
##  $ tBodyAcc-mean()-Z     : num  -0.133 -0.124 -0.113 -0.123 -0.115 ...
##  $ tBodyAcc-std()-X      : num  -0.995 -0.998 -0.995 -0.996 -0.998 ...
##  $ tBodyAcc-std()-Y      : num  -0.983 -0.975 -0.967 -0.983 -0.981 ...
##  $ tBodyAcc-std()-Z      : num  -0.914 -0.96 -0.979 -0.991 -0.99 ...
##  $ tGravityAcc-mean()-X  : num  0.963 0.967 0.967 0.968 0.968 ...
##  $ tGravityAcc-mean()-Y  : num  -0.141 -0.142 -0.142 -0.144 -0.149 ...
##  $ tGravityAcc-mean()-Z  : num  0.1154 0.1094 0.1019 0.0999 0.0945 ...
##  $ tGravityAcc-std()-X   : num  -0.985 -0.997 -1 -0.997 -0.998 ...
##  $ tGravityAcc-std()-Y   : num  -0.982 -0.989 -0.993 -0.981 -0.988 ...
##  $ tGravityAcc-std()-Z   : num  -0.878 -0.932 -0.993 -0.978 -0.979 ...
##  $ tBodyAccJerk-mean()-X : num  0.078 0.074 0.0736 0.0773 0.0734 ...
##  $ tBodyAccJerk-mean()-Y : num  0.005 0.00577 0.0031 0.02006 0.01912 ...
##  $ tBodyAccJerk-mean()-Z : num  -0.06783 0.02938 -0.00905 -0.00986 0.01678 ...
##  $ tBodyAccJerk-std()-X  : num  -0.994 -0.996 -0.991 -0.993 -0.996 ...
##  $ tBodyAccJerk-std()-Y  : num  -0.988 -0.981 -0.981 -0.988 -0.988 ...
##  $ tBodyAccJerk-std()-Z  : num  -0.994 -0.992 -0.99 -0.993 -0.992 ...
##  $ tBodyGyro-mean()-X    : num  -0.0061 -0.0161 -0.0317 -0.0434 -0.034 ...
##  $ tBodyGyro-mean()-Y    : num  -0.0314 -0.0839 -0.1023 -0.0914 -0.0747 ...
##  $ tBodyGyro-mean()-Z    : num  0.1077 0.1006 0.0961 0.0855 0.0774 ...
##  $ tBodyGyro-std()-X     : num  -0.985 -0.983 -0.976 -0.991 -0.985 ...
##  $ tBodyGyro-std()-Y     : num  -0.977 -0.989 -0.994 -0.992 -0.992 ...
##  $ tBodyGyro-std()-Z     : num  -0.992 -0.989 -0.986 -0.988 -0.987 ...
##  $ tBodyGyroJerk-mean()-X: num  -0.0992 -0.1105 -0.1085 -0.0912 -0.0908 ...
##  $ tBodyGyroJerk-mean()-Y: num  -0.0555 -0.0448 -0.0424 -0.0363 -0.0376 ...
##  $ tBodyGyroJerk-mean()-Z: num  -0.062 -0.0592 -0.0558 -0.0605 -0.0583 ...
##  $ tBodyGyroJerk-std()-X : num  -0.992 -0.99 -0.988 -0.991 -0.991 ...
##  $ tBodyGyroJerk-std()-Y : num  -0.993 -0.997 -0.996 -0.997 -0.996 ...
##  $ tBodyGyroJerk-std()-Z : num  -0.992 -0.994 -0.992 -0.993 -0.995 ...
##  $ fBodyAcc-mean()-X     : num  -0.995 -0.997 -0.994 -0.995 -0.997 ...
##  $ fBodyAcc-mean()-Y     : num  -0.983 -0.977 -0.973 -0.984 -0.982 ...
##  $ fBodyAcc-mean()-Z     : num  -0.939 -0.974 -0.983 -0.991 -0.988 ...
##  $ fBodyAcc-std()-X      : num  -0.995 -0.999 -0.996 -0.996 -0.999 ...
##  $ fBodyAcc-std()-Y      : num  -0.983 -0.975 -0.966 -0.983 -0.98 ...
##  $ fBodyAcc-std()-Z      : num  -0.906 -0.955 -0.977 -0.99 -0.992 ...
##  $ fBodyAccJerk-mean()-X : num  -0.992 -0.995 -0.991 -0.994 -0.996 ...
##  $ fBodyAccJerk-mean()-Y : num  -0.987 -0.981 -0.982 -0.989 -0.989 ...
##  $ fBodyAccJerk-mean()-Z : num  -0.99 -0.99 -0.988 -0.991 -0.991 ...
##  $ fBodyAccJerk-std()-X  : num  -0.996 -0.997 -0.991 -0.991 -0.997 ...
##  $ fBodyAccJerk-std()-Y  : num  -0.991 -0.982 -0.981 -0.987 -0.989 ...
##  $ fBodyAccJerk-std()-Z  : num  -0.997 -0.993 -0.99 -0.994 -0.993 ...
##  $ fBodyGyro-mean()-X    : num  -0.987 -0.977 -0.975 -0.987 -0.982 ...
##  $ fBodyGyro-mean()-Y    : num  -0.982 -0.993 -0.994 -0.994 -0.993 ...
##  $ fBodyGyro-mean()-Z    : num  -0.99 -0.99 -0.987 -0.987 -0.989 ...
##  $ fBodyGyro-std()-X     : num  -0.985 -0.985 -0.977 -0.993 -0.986 ...
##  $ fBodyGyro-std()-Y     : num  -0.974 -0.987 -0.993 -0.992 -0.992 ...
##  $ fBodyGyro-std()-Z     : num  -0.994 -0.99 -0.987 -0.989 -0.988 ...
```

give corresponding ID activity name to each activity


```r
Activities <- read.table('activity_labels.txt', col.names=c('Activity.Id', 'Activity'))
Y_table <- merge(Y_table, Activities)
Y_table$Activity.Id <- NULL
```

top 5 entries of Y_table

```r
head(Y_table)
```

```
##   Activity
## 1  WALKING
## 2  WALKING
## 3  WALKING
## 4  WALKING
## 5  WALKING
## 6  WALKING
```

column bind subject ID and activity columns to the data set


```r
tidy_data <- cbind(Subject_table, Y_table, Mean_StandardDeviation_Table)
```

It shows str(tidy_data)

```r
str(tidy_data)
```

```
## 'data.frame':	10299 obs. of  50 variables:
##  $ Subject.Id            : int  1 1 1 1 1 1 1 1 1 1 ...
##  $ Activity              : Factor w/ 6 levels "LAYING","SITTING",..: 4 4 4 4 4 4 4 4 4 4 ...
##  $ tBodyAcc-mean()-X     : num  0.289 0.278 0.28 0.279 0.277 ...
##  $ tBodyAcc-mean()-Y     : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...
##  $ tBodyAcc-mean()-Z     : num  -0.133 -0.124 -0.113 -0.123 -0.115 ...
##  $ tBodyAcc-std()-X      : num  -0.995 -0.998 -0.995 -0.996 -0.998 ...
##  $ tBodyAcc-std()-Y      : num  -0.983 -0.975 -0.967 -0.983 -0.981 ...
##  $ tBodyAcc-std()-Z      : num  -0.914 -0.96 -0.979 -0.991 -0.99 ...
##  $ tGravityAcc-mean()-X  : num  0.963 0.967 0.967 0.968 0.968 ...
##  $ tGravityAcc-mean()-Y  : num  -0.141 -0.142 -0.142 -0.144 -0.149 ...
##  $ tGravityAcc-mean()-Z  : num  0.1154 0.1094 0.1019 0.0999 0.0945 ...
##  $ tGravityAcc-std()-X   : num  -0.985 -0.997 -1 -0.997 -0.998 ...
##  $ tGravityAcc-std()-Y   : num  -0.982 -0.989 -0.993 -0.981 -0.988 ...
##  $ tGravityAcc-std()-Z   : num  -0.878 -0.932 -0.993 -0.978 -0.979 ...
##  $ tBodyAccJerk-mean()-X : num  0.078 0.074 0.0736 0.0773 0.0734 ...
##  $ tBodyAccJerk-mean()-Y : num  0.005 0.00577 0.0031 0.02006 0.01912 ...
##  $ tBodyAccJerk-mean()-Z : num  -0.06783 0.02938 -0.00905 -0.00986 0.01678 ...
##  $ tBodyAccJerk-std()-X  : num  -0.994 -0.996 -0.991 -0.993 -0.996 ...
##  $ tBodyAccJerk-std()-Y  : num  -0.988 -0.981 -0.981 -0.988 -0.988 ...
##  $ tBodyAccJerk-std()-Z  : num  -0.994 -0.992 -0.99 -0.993 -0.992 ...
##  $ tBodyGyro-mean()-X    : num  -0.0061 -0.0161 -0.0317 -0.0434 -0.034 ...
##  $ tBodyGyro-mean()-Y    : num  -0.0314 -0.0839 -0.1023 -0.0914 -0.0747 ...
##  $ tBodyGyro-mean()-Z    : num  0.1077 0.1006 0.0961 0.0855 0.0774 ...
##  $ tBodyGyro-std()-X     : num  -0.985 -0.983 -0.976 -0.991 -0.985 ...
##  $ tBodyGyro-std()-Y     : num  -0.977 -0.989 -0.994 -0.992 -0.992 ...
##  $ tBodyGyro-std()-Z     : num  -0.992 -0.989 -0.986 -0.988 -0.987 ...
##  $ tBodyGyroJerk-mean()-X: num  -0.0992 -0.1105 -0.1085 -0.0912 -0.0908 ...
##  $ tBodyGyroJerk-mean()-Y: num  -0.0555 -0.0448 -0.0424 -0.0363 -0.0376 ...
##  $ tBodyGyroJerk-mean()-Z: num  -0.062 -0.0592 -0.0558 -0.0605 -0.0583 ...
##  $ tBodyGyroJerk-std()-X : num  -0.992 -0.99 -0.988 -0.991 -0.991 ...
##  $ tBodyGyroJerk-std()-Y : num  -0.993 -0.997 -0.996 -0.997 -0.996 ...
##  $ tBodyGyroJerk-std()-Z : num  -0.992 -0.994 -0.992 -0.993 -0.995 ...
##  $ fBodyAcc-mean()-X     : num  -0.995 -0.997 -0.994 -0.995 -0.997 ...
##  $ fBodyAcc-mean()-Y     : num  -0.983 -0.977 -0.973 -0.984 -0.982 ...
##  $ fBodyAcc-mean()-Z     : num  -0.939 -0.974 -0.983 -0.991 -0.988 ...
##  $ fBodyAcc-std()-X      : num  -0.995 -0.999 -0.996 -0.996 -0.999 ...
##  $ fBodyAcc-std()-Y      : num  -0.983 -0.975 -0.966 -0.983 -0.98 ...
##  $ fBodyAcc-std()-Z      : num  -0.906 -0.955 -0.977 -0.99 -0.992 ...
##  $ fBodyAccJerk-mean()-X : num  -0.992 -0.995 -0.991 -0.994 -0.996 ...
##  $ fBodyAccJerk-mean()-Y : num  -0.987 -0.981 -0.982 -0.989 -0.989 ...
##  $ fBodyAccJerk-mean()-Z : num  -0.99 -0.99 -0.988 -0.991 -0.991 ...
##  $ fBodyAccJerk-std()-X  : num  -0.996 -0.997 -0.991 -0.991 -0.997 ...
##  $ fBodyAccJerk-std()-Y  : num  -0.991 -0.982 -0.981 -0.987 -0.989 ...
##  $ fBodyAccJerk-std()-Z  : num  -0.997 -0.993 -0.99 -0.994 -0.993 ...
##  $ fBodyGyro-mean()-X    : num  -0.987 -0.977 -0.975 -0.987 -0.982 ...
##  $ fBodyGyro-mean()-Y    : num  -0.982 -0.993 -0.994 -0.994 -0.993 ...
##  $ fBodyGyro-mean()-Z    : num  -0.99 -0.99 -0.987 -0.987 -0.989 ...
##  $ fBodyGyro-std()-X     : num  -0.985 -0.985 -0.977 -0.993 -0.986 ...
##  $ fBodyGyro-std()-Y     : num  -0.974 -0.987 -0.993 -0.992 -0.992 ...
##  $ fBodyGyro-std()-Z     : num  -0.994 -0.99 -0.987 -0.989 -0.988 ...
```

melt and dcast to find mean of an activity of a subject


```r
library(reshape2)

Activity_melt <- melt(tidy_data, id.vars=c('Subject.Id', 'Activity'))
tidy_data_Average <- dcast(Activity_melt, Subject.Id + Activity ~ variable, mean)
```

It shows column names of tidy_data_Average

```r
names(tidy_data_Average)
```

```
##  [1] "Subject.Id"             "Activity"              
##  [3] "tBodyAcc-mean()-X"      "tBodyAcc-mean()-Y"     
##  [5] "tBodyAcc-mean()-Z"      "tBodyAcc-std()-X"      
##  [7] "tBodyAcc-std()-Y"       "tBodyAcc-std()-Z"      
##  [9] "tGravityAcc-mean()-X"   "tGravityAcc-mean()-Y"  
## [11] "tGravityAcc-mean()-Z"   "tGravityAcc-std()-X"   
## [13] "tGravityAcc-std()-Y"    "tGravityAcc-std()-Z"   
## [15] "tBodyAccJerk-mean()-X"  "tBodyAccJerk-mean()-Y" 
## [17] "tBodyAccJerk-mean()-Z"  "tBodyAccJerk-std()-X"  
## [19] "tBodyAccJerk-std()-Y"   "tBodyAccJerk-std()-Z"  
## [21] "tBodyGyro-mean()-X"     "tBodyGyro-mean()-Y"    
## [23] "tBodyGyro-mean()-Z"     "tBodyGyro-std()-X"     
## [25] "tBodyGyro-std()-Y"      "tBodyGyro-std()-Z"     
## [27] "tBodyGyroJerk-mean()-X" "tBodyGyroJerk-mean()-Y"
## [29] "tBodyGyroJerk-mean()-Z" "tBodyGyroJerk-std()-X" 
## [31] "tBodyGyroJerk-std()-Y"  "tBodyGyroJerk-std()-Z" 
## [33] "fBodyAcc-mean()-X"      "fBodyAcc-mean()-Y"     
## [35] "fBodyAcc-mean()-Z"      "fBodyAcc-std()-X"      
## [37] "fBodyAcc-std()-Y"       "fBodyAcc-std()-Z"      
## [39] "fBodyAccJerk-mean()-X"  "fBodyAccJerk-mean()-Y" 
## [41] "fBodyAccJerk-mean()-Z"  "fBodyAccJerk-std()-X"  
## [43] "fBodyAccJerk-std()-Y"   "fBodyAccJerk-std()-Z"  
## [45] "fBodyGyro-mean()-X"     "fBodyGyro-mean()-Y"    
## [47] "fBodyGyro-mean()-Z"     "fBodyGyro-std()-X"     
## [49] "fBodyGyro-std()-Y"      "fBodyGyro-std()-Z"
```

Change the column names to more descriptive names


```r
Descriptive_title <- names(tidy_data_Average)
Descriptive_title <- gsub("tBodyAcc", "time-domain-Body-Acceleration", Descriptive_title)
Descriptive_title <- gsub("fBodyAcc", "frequency-domain-Body-Acceleration", Descriptive_title)
Descriptive_title <- gsub("tGravityAcc", "time-domain-Gravity-Acceleration", Descriptive_title)
Descriptive_title <- gsub("tBodyGyro", "time-domain-Body-Gyroscope", Descriptive_title)
Descriptive_title <- gsub("fBodyGyro", "frequency-domain-Body-Gyroscope", Descriptive_title)
names(tidy_data_Average) <- Descriptive_title
```

It shows changed column names of tidy_data_Average

```r
names(tidy_data_Average)
```

```
##  [1] "Subject.Id"                                     
##  [2] "Activity"                                       
##  [3] "time-domain-Body-Acceleration-mean()-X"         
##  [4] "time-domain-Body-Acceleration-mean()-Y"         
##  [5] "time-domain-Body-Acceleration-mean()-Z"         
##  [6] "time-domain-Body-Acceleration-std()-X"          
##  [7] "time-domain-Body-Acceleration-std()-Y"          
##  [8] "time-domain-Body-Acceleration-std()-Z"          
##  [9] "time-domain-Gravity-Acceleration-mean()-X"      
## [10] "time-domain-Gravity-Acceleration-mean()-Y"      
## [11] "time-domain-Gravity-Acceleration-mean()-Z"      
## [12] "time-domain-Gravity-Acceleration-std()-X"       
## [13] "time-domain-Gravity-Acceleration-std()-Y"       
## [14] "time-domain-Gravity-Acceleration-std()-Z"       
## [15] "time-domain-Body-AccelerationJerk-mean()-X"     
## [16] "time-domain-Body-AccelerationJerk-mean()-Y"     
## [17] "time-domain-Body-AccelerationJerk-mean()-Z"     
## [18] "time-domain-Body-AccelerationJerk-std()-X"      
## [19] "time-domain-Body-AccelerationJerk-std()-Y"      
## [20] "time-domain-Body-AccelerationJerk-std()-Z"      
## [21] "time-domain-Body-Gyroscope-mean()-X"            
## [22] "time-domain-Body-Gyroscope-mean()-Y"            
## [23] "time-domain-Body-Gyroscope-mean()-Z"            
## [24] "time-domain-Body-Gyroscope-std()-X"             
## [25] "time-domain-Body-Gyroscope-std()-Y"             
## [26] "time-domain-Body-Gyroscope-std()-Z"             
## [27] "time-domain-Body-GyroscopeJerk-mean()-X"        
## [28] "time-domain-Body-GyroscopeJerk-mean()-Y"        
## [29] "time-domain-Body-GyroscopeJerk-mean()-Z"        
## [30] "time-domain-Body-GyroscopeJerk-std()-X"         
## [31] "time-domain-Body-GyroscopeJerk-std()-Y"         
## [32] "time-domain-Body-GyroscopeJerk-std()-Z"         
## [33] "frequency-domain-Body-Acceleration-mean()-X"    
## [34] "frequency-domain-Body-Acceleration-mean()-Y"    
## [35] "frequency-domain-Body-Acceleration-mean()-Z"    
## [36] "frequency-domain-Body-Acceleration-std()-X"     
## [37] "frequency-domain-Body-Acceleration-std()-Y"     
## [38] "frequency-domain-Body-Acceleration-std()-Z"     
## [39] "frequency-domain-Body-AccelerationJerk-mean()-X"
## [40] "frequency-domain-Body-AccelerationJerk-mean()-Y"
## [41] "frequency-domain-Body-AccelerationJerk-mean()-Z"
## [42] "frequency-domain-Body-AccelerationJerk-std()-X" 
## [43] "frequency-domain-Body-AccelerationJerk-std()-Y" 
## [44] "frequency-domain-Body-AccelerationJerk-std()-Z" 
## [45] "frequency-domain-Body-Gyroscope-mean()-X"       
## [46] "frequency-domain-Body-Gyroscope-mean()-Y"       
## [47] "frequency-domain-Body-Gyroscope-mean()-Z"       
## [48] "frequency-domain-Body-Gyroscope-std()-X"        
## [49] "frequency-domain-Body-Gyroscope-std()-Y"        
## [50] "frequency-domain-Body-Gyroscope-std()-Z"
```

write it to tidy_data file

```r
write.table(tidy_data_Average, file='tidy_data.txt', row.names=F)
```
