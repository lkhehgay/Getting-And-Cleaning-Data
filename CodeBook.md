This is a code book that describes the variables, the data, and any transformations or work that are performed to clean up the data.


Data
The dataset includes the following files:
1) 'README.txt'
2) 'features_info.txt': Shows information about the variables used on the feature vector.
3) 'features.txt': List of all features.
4) 'activity_labels.txt': Links the class labels with their activity name.
5) 'train/X_train.txt': Training set.
6) 'train/y_train.txt': Training labels.
7) 'test/X_test.txt': Test set.
8) 'test/y_test.txt': Test labels.


Transformation
There are 5 parts:
1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement.
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive activity names.
5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


Implementation
1) Load both test and train data
2) Load the features and activity labels.
3) Extract the mean and standard deviation column names and data.
4) Process the data.
