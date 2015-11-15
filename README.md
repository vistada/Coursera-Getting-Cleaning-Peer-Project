---
title: "run_analysis"
output: html_document
---

read dataset and row bind datasets of train and test for measurements, activity Id, and subject Id
```{r}
X_table <- rbind(read.table('train/X_train.txt'), read.table('test/X_test.txt'))
Y_table <- rbind(read.table('train/y_train.txt', col.names='Activity.Id'),
                read.table('test/y_test.txt', col.names='Activity.Id'))
Subject_table <- rbind(read.table('train/subject_train.txt', col.names='Subject.Id'),
                   read.table('test/subject_test.txt', col.names='Subject.Id'))
```

read feature name, and give it to variable name of the data, i.e., column names

```{r}
Features <- read.table('features.txt', col.names=c('Feature.Id', 'Feature.Name'))
names(X_table) <- Features$Feature.Name
```

select column names having mean or std, and create a corresponding data frame

```{r}
Column_index <- grep("-(mean|std)\\(\\)-", Features$Feature.Name)
Mean_StandardDeviation_Table <- X_table[, Column_index]
```

give corresponding ID activity name to each activity

```{r}
Activities <- read.table('activity_labels.txt', col.names=c('Activity.Id', 'Activity'))
Y_table <- merge(Y_table, Activities)
Y_table$Activity.Id <- NULL
```

attach subject ID and activity columns to the data set
```{r}
tidy_data <- cbind(Subject_table, Y_table, Mean_StandardDeviation_Table)
```

melt and dcast to find mean of activity
```{r}
library(reshape2)

Activity_melt <- melt(tidy_data, id.vars=c('Subject.Id', 'Activity'))
tidy_data_Average <- dcast(Activity_melt, Subject.Id + Activity ~ variable, mean)
```

Change the column names to more descriptive names
```{r}
Descriptive_title <- names(tidy_data_Average)
Descriptive_title <- gsub("tBodyAcc", "time-domain-Body-Acceleration", Descriptive_title)
Descriptive_title <- gsub("fBodyAcc", "frequency-domain-Body-Acceleration", Descriptive_title)
Descriptive_title <- gsub("tGravityAcc", "time-domain-Gravity-Acceleration", Descriptive_title)
Descriptive_title <- gsub("tBodyGyro", "time-domain-Body-Gyroscope", Descriptive_title)
Descriptive_title <- gsub("fBodyGyro", "frequency-domain-Body-Gyroscope", Descriptive_title)
names(tidy_data_Average) <- Descriptive_title
```

write it to tidy_data file
```{r}
write.table(tidy_data_Average, file='tidy_data.txt', row.names=F)
```
