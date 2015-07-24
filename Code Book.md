#Code Book

## Overview

30 volunteers performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 


**run_analysis** analyzes and summarizes the mean and standard deviation from various measurements collected from  the accelerometers from the Samsung Galaxy S smartphone. 

The resulting dataset is 180 rows of observations, in tidy wide format. 

Of the original 561 measurements, only 66 measurements that reflect the mean and standard deviation were extracted. For each of thse 66 measurements, the average was then calculated for each subject (30), for each activty (6), resulting in a dataset with 180 rows, and 68 columns.

Each row includes one activity per subject, and the average for each measurement. 

