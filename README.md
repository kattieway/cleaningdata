### **README**

#### **Coursera Assignment: Getting and Cleaning Data Course Project**

This repository is a submission for Getting and Cleaning Data course project. It has the instructions on how to run analysis on Human Activity recognition dataset.

#### **Used Data**

[Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

#### **Files**

-   `CodeBook.md` a code book that describes the variables, the data and any transformations or work that I performed to clean up the data
    
-   `run_analysis.R` performs the data preparation and then followed by the 5 steps required as described in the course project’s definition:
    
    -   Merges the training and the test sets to create one data set.
        
    -   Extracts only the measurements on the mean and standard deviation for each measurement.
        
    -   Uses descriptive activity names to name the activities in the data set
        
    -   Appropriately labels the data set with descriptive variable names.
        
    -   From the dataset creates an independent clean data set with the average of each variable for each activity and each subject.
        
-   `CleanData.txt` is the exported final data after going through all the sequences described above.