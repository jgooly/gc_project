# Project description:
The data from the original experiment (below) was used to calculate the mean of select features grouped by the subject of the experiment and the activity of said subject. 


## Original data and experiment:
Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

## Original description of experiment:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

## For each record it is provided:
* The Subject identifier of the experiment (1 of 30 volunteers).
* The Activity (1 of 6).
* The mean of all features that included a calculation using either the mean or standard deviation (86 vectors).

### The dataset includes the following files:

1. 'README.md'

2. 'Codebook.md'

3. 'features_info.txt': Shows information about the variables used on the feature vector.

4. 'features.txt': List of all features.

5. 'activity_labels.txt': Links the class labels with their activity name.

6. 'train/X_train.txt': Training set.

7. 'train/y_train.txt': Training labels.

8. 'test/X_test.txt': Test set.

9. 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

10. 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

The following file contains the script and results for this analysis.

11. 'Analysis.R': R code that is used to achieve the tidy data and results.

## Process and Analysis
Packages used: Plyr, Reshape2
The original zip file contain files 3-10 were unzipped and placed in the working directory. Files 3 - 10 were read into R using the read.table function with their relative position in the directory. Files X_train.txt, Y_train.txt, X_test.txt and Y_test.txt used regular expressions to select feature variables that either included a mean or standard deviation calculation. Subjects were added to the 'x' train and test data frames and 'y' train and test data frames independently using cbind(). From here, data frames were stacked on each other using rbind(). The merge() is used to match the activity labels with the activity description. The activity labels variable is then removed from the data frame. In preporation for the calculation on the feature variables, all feature variables names are stored in a list. The melt() is used to create a long data frame that groups the data by subject and activity. The dcast() is used to cast the long data frame into a wide format by subject and activity while also calculating the mean of each feature variable for each subject/activity combination. The resulting data frame 'tidy.data2' is returned at the end of the script. 

To read this file into R, use 'read.table('tidy_data_2.txt', header = TRUE)'

### Notes:

For more information about this dataset contact: activityrecognition@smartlab.ws

### License:

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.