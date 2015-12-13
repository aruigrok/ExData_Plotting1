# Exploratory Data Analysis
## R Code for Course Project 1
### R Code for Plot 2

# Read in data (dplyr required)
# Mutate the Data variable, create the datetime variable and filter on the Date variable.
require(dplyr)
df_subset <-    read.table('household_power_consumption.txt', sep=';', header=TRUE, 
                           na.strings="?", stringsAsFactors=FALSE) %>%
        mutate(Date = as.Date(Date, '%d/%m/%Y')) %>%
        mutate(datetime = as.POSIXct(strptime(paste(Date, ' ', Time), '%Y-%m-%d %H:%M:%S'))) %>%
        filter(Date == '2007-02-01' | Date == '2007-02-02') %>%
        tbl_df

## Create the line diagram with appropriate title and axes titles.
plot(df_subset$datetime, df_subset$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")

## Save plot2.png to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()