## plot1.R
##
## Overview:
## The script below loads a local copy of the Electric power consumption data 
## from UC Machine Learning Repository. It outputs a PNG file with the following
## plot covering Feb 1-2, 2007:
## - Histogram of Global Active Power
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

## Open png device
png(filename = "plot1.png", width = 480, height = 480);
## Create the plot
with(dat, hist(Global_active_power, col="red", main="Global Active Power", 
                   xlab="Global Active Power (kilowatts)"));

dev.off() # Close the graphics device
message("Plot 1 has been created.");