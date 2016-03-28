# Getting_and_Cleaning_Data_Course_Project
##README

###Introduction

This is the course project for the Getting and Cleaning Data Coursera course.
The project contains one script "run_analysis.R", a codebook "CodeBook.md" containing information about the processed data and the processed data file "grouped_mean.txt", which can be read into R with <read.table(tbl, headers = True)>.

###Usage instructions

1- Download the script into the desired directory.
2- Run R.
3- Source the script with <source("path to the script").
4- Run the script with <run_analysis(UCIHARpath), where UCIHARpath is the path to the main folder of the original data. (For more information see the codebook, source section).

###Process

The script "run_analysis.R" executes the following functions:

1- Checks for the required packages, and installs missing packages.
2- Sources the required libraries.
3- Sets working directory to UCIHARpath specified.
4- Reads the features table and gets the original ColNames (variable names).
5- Reads the Activity and Subject tables.
6- Reads both data tables (Train and test), and applies the correct variable names.
7- Adds the Subject and Activity columns to the first columns of each, Train and Test tables.
8- Merges both tables using <merge(..., all = T, sort = F)>
9- Makes use of <grep()> to create a new table that only includes the variables with "mean" or "std" on it's ColName. Does not extract the columns with "Mean" and "Std" (note capital letters), because this are used for the angles between vectors, which are not part of th data requested for the project.
10- Unlists "Activity" column to make it suitable for the next steps.
11- Groups the table by Subject and Activity using <group_by() {dplyr}>.
12- Calculates the mean for each group and variable with <summarise_each() {dplyr}>
13- Renames the Variables to note the transformation underwent for the data.
14- Writes a table with the final, tidy data into the same working directory specified.

###Notes

Resulting table can be read with <read.table(tbl, headers = True)>, where tbl is the path to the table or table name if path is same as WD.
Data was grouped by Subject and then activity, which, to my understanding, produces the clearer way to manage this data set.
This script was written to be used with a particular directory structure based on the original data provided, and won't work of the files and directories structure has been changed. Follow the instruction in the CodeBook.md in order to set the working directory properly.

###Author information

Andreugv
