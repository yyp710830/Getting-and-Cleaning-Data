# Getting-and-Cleaning-Data

  Read features.txt as a data frame,take the second column as a string vector,call "features_names".Merges the training and the test sets to create one data set,call "alldata" The alldata's variables name from the vector "features_names".
  
  Find who include name "mean()" and "meanFreq()" in "features_names",give the variable name "xmean" and "xmfreq", respectively.Query the xmfreq number in the xmean,out from the xmean contains the variable name "meanFreq".Extract contains std of variables names,  33
columns,call "xstd". 

  A new data set-"mean_and_std" contains variable names of xmean and xstd from the alldata.To check the variable name of the new data set,changed to lowercase,revised the repeated named variable,removed the parenthesis.
  Adjust the format of the variable name,eg:"t-body-acc-mean-x”.The names(mean_and_std) divided into list.Generate a new data frame,rows:339867 and cols:6,call "df1".
  
  The data set df1's first column is a factor,contains two levels:t and f.The second column  is a factor,contains two levels:body and gravity.The third  column  is a factor,contains four levels:acc,accjerk,gyro and gyrojerk.The fourth  column  is a factor,contains four levels:x,y,z and mag.In front of the four columns are combined to describe a state,at the end of  two columns, respectively, describe the situation of the state's mean and std.
  
  Creates a second, independent tidy data set with the average of each variable for each activity and each subject,call "df3".The data set df3 contains three variables,respectively,call " status","mean_mean","mean_std".They describe:a variety of different state,each state of the average of the mean and the standard deviation of the mean of each state.
