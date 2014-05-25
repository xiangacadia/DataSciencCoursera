
## Please make sure the working directory has the "UCI HAR Dataset" directory

library(reshape2)

## read in the training data and test data
train_x <- read.csv("/Users/xiangjiang/Documents/git/Data Science at Coursera/3. Getting and Cleaning Data/2. merging data/UCI HAR Dataset/train/x_train.txt", sep="", header=FALSE, skipNul = TRUE)
train_y <- read.csv("/Users/xiangjiang/Documents/git/Data Science at Coursera/3. Getting and Cleaning Data/2. merging data/UCI HAR Dataset/train/y_train.txt", sep="", header=FALSE, skipNul = TRUE)

test_x <- read.csv("/Users/xiangjiang/Documents/git/Data Science at Coursera/3. Getting and Cleaning Data/2. merging data/UCI HAR Dataset/test/x_test.txt", sep="", header=FALSE, skipNul = TRUE)
test_y <- read.csv("/Users/xiangjiang/Documents/git/Data Science at Coursera/3. Getting and Cleaning Data/2. merging data/UCI HAR Dataset/test/y_test.txt", sep="", header=FALSE, skipNul = TRUE)

## appending train_x and test_x on top of each other
z <- rbind(train_x, test_x)

## Extracts only the measurements on the mean and standard deviation for each measurement
cols_mean <- c(1,2,3,41,42,43,81,82,83,121,122,123,161,162,163,201,214,227,240,253,
          266,267,268,294,295,296,345,346,347,373,374,375,424,425,426,452,453,454,
          503,513,516,526,529,539,542,552)
cols_std <- c(4,5,6,44,45,46,84,85,86,124,125,126,164,165,166,202,215,228,41,254,
              269,270,271,348,349,350,427,428,429,504,517,530,543)
cols <- append(cols_mean, cols_std)

mean_std <- z[,cols]

## read activities
train_y <- read.csv("/Users/xiangjiang/Documents/git/Data Science at Coursera/3. Getting and Cleaning Data/2. merging data/UCI HAR Dataset/train/y_train.txt", sep="", header=FALSE, skipNul = TRUE)
test_y <- read.csv("/Users/xiangjiang/Documents/git/Data Science at Coursera/3. Getting and Cleaning Data/2. merging data/UCI HAR Dataset/test/y_test.txt", sep="", header=FALSE, skipNul = TRUE)
y <- mapply(c, train_y, test_y)

## Uses descriptive activity names to name the activities in the data set
activity <- c()
for(i in y){
    if(i == 1){
        activity <- append(activity, c("WALKING"))
    }
    
    if(i == 2){
        activity <- append(activity, c("WALKING_UPSTAIRS"))
    }
    
    if(i == 3){
        activity <- append(activity, c("WALKING_DOWNSTAIRS"))
    }
           
    if(i == 4){
        activity <- append(activity, c("SITTING"))
    }
    
    if(i == 5){
        activity <- append(activity, c("STANDING"))
    }
          
    if(i ==6){
        "6"= activity <- append(activity, c("LAYING"))
    }
}

## append activity to the data frame
mean_std <- cbind(mean_std, activity)

## read subjects
train_subject <- read.csv("/Users/xiangjiang/Documents/git/Data Science at Coursera/3. Getting and Cleaning Data/2. merging data/UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE, skipNul = TRUE)
test_subject <- read.csv("/Users/xiangjiang/Documents/git/Data Science at Coursera/3. Getting and Cleaning Data/2. merging data/UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE, skipNul = TRUE)
subject <- mapply(c, train_subject, test_subject)

## append subject to the data frame
mean_std <- cbind(mean_std, subject)

## Creates a second, independent tidy data set with the average of 
## each variable for each activity and each subject. 
names(mean_std)[81] <- "subject"
data_melt <- melt(mean_std, id=c("activity", "subject"), measure.vars=names(mean_std)[1:79], na.rm=TRUE)
tidy_data <- acast(data_melt, activity+subject ~ variable, mean, margins = TRUE)

write.csv(tidy_data, "tidy_data.txt")
