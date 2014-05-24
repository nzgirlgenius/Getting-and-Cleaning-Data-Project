Getting and Cleaning Data Project
========================================================

The purpose of this project is to extract and clean a dataset from the web and produce a tidy dataset with documentation explaning the process and resulting analysis. The source data is the Human Activity Recognition Using Smartphones Dataset. (refer Acknowledgements below).

Specifically the dataset contains measurement and analysis of movement using a mobile phone. The final output is a breakdown of various features by subject and activity type.

## List of files for the project
* run_analysis.R
  * The R script used to import, clean, and export the averaged data set to a txt file
* readme.MD
  * Information on the project. (This file :-)
* codebook.MD
  * File describing the data, variables, and transformations performed.

Process
---------
The data for this project is sourced from the following link
* https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

1. Extract the files into the suggested folders in the same location as the run_analysis.R script.
2. Run the R script. The data is output to a file called averageddataset.txt, a space delimited text file including column names.

Acknowledgements
----------------
The source data has been provided free by the following.

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
