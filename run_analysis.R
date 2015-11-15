## setting working directory where data sit

setwd('./UCI HAR Dataset')

# Read and row bind datasets of train and test group

data_X <- rbind(read.table('train/X_train.txt'),
                read.table('test/X_test.txt'))
data_y <- rbind(read.table('train/y_train.txt', col.names='Activity.Id'),
                read.table('test/y_test.txt', col.names='Activity.Id'))
data_subj <- rbind(read.table('train/subject_train.txt', col.names='Subject.Id'),
                   read.table('test/subject_test.txt', col.names='Subject.Id'))

# read feature name, and give it to variable name of the data, i.e., column names

features <- read.table('features.txt', col.names=c('Feature.Id', 'Feature.Name'))
names(data_X) <- features$Feature.Name

# grep (or select) column names having mean or std, and create a corresponding data frame

col_idx <- grep("-(mean|std)\\(\\)-", features$Feature.Name)
mean_std_data_X <- data_X[, col_idx]

# give corresponding ID activity name to each activity

activities <- read.table('activity_labels.txt', col.names=c('Activity.Id', 'Activity'))
data_y <- merge(data_y, activities)
data_y$Activity.Id <- NULL

# attach subject ID and activity columns to the data set

tidyData <- cbind(data_subj, data_y, mean_std_data_X)

# meld and dcast to find mean of activity

library(reshape2)
tidyDataAvg <- dcast(melt(tidyData, id.vars=c('Subject.Id', 'Activity')),
                     Subject.Id + Activity ~ variable,
                     mean)

# write it to tidy_data file

write.table(tidyDataAvg, file='tidy_Data.txt', row.names=F)