## plot4.R
##
## Overview:
## The script below loads a local copy of the Electric power consumption data 
## from UC Machine Learning Repository. It outputs a PNG file with the following
## plots covering Feb 1-2, 2007:
## - Global Active Power vs. time
## - Voltage vs. time
## - Sub metering vs. time
## - global reactive power vs. time
##
## Created on:
## 8-6-15

## Read in Data, note that the first two columns are read in as characters
dat <- read.csv("household_power_consumption.txt", header=TRUE, sep=";",
                    colClasses=c("character","character","numeric","numeric",
                                "numeric","numeric","numeric","numeric",
                                "numeric"),
                    na.strings=c("?")
                    );

## Subset the data based on Date
dat <- subset(dat, Date=="1/2/2007" | Date=="2/2/2007");

## Create variable that combines both date and time in the data frame
dat$datetime <- strptime( paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S" );

## Open png device
png(filename = "plot4.png", width = 480, height = 480);

## Create the plots
par(mfrow=c(2,2));

# Plot 1
with(dat, plot(datetime, Global_active_power, type="l", xlab="", 
               ylab="Global Active Power (kilowatts)"));
# Plot 2
with(dat, plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage"));
# Plot 3
with(dat, plot(datetime, Sub_metering_1, type="l", col='black', xlab="", 
               ylab="Energy sub metering"));
with(dat, lines(datetime, Sub_metering_2, type="l", col='red', xlab="", 
                ylab="Energy Submetering"));
with(dat, lines(datetime, Sub_metering_3, type="l", col='blue', xlab="", 
                ylab="Energy Submetering"));
with(dat, legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), 
                 legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")));
# Plot 4
with(dat, plot(datetime, Global_reactive_power, type="l", xlab="datetime"));

par(mfrow=c(1,1));
dev.off();          # Close the graphics device
message("Plot 4 has been created.");
