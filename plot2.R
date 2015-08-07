## plot2.R
##
## Overview:
## The script below loads a local copy of the Electric power consumption data 
## from UC Machine Learning Repository. It outputs a PNG file with the following
## plots covering Feb 1-2, 2007:
## - Global Active Power vs. time
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
png(filename = "plot2.png", width = 480, height = 480);
## Create the plot
with(dat, plot(DateTime, Global_active_power, type="l", xlab="", 
               ylab="Global Active Power (kilowatts)"));

dev.off(); # Close the graphics device
message("Plot 2 has been created.");
