Feature Selection
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyA

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are:

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values.
iqr(): Interquartile range
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal
kurtosis(): kurtosis of the frequency domain signal
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

Column Name|Variable Name|Value/Explanation
---|---|---
Subject|Subject|The subject who performed the activity for each window sample. Its range is from 1 to 30.
Activity|Activity|The activity the subject was performing during analysis. Value will be one of: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
Measurement1|tBodyAcc-mean()-X|
Measurement2|tBodyAcc-mean()-Y|
Measurement3|tBodyAcc-mean()-Z|
Measurement4|tBodyAcc-std()-X|
Measurement5|tBodyAcc-std()-Y|
Measurement6|tBodyAcc-std()-Z|
Measurement513|fBodyAccMag-meanFreq()|
Measurement526|fBodyBodyAccJerkMag-meanFreq()|
Measurement529|fBodyBodyGyroMag-mean()|
Measurement530|fBodyBodyGyroMag-std()|
Measurement516|fBodyBodyAccJerkMag-mean()|
Measurement539|fBodyBodyGyroMag-meanFreq()|
Measurement542|fBodyBodyGyroJerkMag-mean()|
Measurement517|fBodyBodyAccJerkMag-std()|
Measurement552|fBodyBodyGyroJerkMag-meanFreq()|
Measurement41|tGravityAcc-mean()-X|
Measurement42|tGravityAcc-mean()-Y|
Measurement43|tGravityAcc-mean()-Z|
Measurement44|tGravityAcc-std()-X|
Measurement557|angle(tBodyGyroMean,gravityMean)|
Measurement558|angle(tBodyGyroJerkMean,gravityMean)|
Measurement559|angle(X,gravityMean)|
Measurement560|angle(Y,gravityMean)|
Measurement561|angle(Z,gravityMean)|
Measurement81|tBodyAccJerk-mean()-X|
Measurement82|tBodyAccJerk-mean()-Y|
Measurement83|tBodyAccJerk-mean()-Z|
Measurement84|tBodyAccJerk-std()-X|
Measurement85|tBodyAccJerk-std()-Y|
Measurement86|tBodyAccJerk-std()-Z|
Measurement121|tBodyGyro-mean()-X|
Measurement122|tBodyGyro-mean()-Y|
Measurement123|tBodyGyro-mean()-Z|
Measurement124|tBodyGyro-std()-X|
Measurement125|tBodyGyro-std()-Y|
Measurement126|tBodyGyro-std()-Z|
Measurement161|tBodyGyroJerk-mean()-X|
Measurement162|tBodyGyroJerk-mean()-Y|
Measurement163|tBodyGyroJerk-mean()-Z|
Measurement164|tBodyGyroJerk-std()-X|
Measurement165|tBodyGyroJerk-std()-Y|
Measurement166|tBodyGyroJerk-std()-Z|
Measurement543|fBodyBodyGyroJerkMag-std()|
Measurement201|tBodyAccMag-mean()|
Measurement202|tBodyAccMag-std()|
Measurement214|tGravityAccMag-mean()|
Measurement215|tGravityAccMag-std()|
Measurement227|tBodyAccJerkMag-mean()|
Measurement228|tBodyAccJerkMag-std()|
Measurement240|tBodyGyroMag-mean()|
Measurement241|tBodyGyroMag-std()|
Measurement253|tBodyGyroJerkMag-mean()|
Measurement254|tBodyGyroJerkMag-std()|
Measurement555|angle(tBodyAccMean,gravity)|
Measurement556|angle(tBodyAccJerkMean),gravityMean)|
Measurement266|fBodyAcc-mean()-X|
Measurement267|fBodyAcc-mean()-Y|
Measurement268|fBodyAcc-mean()-Z|
Measurement269|fBodyAcc-std()-X|
Measurement270|fBodyAcc-std()-Y|
Measurement271|fBodyAcc-std()-Z|
Measurement46|tGravityAcc-std()-Z|
Measurement294|fBodyAcc-meanFreq()-X|
Measurement295|fBodyAcc-meanFreq()-Y|
Measurement296|fBodyAcc-meanFreq()-Z|
Measurement45|tGravityAcc-std()-Y|
Measurement345|fBodyAccJerk-mean()-X|
Measurement346|fBodyAccJerk-mean()-Y|
Measurement347|fBodyAccJerk-mean()-Z|
Measurement348|fBodyAccJerk-std()-X|
Measurement349|fBodyAccJerk-std()-Y|
Measurement350|fBodyAccJerk-std()-Z|
Measurement373|fBodyAccJerk-meanFreq()-X|
Measurement374|fBodyAccJerk-meanFreq()-Y|
Measurement375|fBodyAccJerk-meanFreq()-Z|
Measurement424|fBodyGyro-mean()-X|
Measurement425|fBodyGyro-mean()-Y|
Measurement426|fBodyGyro-mean()-Z|
Measurement427|fBodyGyro-std()-X|
Measurement428|fBodyGyro-std()-Y|
Measurement429|fBodyGyro-std()-Z|
Measurement452|fBodyGyro-meanFreq()-X|
Measurement453|fBodyGyro-meanFreq()-Y|
Measurement454|fBodyGyro-meanFreq()-Z|
Measurement503|fBodyAccMag-mean()|
Measurement504|fBodyAccMag-std()|
