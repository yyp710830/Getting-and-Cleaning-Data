##Getting and Cleaning Data Course Project

rm(list=ls())
##file.exists function is used to determine the directory "data" 
##dir.create function is used to create a new directory

if (!file.exists("data")) {  
        dir.create("data")   
}

##Getting data        
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,destfile="./data/20Dataset.zip")
list.files("./data/")
datadownloaded<-date()
datadownloaded                             ##[1] "Sun Jan 24 09:20:06 2016"

##Cleaning Data
features<-read.table("./data/20Dataset/UCI HAR Dataset/features.txt")
                                           ##Read features.txt as a data frame
features_names<-as.character(features$V2)  ##Take the second column as a string

X_train<-read.table("./data/20Dataset/UCI HAR Dataset/train/X_train.txt")
X_test<-read.table("./data/20Dataset/UCI HAR Dataset/test/X_test.txt")
alldata<-rbind(X_train,X_test)             ##Merged training data and testing data
names(alldata)<-features_names             ##Variable naming of data sets

xmean<-grep("mean()",names(alldata))       ##Find who include variable name "mean()"
xmfreq<-grep("meanFreq",names(alldata))    ##Find who include variable name "meanFreq()"
mef<-match(xmfreq,xmean)                   ##Query the xmfreq number in the xmean
xmean<-xmean[-mef]                         ##Out from the xmean contains the variable name "meanFreq"
xstd<-grep("*std",names(alldata))          ##Extract contains std of variables, the 33 columns
mean_and_std<-alldata[,c(xmean,xstd)]      ##A new data set-"mean_and_std"

names(mean_and_std)                        ##To check the variable name of the new data set
names(mean_and_std)<-tolower(names(mean_and_std))               ##Changed to lowercase
names(mean_and_std)<-sub("*bodybody","body",names(mean_and_std))##We revised the repeated named variable
names(mean_and_std)<-sub("\\()","",names(mean_and_std))         ##Remove the parenthesis


##Adjust the format of the variable name,eg:"t-body-acc-mean-x”.
names1<-gsub("body", "-body-", names(mean_and_std))
names(mean_and_std)<-gsub("mag","-mag", names1)
names(mean_and_std)<-gsub("gravity", "-gravity-", names(mean_and_std))
names(mean_and_std)<-gsub("mag-std", "std-mag", names(mean_and_std))
names(mean_and_std)<-gsub("mag-mean", "mean-mag", names(mean_and_std))

namelist<-strsplit(names(mean_and_std),"\\-")##The names(mean_and_std) divided into list


##Generate a new data frame,rows:339867 and cols:6
df1<-data.frame()
for (i in 1:33)  {
        df<-data.frame(f1=namelist[[i]][1],f2=namelist[[i]][2], f3=namelist[[i]][3],
               f4=namelist[[i]][5], mean=mean_and_std[,i],std=mean_and_std[,i+33])
        df1<-rbind(df1,df)
}
head(df1)
dim(df1)
write.table(df1,file="mean_and_std.txt",row.name=FALSE)

##Create a second data frame
mean_mean<-tapply(df1$mean,df1$f1:df1$f2:df1$f3:df1$f4,mean)
mean_std<-tapply(df1$std,df1$f1:df1$f2:df1$f3:df1$f4,mean)
df2<-cbind(mean_mean,mean_std)
df2<-as.data.frame(df2)

library(dplyr)
df3<-cbind(rownames(df2),df2)
df3<-filter(df3, !is.na(mean_mean))
names(df3)<-c("status","mean_mean","mean_std")
df3                     ##This is the results
write.table(df3,file="Summarize the mean and std of the status.txt",row.name=FALSE)

