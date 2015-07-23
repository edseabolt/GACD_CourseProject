# Getting and Cleaning Data Course Project

### Intro
This file documents the appropriate use of the run_analysis.R script, the steps carried out during the analysis,
and the expected result obtained. The run_analysis.R script depends on the **dplyr** package. Please ensure you have
installed this package before attempting to execute the script. The script also assumes you have unzipped the contents
of the course project dataset into the directory where the run_analysis.R script will be located. It also assumes
that the data will be in the original zipped folder called "UCI HAR Dataset".

### Script

The script can be executed simply by sourcing the file. No arguments are needed.

Core functions:
* main
  * This method load all data files, executes the tidy analysis steps, and outputs the final tidy result set.
* runStep1
  * This step merges the test and training data sets into one complete data set. The merge process is carried out
  by ***rbind***ing the subject, activity, and measurement data into separate combined variables which are then merged
  by ***cbind***ing.
* runStep2
  * This step extracts only measurements representing mean and standard deviation. I included all variables that
  referenced the words ***mean*** or ***std*** from the features.txt file. An additional function called getFilteredFeatures
  was used to collect these names and then processed via ***sapply*** to get a generic column name that included the column
  position of the measurement. This position would be needed later to know which measurements each variable referenced within
  the code book. Once the column names were update and the list of targeted features was selected, the function returns
  the resulting subset.
* runStep3
  * This step utilizes the description activity names contained in the activity_labels.txt file to appropriately name the activities in
  the data. This is essentially nothing more than converting the numeric actity factor to its corresponding alphabetic name.
* runStep4
  * This step converts the generic column names provided in earlier steps into a more descriptive name. The descriptive name for the
  output of the measurements in the final tidy data set was chosen to start with the word "Measurement" and then appending the column
  position of the original merged data set appended to it. Rather than give complete descriptive names here, the code book will provide
  the necessary alignment to the tidy data set and the variables that are represented.
* runStep5
  * Creates the final tidy data set. The ***group_by*** function is used to create groups by Subject and Activity which are then summarized
  by using the ***summarize_each*** method to compute the mean.
  
Other functions found in the script:
* initVar
  * During the development of the script I needed a way to cache the file contents of all the data sets into memory in order to remove the cost
  of loading the larger data files everytime the script was executed. This function loads each messy file from disk and creates a variable in the
  Global environment. The variable would then be accessible via this environment to the rest of the functions. Changes could then be made to 
  functions without having to wait for each reload of the data. In order to start from a clean slate, a call to rm(list = ls()) could be made or
  if working within RStudio doing a simple clearing of objects from the environment panel.
* loadFiles
  * Does nothing more than load each file and call the initVar function for each data set to be cached.
* getFilteredFeatures
  * Used to filter the feature set in features.txt down to the required items containing mean and std.
  
### Sample Script Output

Output if files were not cached:

* Loading messy files
* Loading activity_labels.txt 
* Loading features.txt 
* Loading test/X_test.txt 
* Loading test/y_test.txt 
* Loading test/subject_test.txt 
* Loading train/X_train.txt 
* Loading train/y_train.txt 
* Loading train/subject_train.txt 
* Running step1
* Running step2
* Running step3
* Running step4
* Running step5
* Writing tidy dataset

Output if files were cached:

* Loading messy files
* Reusing result for activityLabels 
* Reusing result for features 
* Reusing result for testX 
* Reusing result for testY 
* Reusing result for subjectTest 
* Reusing result for trainX 
* Reusing result for trainY 
* Reusing result for subjectTrain 
* Running step1
* Running step2
* Running step3
* Running step4
* Running step5
* Writing tidy dataset

### Tidy Dataset

The final output of the script creates a file called ***tidy.txt*** in the working directory. The file dimensions are 181 x 88
where the first row are the variable names. The first two columns are the Subject and Activity respectively. The other columns
represent the summarized means of the grouped measurement data. The other 180 rows represent the observational data.
