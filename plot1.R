# Exploratory Data Analysis
## R Code for Course Project 1
### R Code for Plot 1

# Read in data (dplyr required)
# Mutate the Data variable, create the datetime variable and filter on the Date variable.
require(dplyr)
df_subset <-    read.table('household_power_consumption.txt', sep=';', header=TRUE, 
                           na.strings="?", stringsAsFactors=FALSE) %>%
        mutate(Date = as.Date(Date, '%d/%m/%Y')) %>%
        mutate(datetime = as.POSIXct(strptime(paste(Date, ' ', Time), '%Y-%m-%d %H:%M:%S'))) %>%
        filter(Date == '2007-02-01' | Date == '2007-02-02') %>%
        tbl_df

## Create the histogram with appropriate title and axes titles.
hist(df_subset$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save plot1.png to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
