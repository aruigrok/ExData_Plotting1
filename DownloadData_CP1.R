# Exploratory Data Analysis
## R Code for Course Project 1
## Download and save the data

### Clear the workspace
rm(list=ls())

### Load packages
library(dplyr)


### Set working directory - CHANGE TO PREFERRED DIRECTORY
setwd("~/Exploratory Data Analysis/Course Project 1/")


### Download data
#### Note: Always use method = “curl” when downloading a file on a mac
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("Household_power_consumption.zip")){
        print("Downloading Household_power_consumption.zip")
        download.file(fileURL, destfile="Household_power_consumption.zip", method="curl")
} else {print("Household_power_consumption.zip is present in folder")}

## Unzip the data
if(file.exists("household_power_consumption.txt")){
        print("Household_power_consumption.txt already exists")
} else{
        unzip("Household_power_consumption.zip", exdir="./")
}

# Read in data (dplyr required)
# Mutate the Data variable, create the datetime variable and filter on the Date variable.
require(dplyr)
df_subset <-    read.table('household_power_consumption.txt', sep=';', header=TRUE, 
                           na.strings="?", stringsAsFactors=FALSE) %>%
        mutate(Date = as.Date(Date, '%d/%m/%Y')) %>%
        mutate(datetime = as.POSIXct(strptime(paste(Date, ' ', Time), '%Y-%m-%d %H:%M:%S'))) %>%
        filter(Date == '2007-02-01' | Date == '2007-02-02') %>%
        tbl_df