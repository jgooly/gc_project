# Code Book

## Description of Features:
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

A Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccJerkMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are:
mean(): Mean value
std(): Standard deviation
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
angle(): Angle between to vectors.


Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available below:

subject
activity
mean-tBodyAcc-mean()-X
mean-tBodyAcc-mean()-Y
mean-tBodyAcc-mean()-Z
mean-tBodyAcc-std()-X
mean-tBodyAcc-std()-Y
mean-tBodyAcc-std()-Z
mean-tGravityAcc-mean()-X
mean-tGravityAcc-mean()-Y
mean-tGravityAcc-mean()-Z
mean-tGravityAcc-std()-X
mean-tGravityAcc-std()-Y
mean-tGravityAcc-std()-Z
mean-tBodyAccJerk-mean()-X
mean-tBodyAccJerk-mean()-Y
mean-tBodyAccJerk-mean()-Z
mean-tBodyAccJerk-std()-X
mean-tBodyAccJerk-std()-Y
mean-tBodyAccJerk-std()-Z
mean-tBodyGyro-mean()-X
mean-tBodyGyro-mean()-Y
mean-tBodyGyro-mean()-Z
mean-tBodyGyro-std()-X
mean-tBodyGyro-std()-Y
mean-tBodyGyro-std()-Z
mean-tBodyGyroJerk-mean()-X
mean-tBodyGyroJerk-mean()-Y
mean-tBodyGyroJerk-mean()-Z
mean-tBodyGyroJerk-std()-X
mean-tBodyGyroJerk-std()-Y
mean-tBodyGyroJerk-std()-Z
mean-tBodyAccMag-mean()
mean-tBodyAccMag-std()
mean-tGravityAccMag-mean()
mean-tGravityAccMag-std()
mean-tBodyAccJerkMag-mean()
mean-tBodyAccJerkMag-std()
mean-tBodyGyroMag-mean()
mean-tBodyGyroMag-std()
mean-tBodyGyroJerkMag-mean()
mean-tBodyGyroJerkMag-std()
mean-fBodyAcc-mean()-X
mean-fBodyAcc-mean()-Y
mean-fBodyAcc-mean()-Z
mean-fBodyAcc-std()-X
mean-fBodyAcc-std()-Y
mean-fBodyAcc-std()-Z
mean-fBodyAcc-meanFreq()-X
mean-fBodyAcc-meanFreq()-Y
mean-fBodyAcc-meanFreq()-Z
mean-fBodyAccJerk-mean()-X
mean-fBodyAccJerk-mean()-Y
mean-fBodyAccJerk-mean()-Z
mean-fBodyAccJerk-std()-X
mean-fBodyAccJerk-std()-Y
mean-fBodyAccJerk-std()-Z
mean-fBodyAccJerk-meanFreq()-X
mean-fBodyAccJerk-meanFreq()-Y
mean-fBodyAccJerk-meanFreq()-Z
mean-fBodyGyro-mean()-X
mean-fBodyGyro-mean()-Y
mean-fBodyGyro-mean()-Z
mean-fBodyGyro-std()-X
mean-fBodyGyro-std()-Y
mean-fBodyGyro-std()-Z
mean-fBodyGyro-meanFreq()-X
mean-fBodyGyro-meanFreq()-Y
mean-fBodyGyro-meanFreq()-Z
mean-fBodyAccMag-mean()
mean-fBodyAccMag-std()
mean-fBodyAccMag-meanFreq()
mean-fBodyBodyAccJerkMag-mean()
mean-fBodyBodyAccJerkMag-std()
mean-fBodyBodyAccJerkMag-meanFreq()
mean-fBodyBodyGyroMag-mean()
mean-fBodyBodyGyroMag-std()
mean-fBodyBodyGyroMag-meanFreq()
mean-fBodyBodyGyroJerkMag-mean()
mean-fBodyBodyGyroJerkMag-std()
mean-fBodyBodyGyroJerkMag-meanFreq()
mean-angle(tBodyAccMean,gravity)
mean-angle(tBodyAccJerkMean),gravityMean)
mean-angle(tBodyGyroMean,gravityMean)
mean-angle(tBodyGyroJerkMean,gravityMean)
mean-angle(X,gravityMean)
mean-angle(Y,gravityMean)
mean-angle(Z,gravityMean)