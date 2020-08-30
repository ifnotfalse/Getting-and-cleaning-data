Codebook
================
Colin
2020/8/29

## Transformations

A couple of transformations are applied upon the original datasets (for
access check the README.md).

### 1\. Data merging

The original datasets are divided into test and train datasets. Each
further includes three datasets: X dataset with values; y and subject
dataset indicating the activity and subject from which the values are
obtained.

The train and test datasets are first merger separately with y and
subject variables renamed “activity” and “subject”. Then a new variable
“subsets” is created to indicate wheather the observation comes from
the test or train sets. Finally, the test and train sets are merged
using rowbinding.

### 2\. Renaming variables

The original data sets include activity\_labels.txt and features.txt.
These two documents provide reference to activity and variables
identification.

Activity is renamed descriptively by factoring the column and assigning
the levels from the dataframe “Labels” (created by reading
inactivity\_labels.txt).

Other variables are renamed by retrieving the descriptive names from the
dataframe features (created from features.txt). In addition, “()” is
removed from variable names and “-” is replaced with "\_" to avoid
troubles in subsequent steps where R might have problem identifying
“mean()” and “-” as simple character or operation.

### 3\. Data subsetting and summarising

The merged and renamed dataset is then subsetted to keep only measures
of mean and stand deviation. Following that, the observations are
averaged across activities and subjects.

## The variables

In the dataset rows are denoted by integers 1 to 6. The correspondence
is as follows:

  - 1 WALKING  
  - 2 WALKING\_UPSTAIRS  
  - 3 WALKING\_DOWNSTAIRS  
  - 4 SITTING  
  - 5 STANDING  
  - 6 LAYING

Apart from that, the column variable names can be divided into three
parts: features, function (mean or std), and subjects. For example, the
variable name “tBodyAcc\_mean\_X.1” means the “mean” of the feature
“tBodyAcc” in dimension “X” for subject 1.

There are 30 subjects, 2 functions (mean & std) and 33 features, which
multiply to be 1980 variables.

### Subjects

Indicating from which subject the data is obtained. There are altogether
30 subjects denoted with integer 1 to 30.

### Functions

This indicates from which function the set of variables were estimated
from row signals: mean: Mean value std: Standard deviation

### Features (including dimesion indicated by “X/Y/Z”)

The features selected for this database come from the accelerometer and
gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain
signals (prefix ‘t’ to denote time) were captured at a constant rate of
50 Hz. Then they were filtered using a median filter and a 3rd order low
pass Butterworth filter with a corner frequency of 20 Hz to remove
noise. Similarly, the acceleration signal was then separated into body
and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ)
using another low pass Butterworth filter with a corner frequency of 0.3
Hz.

Subsequently, the body linear acceleration and angular velocity were
derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and
tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional
signals were calculated using the Euclidean norm (tBodyAccMag,
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these
signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ,
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the ‘f’ to
indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for
each pattern:  
‘-XYZ’ is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ tGravityAcc-XYZ tBodyAccJerk-XYZ tBodyGyro-XYZ
tBodyGyroJerk-XYZ tBodyAccMag tGravityAccMag tBodyAccJerkMag
tBodyGyroMag tBodyGyroJerkMag fBodyAcc-XYZ fBodyAccJerk-XYZ
fBodyGyro-XYZ fBodyAccMag fBodyAccJerkMag fBodyGyroMag fBodyGyroJerkMag
