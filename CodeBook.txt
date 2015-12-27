CodeBook for the tidy dataset

Data source

This dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" which was originally made avaiable here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Feature Selection 

I refer you to the README and features.txt files in the original dataset to learn more about the feature selection for this dataset. And there you will find the follow description:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

The reasoning behind my selection of features is that the assignment explicitly states "Extracts only the measurements on the mean and standard deviation for each measurement." To be complete, I included all variables having to do with mean or standard deviation.

In short, for this derived dataset, these signals were used to estimate variables of the feature vector for each pattern:
 '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

"activity"                                       "timeBodyAccelerometer-mean()-X"                
"timeBodyAccelerometer-mean()-Y"                 "timeBodyAccelerometer-mean()-Z"                
"timeBodyAccelerometer-std()-X"                  "timeBodyAccelerometer-std()-Y"                 
"timeBodyAccelerometer-std()-Z"                  "timeGravityAccelerometer-mean()-X"             
"timeGravityAccelerometer-mean()-Y"              "timeGravityAccelerometer-mean()-Z"             
"timeGravityAccelerometer-std()-X"               "timeGravityAccelerometer-std()-Y"              
"timeGravityAccelerometer-std()-Z"               "timeBodyAccelerometerJerk-mean()-X"            
"timeBodyAccelerometerJerk-mean()-Y"             "timeBodyAccelerometerJerk-mean()-Z"            
"timeBodyAccelerometerJerk-std()-X"              "timeBodyAccelerometerJerk-std()-Y"             
"timeBodyAccelerometerJerk-std()-Z"              "timeBodyGyroscope-mean()-X"                    
"timeBodyGyroscope-mean()-Y"                     "timeBodyGyroscope-mean()-Z"                    
"timeBodyGyroscope-std()-X"                      "timeBodyGyroscope-std()-Y"                     
"timeBodyGyroscope-std()-Z"                      "timeBodyGyroscopeJerk-mean()-X"                
"timeBodyGyroscopeJerk-mean()-Y"                 "timeBodyGyroscopeJerk-mean()-Z"                
"timeBodyGyroscopeJerk-std()-X"                  "timeBodyGyroscopeJerk-std()-Y"                 
"timeBodyGyroscopeJerk-std()-Z"                  "timeBodyAccelerometerMagnitude-mean()"         
"timeBodyAccelerometerMagnitude-std()"           "timeGravityAccelerometerMagnitude-mean()"      
"timeGravityAccelerometerMagnitude-std()"        "timeBodyAccelerometerJerkMagnitude-mean()"     
"timeBodyAccelerometerJerkMagnitude-std()"       "timeBodyGyroscopeMagnitude-mean()"             
"timeBodyGyroscopeMagnitude-std()"               "timeBodyGyroscopeJerkMagnitude-mean()"         
"timeBodyGyroscopeJerkMagnitude-std()"           "frequencyBodyAccelerometer-mean()-X"           
"frequencyBodyAccelerometer-mean()-Y"            "frequencyBodyAccelerometer-mean()-Z"           
"frequencyBodyAccelerometer-std()-X"             "frequencyBodyAccelerometer-std()-Y"            
"frequencyBodyAccelerometer-std()-Z"             "frequencyBodyAccelerometerJerk-mean()-X"       
"frequencyBodyAccelerometerJerk-mean()-Y"        "frequencyBodyAccelerometerJerk-mean()-Z"       
"frequencyBodyAccelerometerJerk-std()-X"         "frequencyBodyAccelerometerJerk-std()-Y"        
"frequencyBodyAccelerometerJerk-std()-Z"         "frequencyBodyGyroscope-mean()-X"               
"frequencyBodyGyroscope-mean()-Y"                "frequencyBodyGyroscope-mean()-Z"               
"frequencyBodyGyroscope-std()-X"                 "frequencyBodyGyroscope-std()-Y"                
"frequencyBodyGyroscope-std()-Z"                 "frequencyBodyAccelerometerMagnitude-mean()"    
"frequencyBodyAccelerometerMagnitude-std()"      "frequencyBodyAccelerometerJerkMagnitude-mean()"
"frequencyBodyAccelerometerJerkMagnitude-std()"  "frequencyBodyGyroscopeMagnitude-mean()"        
"frequencyBodyGyroscopeMagnitude-std()"          "frequencyBodyGyroscopeJerkMagnitude-mean()"    
"frequencyBodyGyroscopeJerkMagnitude-std()"      "subject"                                       
"activityType"                                  

The set of variables that were estimated (and kept for this assignment) from these signals are: 
瀕ean(): Mean value
不td(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
蛭ravityMean
付imeBodyAccMean
付imeBodyAccJerkMean
付imeBodyGyroMean
付imeBodyGyroscopeJerkMean

Other estimates have been removed for the purpose of this excercise.

Note: features are normalized and bounded within [-1,1].

The resulting variable names are of the following form: tbodyaccmeanx, which means the mean value of tBodyAcc-XYZ.
