This README.md file will explain how the data were extracted, transformed, and summarized using the run_analysis.R source file. 

Files included
1. run_analysis.R
2. README.md
3. CodeBook.md

Assumptions
1. The Source data must be loaded into the working directory
	To run the run_analysis.R source file the source data must be downloaded and put into your working directory from here: 
	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. The "plyr" library must be installed in your version of R. The library will be loaded when the run_analysis.R file is 	
	sourced.
3. The run_analysis.R file must be in the working directory of R

To Execute
1. Type source("run.analysis.R") in the R command prompt.

Output
1. A data frame called mega.tidy with 68 columns and 180 rows.


Data Processing
1. Data is loaded from the x, y, and subject .txt files for both the test and train data sets. 
2. The data column names are loaded and cleaned to follow common naming standard guidlines.
3. Data is binded together into a data fram to include all volunteers and their data.
4. Named activities data is added to the dataset to replace the activity id's.
5. Data is subsetted to only pull mean and standard deviation data; meanfrequency data is not included. 
6. The data frame is ordered by volunteer and by activity. 
7. The data featurs are averaged by volunteer and activity and the final data set is displayed. 

 





