# Exploratory Data Analysis
## R Code for Course Project 1
### R Code for Plot 4

# Read in data (dplyr required)
# Mutate the Data variable, create the datetime variable, and filter on the Date variable.
require(dplyr)
df_subset <-    read.table('household_power_consumption.txt', sep=';', header=TRUE, 
                           na.strings="?", stringsAsFactors=FALSE) %>%
        mutate(Date = as.Date(Date, '%d/%m/%Y')) %>%
        mutate(datetime = as.POSIXct(strptime(paste(Date, ' ', Time), '%Y-%m-%d %H:%M:%S'))) %>%
        filter(Date == '2007-02-01' | Date == '2007-02-02') %>%
        tbl_df

## Create the line diagrams with appropriate titles and axes titles.
par(mfrow = c(2, 2)) 
with(df_subset, {
        plot(datetime, Global_active_power, type="l",
             xlab="", ylab="Global Active Power")
        plot(datetime, Voltage, type="l",
             xlab="datetime", ylab="Voltage") 
        plot(datetime, Sub_metering_1, type="l",
             xlab="", ylab="Energy sub metering")
        lines(datetime, Sub_metering_2, col="red")
        lines(datetime, Sub_metering_3, col="blue")
        legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
               col=c("black","red","blue"), lty=1, cex=0.75, bty = "n")
        plot(datetime, Global_reactive_power, type="l",
             xlab="datetime", ylab="Global_reactive_power")
})

## Save plot4.png to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
par(mfrow=c(1,1))