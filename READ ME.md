# run_analysis.R
*Course Project for Getting and Cleaning Data*  
*July 21, 2015*  
  

**Please note that you must have the *dplyr* package installed in order to run this script!**

 
**run_analysis** analyzes and summarizes the mean and standard deviation from various measurements collected from  the accelerometers from the Samsung Galaxy S smartphone. 

The resulting dataset is 180 rows of observations, in tidy wide format. 

Of the original 561 measurements, only 66 measurements that reflect the mean and standard deviation were extracted. For each of thse 66 measurements, the average was then calculated for each subject (30), for each activty (6), resulting in a dataset with 180 rows, and 68 columns.

Each row includes one activity per subject, and the average for each measurement. 

Below, is the process that the script follows. To invoke the script, simply type run_analysis() at the prompt. 

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
**Retrieve only measurements with mean and std in them**  

1. Retrieve the identifiying feature labels from the given text file 
2. Assign them to character vector called "labels." Add on "Subject" and "Activity".
3. Apply those labels as column names to the dataset. 
4. Search for column names with "mean()" and "std" in them. Save them to an integer vector (called pos), where each number denotes column number we wish to extract.
5. "labels" is then reassigned to become a vector of only those positions that were returned.
6. Those column positions are then extracted -- resulting in only 68 columns.




### Step 3
**Use descriptive names for activities instead of numbers**  

1. Retrieve activity names from the given text file.
2. Transform the numbers into factors, using these names as factor labels.



### Step 4
**Label dataset with descriptive variable names**  
1. Replace all instances of dashes with periods.
2. Replace all instances of commas with underscores.
3. Remove all open parenthesis.
4. Remove all closing parenthesis.
5. Apply newlabels to column names.

### Step 5
**Create tidy data with average of each variable for each subject and activity**  


1. Load the dplyr library. (Note: it does not install the package for you.)
2. Group by Subject, then Activity.
3. Get the mean for each variable column.
4. Write the data to a text file.
5. *This is an extra step, but I find it useful to be able to view the object, after running the function. So, I save the object by calling saveRDS. To retrieve it afterwards, simply type at the prompt: summary <- readRDS("my_summary.rds")*

