# Getting-and-Cleaning-Data

Read features.txt as a data frame,take the second column as a string vector,call "features_names".
Merges the training and the test sets to create one data set,call "alldata"
The alldata's variables name from the vector "features_names".
Find who include name "mean()" and "meanFreq()" in "features_names",give the variable name "xmean" and "xmfreq", respectively.
Query the xmfreq number in the xmean,out from the xmean contains the variable name "meanFreq"
Extract contains std of variables names,  33 columns,call "xstd". 
A new data set-"mean_and_std" contains variable names of xmean and xstd from the alldata.
To check the variable name of the new data set,changed to lowercase,revised the repeated named variable,removed the parenthesis.
Adjust the format of the variable name,eg:"t-body-acc-mean-x”.
The names(mean_and_std) divided into list.
Generate a new data frame,rows:339867 and cols:6,call "df".
The data set df's first column is a factor,contains two levels:t and f.
The second column  is a factor,contains 



