---
title: "Getting and Cleaning Data Course Project"
author: "Andreugv"
date: "03/26/2016"

---

## Project Description
This project uses data provided to construct a new tidy dataset, and is part
of a the final project for Getting and Cleaning Data Course, in Coursera.

##Study design and data processing
For this study, data provided for the course was used. The original data can be
downloaded from the following link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The original data is part of a study from the University of California at Irvine.
This data compromises several data obtained from the accelerometer and gyroscope
on a Samsung Galaxy S II, placed on the waist of 30 volunteers while performing 6
different activities.

The purpose of my study was to provide a new tidy dataset, that included the
means of every variable found on the original study and was the mean or standard
deviation of another variable, grouped by subject and activity performed.

In order to create this new dataset, one only R script, "run_analysis.R" was
used.

###Collection of the raw data
The experiments were carried out with a group of 30 volunteers within an
age bracket of 19-48 years. Each person performed six activities
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded
accelerometer and gyroscope, they captured 3-axial linear acceleration and
3-axial angular velocity at a constant rate of 50Hz.

##Creating the tidy datafile

###Guide to create the tidy data file
1st - Download the original data from the link provided.
2nd - Unzip the original data folder to the desired directory.
3rd - Use "run_analysis.R" script:
  1st - Open R.
  2nd - Use source() to load the script, with the path to the script.
  3rd - Run <run_analysis("UCIHARpath")> where UCIHARpath is path to the
    unzipped folder.

The code will process the original data and write a final dataset named
"grouped_mean.txt" in the root of the unzipped directory. This dataset can then
be read with <read.table(x, header = TRUE)>.

###Cleaning of the data
The script "run_analysis.R" reads the required data from the original study,
combining the Train and Test datasets with <merge()>, labeling the variables for
the study, then subsets the dataframe to a new dataframe that only includes the
mean and SD variables for each variable, using <grep()> to subset the
appropriate data.
This data is then grouped using the <{dplyr}> package by subject and activity,
and finally calculates the mean of each group and variable with
<summarise_each(x, funs(mean)) {dplyr}>.

For more details about the script, visit the readme file:
https://github.com/andreugv/Getting_and_Cleaning_Data_Course_Project/blob/master/README.md

##Description of the grouped_mean.txt file

 - grouped_mean is a table of size 180x81 (first 2 columns used for
   classification purposes)
 - Data included in the dataset are means of variables mean and SD.
 - Variables included:

1- subject

2- activity  

3- Mean_tBodyAcc-XYZ

4- Mean_tGravityAcc-XYZ

5- Mean_tBodyAccJerk-XYZ

6- Mean_tBodyGyro-XYZ

7- Mean_tBodyGyroJerk-XYZ

8- Mean_tBodyAccMag

9- Mean_tGravityAccMag

10- Mean_tBodyAccJerkMag

11- Mean_tBodyGyroMag

12- Mean_tBodyGyroJerkMag

13- Mean_fBodyAcc-XYZ

14- Mean_fBodyAcc.meanFreq-XYZ

15- Mean_fBodyAccJerk-XYZ

16- Mean_fBodyAccJerk.meanFreq-XYZ

17- Mean_fBodyGyro-XYZ

18- Mean_fBodyGyro.meanFreq-XYZ

19- Mean_fBodyAccMag

20- Mean_fBodyAccMag.meanFreq

21- Mean_fBodyAccJerkMag

22- Mean_fBodyAccJerkMag.meanFreq

23- Mean_fBodyGyroMag

24- Mean_fBodyBodyGyroMag.meanFreq

25- Mean_fBodyGyroJerkMag

26- Mean_fBodyBodyGyroJerkMag.meanFreq

###Variable "subject"
Identifies the subject. For classification purposes.

Some information on the variable :
 - Value between 1 and 30.
 - Each number equals a different volunteer.

###Variable "activity"
Identifies the activity performed by the subject. For classification purposes.

Some information on the variable including:
 - Activities are:
    1- Lay: Subject lays on a table.
    2- Sit: Subject sit on a chair.
    3- Stand: Subject stands up on the floor, steady.
    4- Walk: Subject walks normally.
    5- Walk_Downstairs: Subject walks downstairs normally.
    6- Walk_Upstairs: Subject walks upstairs normally.

###Variable "Mean_tBodyAcc-XYZ"
Divided in 6 different variables, one for each axis, in 2 different groups,
Mean of means and Mean of standard deviation. From raw data recorded by the
accelerometer. These time domain signals (prefix 't' to denote time) were
captured at a constant rate of 50 Hz. Then they were filtered using a median
filter and a 3rd order low pass Butterworth filter with a corner frequency of
20 Hz to remove noise. Similarly, the acceleration signal was then separated
into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ)
using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
Mean_tBodyAcc-XYZ Includes the mean of means and mean of SDs for tBodyAcc-XYZ.

Some information on the variable:
- Values are means.
- Not a unit of measurement.
- Descriptors used: Mean_time_Body_Acceleration_Axis_Mean/sd

###Variable "Mean_tGravityAcc-XYZ"
Divided in 6 different variables, one for each axis, in 2 different groups,
Mean of means and Mean of standard deviation. From raw data recorded by the
accelerometer. These time domain signals (prefix 't' to denote time) were
captured at a constant rate of 50 Hz. Then they were filtered using a median
filter and a 3rd order low pass Butterworth filter with a corner frequency of
20 Hz to remove noise. Similarly, the acceleration signal was then separated
into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ)
using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
Mean_tGravityAcc-XYZ Includes the mean of means and mean of SDs for
tGravityAcc-XYZ.

Some information on the variable:
  - Values are means.
  - Not a unit of measurement.
  - Descriptors used: Mean_time_Gravity_Acceleration_Axis_Mean/sd

###Variable "Mean_tBodyAccJerk-XYZ"
Divided in 6 different variables, one for each axis, in 2 different groups,
Mean of means and Mean of standard deviation. From raw data recorded by the
accelerometer. The body linear acceleration and angular velocity were derived in
time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).
Mean_tBodyAccJerk-XYZ Includes the mean of means and mean of SDs for
tBodyAccJerk-XYZ.

Some information on the variable:
  - Values are means.
  - Not a unit of measurement.
  - Descriptors used: Mean_time_Body_Acceleration_Jerk_Axis_Mean/sd

###Variable "Mean_tBodyGyro-XYZ"
Divided in 6 different variables, one for each axis, in 2 different groups,
Mean of means and Mean of standard deviation. From raw data recorded by the
gyroscope. Fast Fourier Transform (FFT) was applied to tGyro-XYZ to obtain
Mean_tBodyGyro-XYZ. Mean_tBodyGyro-XYZ Includes the mean of means and mean
of SDs for tBodyGyro-XYZ.

Some information on the variable:
  - Values are means.
  - Not a unit of measurement.
  - Descriptors used: Mean_time_Body_Gyroscope_Axis_Mean/sd

###Variable "Mean_tBodyGyroJerk-XYZ"
Divided in 6 different variables, one for each axis, in 2 different groups,
Mean of means and Mean of standard deviation. From raw data recorded by the
gyroscope. These time domain signals (prefix 't' to denote time) were
captured at a constant rate of 50 Hz. Then they were filtered using a median
filter and a 3rd order low pass Butterworth filter with a corner frequency of
20 Hz to remove noise. Similarly, the acceleration signal was then separated
into body and gravity acceleration signals (tBodyGyro-XYZ and tGravityGyro-XYZ)
using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
Mean_tBodyGyroJerk-XYZ Includes the mean of means and mean of SDs for
tBodyGyro-XYZ.

Some information on the variable:
  - Values are means.
  - Not a unit of measurement.
  - Descriptors used: Mean_time_Body_Gyroscope_Jerk_Axis_Mean/sd

###Variable "Mean_tBodyAccMag"
Divided in 2 different variables, Mean of means and Mean of standard deviation.
From raw data recorded by the accelerometer. The magnitude of these
three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag,
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).
Mean_tBodyAccMag Includes the mean of means and mean of SDs for tBodyAccMag.

Some information on the variable:
  - Values are means.
  - Not a unit of measurement.
  - Descriptors used: Mean_time_Body_Accelerometer_Magnitude_Mean/sd

###Variable "Mean_tGravityAccMag"
Divided in 2 different variables, Mean of means and Mean of standard deviation.
From raw data recorded by the accelerometer. The magnitude of these
three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag,
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).
Mean_tGravityAccMag Includes the mean of means and mean of SDs for
tGravityAccMag.

Some information on the variable:
  - Values are means.
  - Not a unit of measurement.
  - Descriptors used: Mean_time_Gravity_Accelerometer_Magnitude_Mean/sd

###Variable "Mean_tBodyAccJerkMag"
Divided in 2 different variables, Mean of means and Mean of standard deviation.
From raw data recorded by the accelerometer. The magnitude of these
three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag,
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).
Mean_tBodyAccJerkMag Includes the mean of means and mean of SDs for
tBodyAccJerkMag.

Some information on the variable:
  - Values are means.
  - Not a unit of measurement.
  - Descriptors used: Mean_time_Body_Accelerometer_Jerk_Magnitude_Mean/sd

###Variable "Mean_tBodyGyroMag"
Divided in 2 different variables, Mean of means and Mean of standard deviation.
From raw data recorded by the gyroscope. The magnitude of these
three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag,
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).
Mean_tBodyGyroMag Includes the mean of means and mean of SDs for tBodyGyroMag.

Some information on the variable:
  - Values are means.
  - Not a unit of measurement.
  - Descriptors used: Mean_time_Body_Gyroscope_Magnitude_Mean/sd

###Variable "Mean_tBodyGyroJerkMag"
Divided in 2 different variables, Mean of means and Mean of standard deviation.
From raw data recorded by the gyroscope. The magnitude of these
three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag,
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).
Mean_tBodyGyroJerkMag Includes the mean of means and mean of SDs for
tBodyGyroJerkMag.

Some information on the variable:
  - Values are means.
  - Not a unit of measurement.
  - Descriptors used: Mean_time_Body_Gyroscope_Jerk_Magnitude_Mean/sd

###Variable "Mean_fBodyAcc-XYZ"
Divided in 6 different variables, one for each axis, in 2 different groups,
Mean of means and Mean of standard deviation. From raw data recorded by the
accelerometer. A Fast Fourier Transform (FFT) was applied to some of these
signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ,
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag.
Mean_fBodyAcc-XYZ Includes the mean of means and mean of SDs for
fBodyAcc-XYZ.

Some information on the variable:
  - Values are means.
  - Not a unit of measurement.
  - Descriptors used: Mean_FrequencyDomainSignals_Body_Accelerometer_Axis_Mean/sd

###Variable "Mean_fBodyAcc.meanFreq-XYZ"
Divided in 3 different variables, one for each axis, Mean of means.
From raw data recorded by the accelerometer.
Weighted average of the frequency components to obtain a mean frequency.

Some information on the variable:
  - Values are means.
  - Not a unit of measurement.
  - Descriptors used: Mean_FrequencyDomainSignals_Body_Accelerometer_meanFrequency_Axis

###Variable "Mean_fBodyAccJerk-XYZ"
Divided in 6 different variables, one for each axis, in 2 different groups,
Mean of means and Mean of standard deviation. From raw data recorded by the
accelerometer. A Fast Fourier Transform (FFT) was applied to some of these
signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ,
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag.
Mean_fBodyAccJerk-XYZ Includes the mean of means and mean of SDs for
fBodyAccJerk-XYZ.

Some information on the variable:
  - Values are means.
  - Not a unit of measurement.
  - Descriptors used: Mean_FrequencyDomainSignals_Body_Accelerometer_Jerk_Axis_Mean/sd

###Variable "Mean_fBodyAccJerk.meanFreq-XYZ"
Divided in 3 different variables, one for each axis, Mean of means.
From raw data recorded by the accelerometer.
Weighted average of the frequency components to obtain a mean frequency.

Some information on the variable:
  - Values are means.
  - Not a unit of measurement.
  - Descriptors used: Mean_FrequencyDomainSignals_Body_Accelerometer_meanFrequency_Axis

###Variable "Mean_fBodyGyro-XYZ"
Divided in 6 different variables, one for each axis, in 2 different groups,
Mean of means and Mean of standard deviation. From raw data recorded by the
gyroscope. A Fast Fourier Transform (FFT) was applied to some of these
signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ,
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag.
Mean_fBodyGyro-XYZ Includes the mean of means and mean of SDs for
fBodyGyro-XYZ.

Some information on the variable:
  - Values are means.
  - Not a unit of measurement.
  - Descriptors used: Mean_FrequencyDomainSignals_Body_Gyroscope_Axis_Mean/sd

###Variable "Mean_fBodyGyro.meanFreq-XYZ"
Divided in 3 different variables, one for each axis, Mean of means.
From raw data recorded by the gyroscope.
Weighted average of the frequency components to obtain a mean frequency.

Some information on the variable:
  - Values are means.
  - Not a unit of measurement.
  - Descriptors used: Mean_FrequencyDomainSignals_Body_Gyroscope_meanFrequency_Axis

###Variable "Mean_fBodyAccMag"
Divided in 2 different variables, Mean of means and Mean of standard deviation.
From raw data recorded by the accelerometer. A Fast Fourier Transform (FFT) was
applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ,
fBodyGyro-XYZ, fBodyAccJerkMag, fBodyAccMag, fBodyGyroMag, fBodyGyroJerkMag.
Mean_fBodyAccMag Includes the mean of means and mean of SDs for
fBodyAccMag.

Some information on the variable:
  - Values are means.
  - Not a unit of measurement.
  - Descriptors used: Mean_FrequencyDomainSignals_Body_Accelerometer_Magnitude_Mean/sd

###Variable "Mean_fBodyAccMag.meanFreq"
One only variable, Mean of means.
From raw data recorded by the accelerometer.
Weighted average of the frequency components to obtain a mean frequency.

Some information on the variable:
  - Values are means.
  - Not a unit of measurement.
  - Descriptors used: Mean_FrequencyDomainSignals_Body_Accelerometer_Magnitude_meanFrequency

###Variable "Mean_fBodyAccJerkMag"
Divided in 2 different variables, Mean of means and Mean of standard deviation.
From raw data recorded by the accelerometer. A Fast Fourier Transform (FFT) was
applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ,
fBodyGyro-XYZ, fBodyAccJerkMag, fBodyAccMag, fBodyGyroMag, fBodyGyroJerkMag.
Mean_fBodyAccJerkMag Includes the mean of means and mean of SDs for
fBodyAccJerkMag.

Some information on the variable:
  - Values are means.
  - Not a unit of measurement.
  - Descriptors used: Mean_FrequencyDomainSignals_Body_Accelerometer_Jerk_Magnitude_Mean/sd

###Variable "Mean_fBodyAccJerkMag.meanFreq"
One only variable, Mean of means.
From raw data recorded by the accelerometer.
Weighted average of the frequency components to obtain a mean frequency.

Some information on the variable:
  - Values are means.
  - Not a unit of measurement.
  - Descriptors used: Mean_FrequencyDomainSignals_Body_Accelerometer_Jerk_Magnitude_meanFrequency

###Variable "Mean_fBodyGyroMag"
Divided in 2 different variables, Mean of means and Mean of standard deviation.
From raw data recorded by the gyroscope. A Fast Fourier Transform (FFT) was
applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ,
fBodyGyro-XYZ, fBodyAccJerkMag, fBodyAccMag, fBodyGyroMag, fBodyGyroJerkMag.
Mean_fBodyGyroMag Includes the mean of means and mean of SDs for
fBodyGyroMag.

Some information on the variable:
  - Values are means.
  - Not a unit of measurement.
  - Descriptors used: Mean_FrequencyDomainSignals_Body_Gyroscope_Magnitude_Mean/sd

###Variable "Mean_fBodyBodyGyroMag.meanFreq"
One only variable, Mean of means.
From raw data recorded by the gyroscope.
Weighted average of the frequency components to obtain a mean frequency.

Some information on the variable:
  - Values are means.
  - Not a unit of measurement.
  - Descriptors used: Mean_FrequencyDomainSignals_Body_Body_Gyroscope_Magnitude_meanFrequency

###Variable "Mean_fBodyGyroJerkMag"
Divided in 2 different variables, Mean of means and Mean of standard deviation.
From raw data recorded by the gyroscope. A Fast Fourier Transform (FFT) was
applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ,
fBodyGyro-XYZ, fBodyAccJerkMag, fBodyAccMag, fBodyGyroMag, fBodyGyroJerkMag.
Mean_fBodyGyroJerkMag Includes the mean of means and mean of SDs for
fBodyGyroJerkMag.

Some information on the variable:
  - Values are means.
  - Not a unit of measurement.
  - Descriptors used: Mean_FrequencyDomainSignals_Body_Gyroscope_Jerk_Magnitude_Mean/sd

###Variable "Mean_fBodyBodyGyroJerkMag.meanFreq"
One only variable, Mean of means.
From raw data recorded by the gyroscope.
Weighted average of the frequency components to obtain a mean frequency.

Some information on the variable:
  - Values are means.
  - Not a unit of measurement.
  - Descriptors used: Mean_FrequencyDomainSignals_Body_Body_Gyroscope_Jerk_Magnitude_meanFrequency





##Sources
Original data:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
