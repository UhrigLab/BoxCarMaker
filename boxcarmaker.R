library(readr)
library(ggplot2)
library(cowplot)
library(dplyr)
library(arules)
library(Hmisc)
library(funModeling)

theme_set(theme_cowplot())

# Set working directory to the folder with the .raw or MS1 list files. 


setwd("F:\\data\\2021\\03\\20210312_Kale10_Sabine_Dorna")
# If starting from an MS1 list .csv, skip down to Section 2. 

########### SECTION 1 ################

### Use RawConverter to produce an MS1 file. Change the extension to .txt.
## Import it here. 

data1<-read_table2("20210312_Kale10_Sabine_Dorna_TP_02_K1-3-0.txt", col_names = FALSE)
head(data1)
tail(data1)

##view middle rows
data1[c(630,631,632,633,634,635),]

##remove empty columns
data1 <- data1[ -c(5,6) ]
head(data1)
tail(data1)

## Remove rows with NAs
data2<-na.omit(data1)
head(data2)

##view middle rows
data2[c(630,631,632,633,634,635),]

## Remove rows 1-5 that have comments. 
data2 <- data2[ -c(1:5), ]
head(data2)

##Give column headers
colnames(data2)<-c("mz","misc","charge","intensity")
head(data2)

## Write the MS1 list
write.csv(data2,"20210312_Kale10_Sabine_Dorna_TP_02_K1-3-0_MS1list.csv")

########### SECTION 2 ################

##Read in MS1 list
df<-read.csv("20210312_Kale10_Sabine_Dorna_TP_02_K1-3-0_MS1list.csv")
head(df)

## Make n boxes of equal mz frequency using equal_freq(df$mz, n)
df.windows<-equal_freq(df$mz,20)

## Print out the box definitions:
levels(df.windows)

## Copy to an excel sheet. Remember to subtract the left border of all boxes, except for the first one, by 1 to ensure 1 m/z overlap. 
