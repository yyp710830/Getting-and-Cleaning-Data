## Codebook.md

features_names: Read features.txt as a data frame,and take the second column as a string vector.

alldata: Merged training data and testing data.

mean_and_std: A new data set call "mean_and_std".Extracts only the measurements on the mean and standard deviation for each measurement.

namelist: The names(mean_and_std) divided into list for extracting value as factor.

df1: Generate a new data frame,rows:339867 and cols:6

f1: A factor,contains two levels:t and f.

f2: A factor,contains two levels:body and gravity.

f3: A factor,contains four levels:acc,accjerk,gyro and gyrojerk.

f4: A factor,contains four levels:x,y,z and mag. 

mean: The mean of a state composed of f1,f2,f3,f4.

std: The std of a state composed of f1,f2,f3,f4.

df3: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

status: A variety of different state composed of f1,f2,f3,f4.

mean_mean: The average of the mean of each state.

mean_std: The mean of the standard deviation of each state.



