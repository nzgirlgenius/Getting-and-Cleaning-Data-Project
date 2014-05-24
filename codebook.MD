Getting and Cleaning Data Codebook
========================================================
The purpose of this project is to extract and clean a dataset from the web and produce a tidy dataset with documentation explaning the process and resulting analysis.

Process
---------
Follow the instructions in the readme.MD file to extract the averaged data set (averageddataset.txt).

About the Dataset
-----------------
The documentation accompanying the raw datasets contains descriptions of the data, variables, and calculations performed. In the interests of brevity I shall not repeat that information here. For more detail please read
*Readme.txt
*Features_info.txt
*Features.txt
  *for a complete list of the features measured/calculated

The following files are used as the raw data for my analysis.
*UCI HAR Dataset/train/X_train.txt
*UCI HAR Dataset/test/X_test.txt
*UCI HAR Dataset/train/Y_train.txt
*UCI HAR Dataset/test/Y_test.txt
*UCI HAR Dataset/train/subject_train.txt
*UCI HAR Dataset/test/subject_test.txt
*UCI HAR Dataset/activity_labels.txt

Creating the tidy data set.
----------------------------

The training data and test data sets were combined into a single data set with labels applied.
A subset of mean and standard deviation measures were selected for further analysis. 
Relevant features were selected by the labels containing key phrases "mean" and "std". Features were selected from both the time domain and frequency domain data but excludes angle calculations. The 61 selected measures were then relabled with abbreviations expanded to more readily readable names.
*t = timedomain
*f = freqdomain
*acc = accelerometer
*gyro = gyroscope
*mag = magnitude

The key features were then averaged for each subject and activity type. The resulting dataset was ronded to 8 significanr figure to match the soure data and saved to a space delimitted file with column headers called averageddataset.txt. Averaging of the data was spot checked using excel. 

Acknowledgements
----------------
The source data has been provided free by the following.

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.