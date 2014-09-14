## set wd
# setwd("/Users/ganguli9795/Documents/github_repositories/gc_project")
library('dplyr')

## get and load project data
fileurl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(fileurl, destfile = './data.zip', method = 'curl')
download.date <- data()
unzip('data.zip')

## read data into R
features <- read.table('UCI HAR Dataset/features.txt')
activity.labels <- read.table('UCI HAR Dataset/activity_labels.txt')
test.subject <- read.table('UCI HAR Dataset/test/subject_test.txt')
test.x <- read.table('UCI HAR Dataset/test/X_test.txt')
train.x <- read.table('UCI HAR Dataset/train/X_train.txt')
train.y <- read.table('UCI HAR Dataset/train/Y_train.txt', col.names = 'activity_label')
train.subject <- read.table('UCI HAR Dataset/train/subject_train.txt')
test.y <- read.table('UCI HAR Dataset/test/Y_test.txt', col.names = 'activity_label')


colnames(activity.labels)[2] <- 'activity'
# for test data: add column names to each data frame
colnames(test.subject)[1] <- "subject"
features.names <- features$V2 ## extract features names from data frame
names(test.x) <- features.names ## rename column names
test.x.meanstd <- select(test.x, matches('[Mm]ean|[Ss]td'))
# for trainning data: add column names to each data frame
colnames(train.subject)[1] <- 'subject'
names(train.x) <- features.names
train.x.meanstd <- select(train.x, matches('[Mm]ean|[Ss]td'))

## add subject data to each test and train data frames
test.x.sub <- cbind(test.x.meanstd, test.subject)
train.x.sub <- cbind(train.x.meanstd, train.subject)
## add 'y' data to train and test data frames
test.x.y.sub <- cbind(test.x.sub, test.y)
train.x.y.sub <- cbind(train.x.sub, train.y)

## stack train and test data frames on top of each other
almost.tidy <- rbind(test.x.y.sub, train.x.y.sub)

## merge activity and activity labels
tidy.data <- merge(almost.tidy, activity.labels, by.x = 'activity_label', by.y = 'V1')
tidy.data$activity_label <- NULL ## remove activity label column

library('reshape2')

name <- names(tidy.data[1:86]) ## store column names that I want to take the mean from
tidy.melt <- melt(tidy.data, id = c('subject', 'activity'), measure.vars = name)
tidy.data2 <- dcast(tidy.melt, subject + activity ~ variable, mean)

## rename feature column names; add "mean' to begining of each column name
var.names <- list()
for(i in names.test){
    var.names[[length(var.names) + 1]] <- paste('mean', i, sep = '-')
}

names(tidy.data2)[3:88] <- var.names

tidy.data2








