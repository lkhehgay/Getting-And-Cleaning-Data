setwd("C://LKG//MOOC//Getting and Cleaning Data//Week 3//UCI HAR Dataset")

## 1.Merges the training and the test sets to create one data set.
temp1 <- read.table(".//train//X_train.txt", sep = "", header = FALSE)
temp2 <- read.table(".//test//X_test.txt", sep = "", header = FALSE)
X <- rbind(temp1, temp2)

temp1 <- read.table(".//train//subject_train.txt", sep = "", header = FALSE)
temp2 <- read.table(".//test//subject_test.txt", sep = "", header = FALSE)
S <- rbind(temp1, temp2)

temp1 <- read.table(".//train//y_train.txt", sep = "", header = FALSE)
temp2 <- read.table(".//test//y_test.txt", sep = "", header = FALSE)
Y <- rbind(temp1, temp2)


## 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table(".//features.txt")
required_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, required_features]
names(X) <- features[required_features, 2]
names(X) <- gsub("\\(|\\)", " ", names(X))


## 3.Uses descriptive activity names to name the activities in the data set.  
activities <- read.table(".//activity_labels.txt")
activities[, 2] = gsub("_", " ", as.character(activities[, 2]))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "Activity"


## 4.Appropriately labels the data set with descriptive variable names. 
names(S) <- "Subject"
cleaned <- cbind(S, Y, X)
write.table(cleaned, "Dataset_Of_Merged_Clean_Data.txt", row.name = FALSE)


## creates a second, independent tidy data set with the average of each variable for each activity and each subject.
uniqueSubjects = unique(S)[,1]
NumberOfSubjects = length(unique(S)[,1])
NumberOfActivities = length(activities[,1])
NumberOfColumns = dim(cleaned)[2]
result = cleaned[1:(NumberOfSubjects * NumberOfActivities), ]

row <- 1
for (s in 1:NumberOfSubjects) {
  for (a in 1:NumberOfActivities) {
    result[row, 1] = uniqueSubjects[s]
    result[row, 2] = activities[a, 2]
    temp <- cleaned[cleaned$Subject == s & cleaned$Activity == activities[a, 2], ]
    result[row, 3:NumberOfColumns] <- colMeans(temp[, 3:NumberOfColumns])
    row <- row + 1
  }
}

write.table(result, "Data_Set_With_The_Averages.txt", row.name = FALSE)