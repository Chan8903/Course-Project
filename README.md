Coursera Getting and Cleaning Data Course-Project
=================================================
Introduction and Background (from course webpage)

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data
 set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by 
 your peers on a series of yes/no questions related to the project. You will be required to submit: 
 1) a tidy data set as described below, 2) a link to a Github repository with your script for 
 performing the analysis, and 3) a code book that describes the variables, the data, and any 
 transformations or work that you performed to clean up the data called CodeBook.md. You should 
 also include a README.md in the repo with your scripts. This repo explains how all of the scripts 
 work and how they are connected. 

One of the most exciting areas in all of data science right now is wearable computing - see for 
example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most 
advanced algorithms to attract new users. The data linked to from the course website represent data 
collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is 
available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following. 

 #1 Merges the training and the test sets to create one data set.
 
 #2 Extracts only the measurements on the mean and standard deviation for each measurement. 
 
 #3 Uses descriptive activity names to name the activities in the data set
 
 #4 Appropriately labels the data set with descriptive variable names. 
 
 #5 From the data set in step 4, creates a second, independent tidy data set with the average of 
	each variable for each activity and each subject.
	
Contents of the Repository http://Github.com/Chan8903/Course-Project:

A. README.md: this file describing the task and how it is carried out meeting requirements
	#1 though #5
	
B. run_analysis.R: The R script used to manipulate or Extract, Tranform and Load the data

C. tidy.txt: the R dataset which the run_analysis.R script produces. This is a text file as required
				in the course project page evaluating the files.				

D. Tidy file Codebook and File Layout.xlsx: describes how the data in the tidy file are structured
	or organized (file layout) and the derivation of activity names used in the layout (codebook)
	These files are also available separately in pdf files as Tidy Codebook of movement measures
		across activities of daily living.pdf and Tidy file Layout.pdf. Software to read the
		pdf files is available at: http://www.adobe.com/products/reader.html

	Each of the requirements #1 through #5 is met with a different file in this repository:
									Compliance Matrix
									#1	#2 	#3	#4 	#5
	A. README.md (overview addressing rater's issues in Course Project Discussion FAQ)
	B. run_analysis.R					x 	x 		x 
	C. tidy.txt file								x 
	D. tidy file Codebook & layout				x 	x 
		Tidy Codebook.pdf, layout.pdf			x 	xlsx

   

