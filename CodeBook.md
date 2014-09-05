CodeBook 
=================

The features selected for the input database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals and extracted for this tidy project include measurements only for: 

* mean(): Mean value
* std(): Standard deviation

The averages for these variables are calculated grouped by subject and activity.  The tidy data set will include the descriptive activity names rather than only the activity code.  The variable names are appropriately renamed by replacing trailing "()" with blank and "()-" replace with ".".

Variables for the tidy data set are:

* subject
* act.code
* activity
* avg.tBodyAcc.mean.X
* avg.tBodyAcc.mean.Y
* avg.tBodyAcc.mean.Z
* avg.tBodyAcc.std.X
* avg.tBodyAcc.std.Y
* avg.tBodyAcc.std.Z
* avg.tGravityAcc.mean.X
* avg.tGravityAcc.mean.Y
* avg.tGravityAcc.mean.Z
* avg.tGravityAcc.std.X
* avg.tGravityAcc.std.Y
* avg.tGravityAcc.std.Z
* avg.tBodyAccJerk.mean.X
* avg.tBodyAccJerk.mean.Y
* avg.tBodyAccJerk.mean.Z
* avg.tBodyAccJerk.std.X
* avg.tBodyAccJerk.std.Y
* avg.tBodyAccJerk.std.Z
* avg.tBodyGyro.mean.X
* avg.tBodyGyro.mean.Y
* avg.tBodyGyro.mean.Z
* avg.tBodyGyro.std.X
* avg.tBodyGyro.std.Y
* avg.tBodyGyro.std.Z
* avg.tBodyGyroJerk.mean.X
* avg.tBodyGyroJerk.mean.Y
* avg.tBodyGyroJerk.mean.Z
* avg.tBodyGyroJerk.std.X
* avg.tBodyGyroJerk.std.Y
* avg.tBodyGyroJerk.std.Z
* avg.tBodyAccMag.mean
* avg.tBodyAccMag.std
* avg.tGravityAccMag.mean
* avg.tGravityAccMag.std
* avg.tBodyAccJerkMag.mean
* avg.tBodyAccJerkMag.std
* avg.tBodyGyroMag.mean
* avg.tBodyGyroMag.std
* avg.tBodyGyroJerkMag.mean
* avg.tBodyGyroJerkMag.std
* avg.fBodyAcc.mean.X
* avg.fBodyAcc.mean.Y
* avg.fBodyAcc.mean.Z
* avg.fBodyAcc.std.X
* avg.fBodyAcc.std.Y
* avg.fBodyAcc.std.Z
* avg.fBodyAccJerk.mean.X
* avg.fBodyAccJerk.mean.Y
* avg.fBodyAccJerk.mean.Z
* avg.fBodyAccJerk.std.X
* avg.fBodyAccJerk.std.Y
* avg.fBodyAccJerk.std.Z
* avg.fBodyGyro.mean.X
* avg.fBodyGyro.mean.Y
* avg.fBodyGyro.mean.Z
* avg.fBodyGyro.std.X
* avg.fBodyGyro.std.Y
* avg.fBodyGyro.std.Z
* avg.fBodyAccMag.mean
* avg.fBodyAccMag.std
* avg.fBodyBodyAccJerkMag.mean
* avg.fBodyBodyAccJerkMag.std
* avg.fBodyBodyGyroMag.mean
* avg.fBodyBodyGyroMag.std
* avg.fBodyBodyGyroJerkMag.mean
* avg.fBodyBodyGyroJerkMag.std

