# loads datasets
Xtrain <- read.table("./train/X_train.txt")
Ytrain <- read.table("./train/y_train.txt")
subtrain <- read.table("./train/subject_train.txt")
Xtest <- read.table("./test/X_test.txt")
Ytest <- read.table("./test/y_test.txt")
subtest <- read.table("./test/subject_test.txt")
features <- read.table("./features.txt")

# merge Xtrain & Xtest data
XData <- rbind(Xtest, Xtrain)

# create column names from features file
names(XData) <- features$V2

# combine subject data
subData <- rbind(subtest, subtrain)

# combine data from Y files
YData <- rbind(Ytest, Ytrain)

# extract mean and standard deviation variables
XDataMean <- XData[grep("mean()", names(XData), fixed = TRUE)]  # excludes meanFreq() variables
XDataStd <- XData[grep("std()", names(XData))]
XData2 <- cbind(XDataMean, XDataStd)

# combine all data sets into one frame
allData <- cbind(subData, YData, XData2)
names(allData)[1] <- "subject"
names(allData)[2] <- "activity"

# organize data by variable means of subject and activity
meltData <- melt(allData, id=c("subject", "activity"))
averages <- dcast(meltData, subject + activity ~ variable, mean)

# replace activity names
averages$activity[averages$activity == 1] <- "WALKING"
averages$activity[averages$activity == 2] <- "WALKING UP"
averages$activity[averages$activity == 3] <- "WALKING DOWN"
averages$activity[averages$activity == 4] <- "SITTING"
averages$activity[averages$activity == 5] <- "STANDING"
averages$activity[averages$activity == 6] <- "LAYING"

# write table
tidy <- write.table(averages, "tidydata.txt")
tidyData <- read.table("tidydata.txt")
