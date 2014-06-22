Data Dictionary




Summary==============================================================
This dataset represents a subset of the UCI HAR Dataset referenced below. Data was taken from the test and train participants, merged, cleaned, and summarized to form this dataset. Please see the README.md file for more details on how to reproduce the data.

A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the raw data from which this subset was derived: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


Data=================================================================
1: "volunteer_id" 
	Range [1,30]
	Each number represents one of the 30 volunteers.

2: "activity" 
	Values include:
		WALKING, 
		WALKING_UPSTAIRS, 
		WALKING_DOWNSTAIRS, 
		SITTING, 
		STANDING, 
		LAYING

3:68 Readings as noted below.
	Keys to understanding the labels:
		avg 		Average
		acc 		Accelerometer
		x 			x coordinate
		y 			y coordinate
		z 			z coordinate
		std 		Standard Deviation
		gyro 		Gyroscope
		mag 		Magnitude
		freq  		Frequency

	Organized by data groupings:
		"avg_time_body_acc_mean_x" 
		"avg_time_body_acc_mean_y" 
		"avg_time_body_acc_mean_z" 

		"avg_time_body_acc_std_x" 
		"avg_time_body_acc_std_y" 
		"avg_time_body_acc_std_z" 

		"avg_time_gravity_acc_mean_x" 
		"avg_time_gravity_acc_mean_y" 
		"avg_time_gravity_acc_mean_z" 

		"avg_time_gravity_acc_std_x" 
		"avg_time_gravity_acc_std_y" 
		"avg_time_gravity_acc_std_z" 

		"avg_time_body_acc_jerk_mean_x" 
		"avg_time_body_acc_jerk_mean_y" 
		"avg_time_body_acc_jerk_mean_z" 

		"avg_time_body_acc_jerk_std_x" 
		"avg_time_body_acc_jerk_std_y" 
		"avg_time_body_acc_jerk_std_z" 

		"avg_time_body_gyro_mean_x" 
		"avg_time_body_gyro_mean_y" 
		"avg_time_body_gyro_mean_z" 

		"avg_time_body_gyro_std_x" 
		"avg_time_body_gyro_std_y" 
		"avg_time_body_gyro_std_z" 

		"avg_time_body_gyro_jerk_mean_x" 
		"avg_time_body_gyro_jerk_mean_y" 
		"avg_time_body_gyro_jerk_mean_z" 

		"avg_time_body_gyro_jerk_std_x" 
		"avg_time_body_gyro_jerk_std_y" 
		"avg_time_body_gyro_jerk_std_z" 

		"avg_time_body_acc_mag_mean" 
		"avg_time_body_acc_mag_std" 

		"avg_time_gravity_acc_mag_mean" 
		"avg_time_gravity_acc_mag_std" 

		"avg_time_body_acc_jerk_mag_mean" 
		"avg_time_body_acc_jerk_mag_std" 

		"avg_time_body_gyro_mag_mean" 
		"avg_time_body_gyro_mag_std" 

		"avg_time_body_gyro_jerk_mag_mean" 
		"avg_time_body_gyro_jerk_mag_std" 

		"avg_freq_body_acc_mean_x" 
		"avg_freq_body_acc_mean_y" 
		"avg_freq_body_acc_mean_z" 

		"avg_freq_body_acc_std_x" 
		"avg_freq_body_acc_std_y" 
		"avg_freq_body_acc_std_z" 

		"avg_freq_body_acc_jerk_mean_x" 
		"avg_freq_body_acc_jerk_mean_y" 
		"avg_freq_body_acc_jerk_mean_z" 

		"avg_freq_body_acc_jerk_std_x" 
		"avg_freq_body_acc_jerk_std_y" 
		"avg_freq_body_acc_jerk_std_z" 

		"avg_freq_body_gyro_mean_x" 
		"avg_freq_body_gyro_mean_y" 
		"avg_freq_body_gyro_mean_z" 

		"avg_freq_body_gyro_std_x" 
		"avg_freq_body_gyro_std_y" 
		"avg_freq_body_gyro_std_z" 

		"avg_freq_body_acc_mag_mean" 
		"avg_freq_body_acc_mag_std" 

		"avg_freq_body_body_acc_jerk_mag_mean" 
		"avg_freq_body_body_acc_jerk_mag_std" 

		"avg_freq_body_body_gyro_mag_mean" 
		"avg_freq_body_body_gyro_mag_std" 

		"avg_freq_body_body_gyro_jerk_mag_mean" 
		"avg_freq_body_body_gyro_jerk_mag_std"







***********Summary from Original Work:

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.