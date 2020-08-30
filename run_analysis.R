setwd("C:/Users/Colin Zhang/Desktop/R/getting and cleaning data")

library("dplyr","readr")

## 1. reading in different data sets for merging

#reading variable names
Labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
features <- read.table("./data/UCI HAR Dataset/features.txt")
#reading test sets
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
#reading train sets
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")

##2. Merging datasets

# renaming activity column
names(y_test) <- "activity"
names(y_train) <- "activity"
names(subject_test) <- "subject"
names(subject_train) <- "subject"
# factoring before row binding
set_test <- data.frame(subsets=rep("test",2947))
set_train <- data.frame(subsets=rep("train",7352))
#cbing for complete test and train sets
test <- cbind(y_test, subject_test, set_test, x_test)
train <- cbind(y_train, subject_train, set_train, x_train)
#rbing for full dataset
data <- rbind(train, test)

##3. Renaming activities and other column variables

#renaming activities by factoring
data$activity <- data$activity %>% as.factor()
levels(data$activity) <- levels(Labels$V2) %>% tolower()
#renaming columns with descriptive variable names
varNames <- names(data)
varNames[4:564] <- features$V2 %>% as.character() #rename variables with descriptive names from features
varNames[4:564] <- gsub("\\(\\)", "", varNames[4:564]) #removing "()" from variable names
varNames[4:564] <- gsub("-", "_", varNames[4:564]) # replacing "-" with "_" in variable names
names(data) <- varNames

##4.Subsetting and data summarising

#extracting the mean and standard deviation for each measurement
targetColumn <- varNames[grepl(".+(mean_)|(mean)$|(std).*", varNames)]
mean_SD <- data %>% select(activity, subject, all_of(targetColumn))
#summarising
newdata <- list() #build an empty list
rowN <- levels(Labels$V2) %>% tolower() #create activity names
#looping and collecting averages into the list
for (i in 1:length(targetColumn)) {
        a <- tapply(mean_SD[,i+2], list(mean_SD$activity, mean_SD$subject), mean)
        rownames(a) <- rowN
        newdata[[targetColumn[i]]] <- a
}

## 5. Outputing the data
write.table(newdata, file = "./data/tidy_dataset.txt", row.names = FALSE)
data1 <- read.table("./data/tidy_dataset.txt", header = TRUE)
