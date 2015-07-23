# run_analysis.R
*Course Project for Getting and Cleaning Data*  
*July 21, 2015*  
  


## Overview

30 volunteers performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.  

**run_analysis** analyzes and summarizes the mean and standard deviation data from various measurements collected from  the accelerometers from the Samsung Galaxy S smartphone. 

### Step 0
**Download Files**
 
1. Set up working directory.  
2. Create folder if necessary.  
3. Download and unzip files.  
4. Remove zipped file when done.  


### Step 1
**Read and merge data**   
 
1. The subject file, activity file, and details file are merged for test data. 
2. The subject file, activity file, and details file are merged for train data. 
3. Both sets of data are combined into one data file.

### Step 2
**Label dataset with descriptive names**  
*(I chose to do this step first, even though the instructions asked for this later. This way, I was able to use these labels to extract only the necessary columns, in the next step.)*

1. Retrieve the identifiying features from the given text file.
2. Apply them as column names to the dataset.

### Step 3
**Retrieve only measurements with mean and std in them**  

1. Search for column names with "mean()" and "std" in them.
2. Extract all those columns.

### Step 4
**Use descriptve names for activities instead of numbers**  

1. Retrieve activity names from the given text file.
2. Transform the numbers into factors, using these names as factor labels.

### Step 5
**Create tidy data with average of each variable for each subject and activity**  

Create a loop that does the following:

1. Extract each subject's data.
2. For each subject, "melt" then "cast" each variable according to Activity.
3. Get the mean for each of those variables.
4. Add the subject number to each dataset.
5. Save this dataset in a temp variable.
6. Combine the resulting dataset with the previous dataset (stored in temp - empty for the first one.) 

Repeat for next subject.

7. Save the object so that it can be retrieved after the function.  (Extra step,but it's handy to have as reference.)
9. Write the data to a text file.