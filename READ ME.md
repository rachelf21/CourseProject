# run_analysis.R
*Course Project for Getting and Cleaning Data*  
*July 21, 2015*  
  

**Please note that you must have the *dplyr* package installed in order to run this script!**

 

**run_analysis** analyzes and summarizes the mean and standard deviation data from various measurements collected from  the accelerometers from the Samsung Galaxy S smartphone. 

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
**Label dataset with descriptive names**  
*(I chose to do this step first, even though the instructions asked for this later. This way, I was able to use these labels to extract only the necessary columns, in the next step.)*

1. Retrieve the identifiying features from the given text file.
2. Apply them as column names to the dataset.

### Step 3
**Retrieve only measurements with mean and std in them**  

1. Search for column names with "mean()" and "std" in them.
2. Extract all those columns.

### Step 4
**Use descriptive names for activities instead of numbers**  

1. Retrieve activity names from the given text file.
2. Transform the numbers into factors, using these names as factor labels.

### Step 5
**Create tidy data with average of each variable for each subject and activity**  


1. Load the dplyr library. (Note: it does not install the package for you.)
2. Group by Subject, then Activity.
3. Get the mean for each variable column.
4. Save the object so that it can be retrieved after the function.  (Extra step,but it's handy to have as reference.)
5. Write the data to a text file.

