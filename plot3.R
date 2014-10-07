## Exploratory Data Analysis
## Assignment 1
## Plot 3

## this script assumes that you have downloaded the dataset household_power_consumption.txt
## into your working directory

## read in the data, correct the date formats, and subset the needed days.
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
power$Timestamp <- strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")
powerSubset <- with(power, subset(power, power$Timestamp > as.POSIXct("2007-02-01 00:00:01") & power$Timestamp < as.POSIXct("2007-02-02 23:59:59")))

## open the PNG graphics device and create a file
png(file = "plot3.png")

## Create the plot to be sent to the file
with(powerSubset, plot(Timestamp, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(powerSubset, lines(Timestamp, Sub_metering_2, col="red"))
with(powerSubset, lines(Timestamp, Sub_metering_3, col="blue"))
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Close the png graphics device
dev.off()