The scripts work as follows:

1. Load all necessary data files from the FUCI HAR DATASET folder.
2. Load two additional reference files - to be used as descriptive indexes for the data files
3. Add labels to the exercise type data
4. Add column names to the measurements data sets
5. Select only the columns that are means and standard deviations of each measurement
6. Column bind the three data sets for the test and train data sets separately, then row bind the two together
7. Create a summary table by summarising data set using dplyr package
8. Write output data set to a txt file
