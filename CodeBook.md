# **Code Book**

The `run_analysis.R`  includes the data preparation and followed by the following steps.

**Step 1.**
***Downloading dataset:***
Since it is downloaded it is unziped to a folder called UCI HAR Dataset`

***Step 2.***
***Assigning extracted data to variables***

-   `features` <- `features.txt`
    
    561 rows, 2 columns  
The features selected for this database from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ._
    
-   `activity_labels` <- `activity_labels.txt`
    
    6 rows, 2 columns  
    List of activities_ with_ corresponding measurements_ and codes_ were taken_
    
-   `subject_test` <- `test/subject_test.txt`
    
    2947 rows, 1 column  
    Test data of 9/30 volunteer test subjects_
 
-   `x_test` <- `test/X_test.txt`
    
    2947 rows, 561 columns  
    Recorded test data
    
-   `y_test` <- `test/y_test.txt`
    
    2947 rows, 1 columns  
    Test data of activities’code labels_
    
-   `subject_train` <- `test/subject_train.txt`
    
    7352 rows, 1 column  
    Train data of 21/30 volunteer subjects
    
-   `x_train` <- `test/X_train.txt`
    
    7352 rows, 561 columns  
    Recorded features train data_
    
-   `y_train` <- `test/y_train.txt`
    
    7352 rows, 1 columns  
    Train data of activities’code labels

**Step 3.
*Combining the training and the test sets to create one data set***

-   `X` (10299 rows, 561 columns) is created by merging `x_train` and `x_test` using ****rbind()**** function
    
-   `Y` (10299 rows, 1 column) is created by merging `y_train` and `y_test` using ****rbind()**** function
    
-   `c_subject` (10299 rows, 1 column) is created by merging `subject_train` and `subject_test` using ****rbind()**** function
    
-   `combined_data`(10299 rows, 563 column) is created by merging c_subject, `Y` and `X` using ****cbind()**** function
    

**Step 4.
*Extracting only the measurements on the mean and standard deviation for each measurement and using descripritive actvity names to name the activities in the dataset***

-   `clean_data` (10299 rows, 88 columns) is created by subsetting `combined_data`, selecting only columns: `subject`, `code` and the measurements on the `mean` and standard deviation_ (`std`) for each measurement

-   Entire numbers in `code` column of the `clean_data` replaced with corresponding activity taken from second column of the `activities` variable.
 
  **Step 5.**
    *****Appropriately labels the data set with descriptive variable names*****
    
-   `code` column in `cleaned_data` renamed into `activities`
    
-   All `Acc` in column’s name replaced by `Accelerometer`
    
-   All `Gyro` in column’s name replaced by `Gyroscope`
    
-   All `BodyBody` in column’s name replaced by `Body`
    
-   All `Mag` in column’s name replaced by `Magnitude`
    
-   All start with character `f` in column’s name replaced by `Frequency`
    
-   All start with character `t` in column’s name replaced by `Time`
    
    ****Step 6. Subsetting and cleaning the data for a final result****
    
-   `CleanData` (180 rows, 88 columns) is created by sumarizing `clean_data` taking the means of each variable for each activity and each subject, after groupped by subject and activity.
    
-   Export into `CleanData.txt file.`
