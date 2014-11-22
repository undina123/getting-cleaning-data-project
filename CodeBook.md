
# Code Book

### Raw data collection
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.
The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the 
volunteers was selected for generating the training data and 30% the test data. 


The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec 
and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a
Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, 
therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from 
the time and frequency domain. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals. These time domain signals were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another 
low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional 
signals were calculated using the Euclidean norm. 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing. 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals included
mean(): Mean value
std(): Standard deviation 

No unit of measures is reported as all features were normalized and bounded within [-1,1].

### Data transformation

The raw data sets are processed with run_analisys.R script to create a tidy data set
Test and training data, subject ids and activity ids were merged to obtain a single data set. Variables are labelled with the names assigned by original collectors
From the merged data  only the values of estimated mean (variables with labels that contain "mean") and standard deviation (variables with labels that contain "std") are extracted.
Then a tidy data is created where numeric variables are averaged for each activity and each subject.

### Variable names
The tidy data set contains 68 variables divided in:

  * an activity label (Activity): WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
  * an identifier of the subject who carried out the experiment (Subject): 1, .., 30
  * a 66-feature vector with time and frequency domain signal variables (numeric)

Labels given from the original data were changed to obtain more descriptive labels, in particula capital letters were changed to lower letters.
The following table relates the 17 signals to the names used as prefix for the variables names present in the data set. ".XYZ" denotes three variables, one for each axis.
For variables derived from mean and standard deviation estimation, the labels are supplied with the terms "-mean()-" or "-std()".

| **Name**                                           | **Time domain**                  | **Frequency domain**                                    |
|----------------------------------------------------|----------------------------------|---------------------------------------------------------|
| Body   Acceleration                                | time-body-accelerometer-xyz      | frequency-domain-signals-body-accelerometer-mean-xyz    |
| Gravity   Acceleration                             | time-gravity-accelerometer-xyz   |                                                         |
| Body   Acceleration Jerk Signals                   | time-body-accelerometer-jerk-xyz | frequency-domain-signals-body-accelerometer-jerk-xyz    |
| Body   Angular Speed from Gyroscope                | time-body-gyroscope-xyz          | frequency-domain-signals-body-gyroscope-xyz             |
| Body   Angular Speed Jerk Signal from Gyroscope    | time-body-gyroscope-jerk-xyz     |                                                         |
| Body   Acceleration Magnitude                      | time-body-accelerometer-mag      | frequency-domain-signals-body-accelerometer-mag         |
| Gravity   Acceleration Magnitude                   | time-gravity-accelerometer-mag   |                                                         |
| Body   Acceleration Jerk Magnitude                 | time-body-accelerometer-jerkmag  | frequency-domain-signals-bodybody-accelerometer-jerkmag |
| Body   Angular Speed Magnitude from Gyroscope      | time-body-gyroscope-mag          | frequency-domain-signals-bodybody-gyroscope-mag         |
| Body   Angular Speed Jerk Magnitude from Gyroscope | time-body-gyroscope-jerkmag      | frequency-domain-signals-bodybody-gyroscope-jerkmag     |