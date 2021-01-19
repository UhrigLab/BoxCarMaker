library(readr)
library(dplyr)
library(arules)
library(Hmisc)
library(funModeling)

##Set working directory
setwd("/Users/devangmehta/Dropbox/POST_DOC/MANUSCRIPTS/DIAvDDA/v2")

##Read in MS1 list
df<-read.csv("MS1list.csv")
head(df)

##Create 20 bins with equal m/z 
df.windows<-equal_freq(df$m.z,20)


head(df.windows)
levels(df.windows) ##The output levels are the window definitions you need. 