## plot3.R
##
## Overview:
## The script below loads a local copy of the Electric power consumption data 
## from UC Machine Learning Repository. It outputs a PNG file with the following
## plot covering Feb 1-2, 2007:
## - Sub metering vs. time
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

## Create variable that combines both date and time in data frame
dat$DateTime <- strptime( paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S" );

## Open png device
png(filename = "plot3.png", width = 480, height = 480);

## Create the plot
with(dat, plot(DateTime, Sub_metering_1, type="l", col='black', xlab="", 
               ylab="Energy sub metering"));
with(dat, lines(DateTime, Sub_metering_2, type="l", col='red', xlab="", 
               ylab="Energy Submetering"));
with(dat, lines(DateTime, Sub_metering_3, type="l", col='blue', xlab="", 
                ylab="Energy Submetering"));
with(dat, legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), 
                 legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")));

dev.off(); # Close the graphics device
message("Plot 3 has been created.");
