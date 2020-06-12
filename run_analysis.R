
#loading a package to work with and downloadind data
library(dplyr)
file <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
if (!file.exists('./UCI HAR Dataset.zip')){
  download.file(file,'./UCI HAR Dataset.zip') %>% 
  unzip("UCI HAR Dataset.zip", exdir = getwd())
}

#assigning variables to all data tables
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

#making one data table, extractiong the mean measurements and a standard deviation for each measurement
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
c_subject <- rbind(subject_train, subject_test)
combined_data <- cbind(c_subject, Y, X)
clean_data <- combined_data %>% select(subject, code, contains("mean"), contains("std"))
clean_data$code <- activity_labels[clean_data$code, 2]

#tidying up data by labels with descriptive variable names
names(clean_data)[2] = "activity"
names(clean_data)<-gsub("Acc", "Accelerometer", names(clean_data))
names(clean_data)<-gsub("Gyro", "Gyroscope", names(clean_data))
names(clean_data)<-gsub("BodyBody", "Body", names(clean_data))
names(clean_data)<-gsub("Mag", "Magnitude", names(clean_data))
names(clean_data)<-gsub("^t", "Time", names(clean_data))
names(clean_data)<-gsub("^f", "Frequency", names(clean_data))
names(clean_data)<-gsub("tBody", "TimeBody", names(clean_data))
names(clean_data)<-gsub("-mean()", "Mean", names(clean_data), ignore.case = TRUE)
names(clean_data)<-gsub("-std()", "STD", names(clean_data),ignore.case = TRUE)
names(clean_data)<-gsub("-freq()", "Frequency", names(clean_data), ignore.case = TRUE)
names(clean_data)<-gsub("angle", "Angle", names(clean_data))
names(clean_data)<-gsub("gravity", "Gravity", names(clean_data))

#getting tidy data
result<-clean_data %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))

#saving the results in .txt file
write.table(result, "CleanData.txt", row.name=FALSE)


#checking the result
# result
# A tibble: 180 x 88
# Groups:   subject [30]
# subject activity TimeBodyAcceler~ TimeBodyAcceler~ TimeBodyAcceler~ TimeGravityAcce~ TimeGravityAcce~ TimeGravityAcce~
#   <int> <chr>               <dbl>            <dbl>            <dbl>            <dbl>            <dbl>            <dbl>
#   1       1 LAYING              0.222         -0.0405           -0.113            -0.249            0.706           0.446 
# 2       1 SITTING             0.261         -0.00131          -0.105             0.832            0.204           0.332 
# 3       1 STANDING            0.279         -0.0161           -0.111             0.943           -0.273           0.0135
# 4       1 WALKING             0.277         -0.0174           -0.111             0.935           -0.282          -0.0681
# 5       1 WALKING~            0.289         -0.00992          -0.108             0.932           -0.267          -0.0621
# 6       1 WALKING~            0.255         -0.0240           -0.0973            0.893           -0.362          -0.0754
# 7       2 LAYING              0.281         -0.0182           -0.107            -0.510            0.753           0.647 
# 8       2 SITTING             0.277         -0.0157           -0.109             0.940           -0.106           0.199 
# 9       2 STANDING            0.278         -0.0184           -0.106             0.897           -0.370           0.130 
# 10       2 WALKING             0.276         -0.0186           -0.106             0.913           -0.347           0.0847
