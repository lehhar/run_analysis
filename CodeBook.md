=======================================
Aim of this project:
Calculate the mean per feature for each activity of sensor signals (accelerometer and gyroscope).
=======================================
Source data:
The folder "\UCI HAR Dataset" with the data of the project has to be in the working directory of R.
Download the data from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The variable names are listed in the file "features.txt".
The description of the activity data is in the file "activity_labels.txt".
=======================================
Description of the data preparation process in the file "run_analysis.R":

The training and test data set is read and merged:
	"./UCI HAR Dataset/train/X_train.txt"
	"./UCI HAR Dataset/test/X_test.txt"

The activity labels of the training and test data set is read, merged and attached as additional column to the data set mentioned above.
	"./UCI HAR Dataset/train/y_train.txt"
	"./UCI HAR Dataset/test/y_test.txt"

The variable names are read from the file and the column names of the data set replaced with those names:
	"./UCI HAR Dataset/features.txt"

Only variables which calculate the mean or standard deviation of a variable are investigated further.

The mean of each variable per activity label is calculated.

The result is printed as output of the R-script and written in the file "X_mean.txt" in the working directory of R.
=======================================
For more information see the publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
