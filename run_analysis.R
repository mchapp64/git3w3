## The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48
## years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS,
## SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its
## embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial
## angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label
## the data manually. The obtained dataset has been randomly partitioned into two sets, where 70%
## of the volunteers was selected for generating the training data and 30% the test data.

## You should create one R script called run_analysis.R that does the following. 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. Creates a second, independent tidy data set with the average of each variable for each 
##    activity and each subject. 

## adding the plyr library for grouping averages later on

library("plyr")


## Read in the text files

test_s <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
test_x <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
test_y <- read.table("./UCI HAR Dataset/test/Y_test.txt", header = FALSE)
train_s <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
train_x <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
train_y <- read.table("./UCI HAR Dataset/train/Y_train.txt", header = FALSE)

## add column names

column_names <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)
col_vec <- column_names$V2

col_vec_clean <- gsub("\\(","",col_vec)
col_vec_clean <- gsub(")","",col_vec_clean)
col_vec_clean <- gsub("-","_",col_vec_clean)
col_vec_clean <- gsub("Body","body_",col_vec_clean)
col_vec_clean <- gsub("Acc","acc",col_vec_clean)
col_vec_clean <- gsub("Jerk","_jerk",col_vec_clean)
col_vec_clean <- sub("^t","time_",col_vec_clean)
col_vec_clean <- sub("^f","freq_",col_vec_clean)
col_vec_clean <- gsub("Gyro","gyro",col_vec_clean)
col_vec_clean <- gsub("Gravity","gravity_",col_vec_clean)
col_vec_clean <- gsub("Mag","_mag",col_vec_clean)
col_vec_clean <- gsub("X","x",col_vec_clean)
col_vec_clean <- gsub("Y","y",col_vec_clean)
col_vec_clean <- gsub("Z","z",col_vec_clean)

colnames(test_s) <- "volunteer_id"
colnames(train_s) <- "volunteer_id"
colnames(test_y) <- "activity_id"
colnames(train_y) <- "activity_id"
colnames(test_x) <- col_vec_clean
colnames(train_x) <- col_vec_clean

## making the mega table

test <- cbind(test_s, test_y, test_x)
train <- cbind(train_s, train_y, train_x)
mega_pre <- rbind(test, train)

## Replacing the activity_id's with the actual activity name

activities <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)
colnames(activities) <- c("activity_id", "activity")
mega_merge <- suppressWarnings(merge(mega_pre, activities, by.x = "activity_id", by.y = "activity_id", all.x = TRUE))
mega <- mega_merge[,c(2,564,(3:563))]

## Subsetting down to only volunteer_id, activity, and columns with "mean" or "std"

neat <- sort.int(c(1,2,grep("_mean_",names(mega)),grep("_mean$",names(mega)),grep("std",names(mega))))
mega_clean <- mega[neat]

## making it look nice by sorting by volunteer and activity

mega_clean_ordered <- mega_clean[order(mega_clean$volunteer_id,mega_clean$activity),]


## Using ddply to cycle through my columns

mega_tidy <- ddply(mega_clean_ordered,c("volunteer_id","activity"), summarize,
	avg_time_body_acc_mean_x = mean(time_body_acc_mean_x),
	avg_time_body_acc_mean_y = mean(time_body_acc_mean_y),
	avg_time_body_acc_mean_z = mean(time_body_acc_mean_z),
	avg_time_body_acc_std_x = mean(time_body_acc_std_x),
	avg_time_body_acc_std_y = mean(time_body_acc_std_y),
	avg_time_body_acc_std_z = mean(time_body_acc_std_z),
	avg_time_gravity_acc_mean_x = mean(time_gravity_acc_mean_x),
	avg_time_gravity_acc_mean_y = mean(time_gravity_acc_mean_y),
	avg_time_gravity_acc_mean_z = mean(time_gravity_acc_mean_z),
	avg_time_gravity_acc_std_x = mean(time_gravity_acc_std_x),
	avg_time_gravity_acc_std_y = mean(time_gravity_acc_std_y),
	avg_time_gravity_acc_std_z = mean(time_gravity_acc_std_z),
	avg_time_body_acc_jerk_mean_x = mean(time_body_acc_jerk_mean_x),
	avg_time_body_acc_jerk_mean_y = mean(time_body_acc_jerk_mean_y),
	avg_time_body_acc_jerk_mean_z = mean(time_body_acc_jerk_mean_z),
	avg_time_body_acc_jerk_std_x = mean(time_body_acc_jerk_std_x),
	avg_time_body_acc_jerk_std_y = mean(time_body_acc_jerk_std_y),
	avg_time_body_acc_jerk_std_z = mean(time_body_acc_jerk_std_z),
	avg_time_body_gyro_mean_x = mean(time_body_gyro_mean_x),
	avg_time_body_gyro_mean_y = mean(time_body_gyro_mean_y),
	avg_time_body_gyro_mean_z = mean(time_body_gyro_mean_z),
	avg_time_body_gyro_std_x = mean(time_body_gyro_std_x),
	avg_time_body_gyro_std_y = mean(time_body_gyro_std_y),
	avg_time_body_gyro_std_z = mean(time_body_gyro_std_z),
	avg_time_body_gyro_jerk_mean_x = mean(time_body_gyro_jerk_mean_x),
	avg_time_body_gyro_jerk_mean_y = mean(time_body_gyro_jerk_mean_y),
	avg_time_body_gyro_jerk_mean_z = mean(time_body_gyro_jerk_mean_z),
	avg_time_body_gyro_jerk_std_x = mean(time_body_gyro_jerk_std_x),
	avg_time_body_gyro_jerk_std_y = mean(time_body_gyro_jerk_std_y),
	avg_time_body_gyro_jerk_std_z = mean(time_body_gyro_jerk_std_z),
	avg_time_body_acc_mag_mean = mean(time_body_acc_mag_mean),
	avg_time_body_acc_mag_std = mean(time_body_acc_mag_std),
	avg_time_gravity_acc_mag_mean = mean(time_gravity_acc_mag_mean),
	avg_time_gravity_acc_mag_std = mean(time_gravity_acc_mag_std),
	avg_time_body_acc_jerk_mag_mean = mean(time_body_acc_jerk_mag_mean),
	avg_time_body_acc_jerk_mag_std = mean(time_body_acc_jerk_mag_std),
	avg_time_body_gyro_mag_mean = mean(time_body_gyro_mag_mean),
	avg_time_body_gyro_mag_std = mean(time_body_gyro_mag_std),
	avg_time_body_gyro_jerk_mag_mean = mean(time_body_gyro_jerk_mag_mean),
	avg_time_body_gyro_jerk_mag_std = mean(time_body_gyro_jerk_mag_std),
	avg_freq_body_acc_mean_x = mean(freq_body_acc_mean_x),
	avg_freq_body_acc_mean_y = mean(freq_body_acc_mean_y),
	avg_freq_body_acc_mean_z = mean(freq_body_acc_mean_z),
	avg_freq_body_acc_std_x = mean(freq_body_acc_std_x),
	avg_freq_body_acc_std_y = mean(freq_body_acc_std_y),
	avg_freq_body_acc_std_z = mean(freq_body_acc_std_z),
	avg_freq_body_acc_jerk_mean_x = mean(freq_body_acc_jerk_mean_x),
	avg_freq_body_acc_jerk_mean_y = mean(freq_body_acc_jerk_mean_y),
	avg_freq_body_acc_jerk_mean_z = mean(freq_body_acc_jerk_mean_z),
	avg_freq_body_acc_jerk_std_x = mean(freq_body_acc_jerk_std_x),
	avg_freq_body_acc_jerk_std_y = mean(freq_body_acc_jerk_std_y),
	avg_freq_body_acc_jerk_std_z = mean(freq_body_acc_jerk_std_z),
	avg_freq_body_gyro_mean_x = mean(freq_body_gyro_mean_x),
	avg_freq_body_gyro_mean_y = mean(freq_body_gyro_mean_y),
	avg_freq_body_gyro_mean_z = mean(freq_body_gyro_mean_z),
	avg_freq_body_gyro_std_x = mean(freq_body_gyro_std_x),
	avg_freq_body_gyro_std_y = mean(freq_body_gyro_std_y),
	avg_freq_body_gyro_std_z = mean(freq_body_gyro_std_z),
	avg_freq_body_acc_mag_mean = mean(freq_body_acc_mag_mean),
	avg_freq_body_acc_mag_std = mean(freq_body_acc_mag_std),
	avg_freq_body_body_acc_jerk_mag_mean = mean(freq_body_body_acc_jerk_mag_mean),
	avg_freq_body_body_acc_jerk_mag_std = mean(freq_body_body_acc_jerk_mag_std),
	avg_freq_body_body_gyro_mag_mean = mean(freq_body_body_gyro_mag_mean),
	avg_freq_body_body_gyro_mag_std = mean(freq_body_body_gyro_mag_std),
	avg_freq_body_body_gyro_jerk_mag_mean = mean(freq_body_body_gyro_jerk_mag_mean),
	avg_freq_body_body_gyro_jerk_mag_std = mean(freq_body_body_gyro_jerk_mag_std))
	

print(mega_tidy)	
