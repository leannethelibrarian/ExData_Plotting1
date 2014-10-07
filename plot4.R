## Exploratory Data Analysis
## Assignment 1
## Plot 4

## this script assumes that you have downloaded the dataset household_power_consumption.txt
## into your working directory

## read in the data, correct the date formats, and subset the needed days.
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
power$Timestamp <- strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")
powerSubset <- with(power, subset(power, power$Timestamp > as.POSIXct("2007-02-01 00:00:01") & power$Timestamp < as.POSIXct("2007-02-02 23:59:59")))

## open the PNG graphics device and create a file
png(file = "plot4.png")

## Create the plot to be sent to the file
par(mfrow = c(2,2))
with(powerSubset, {
    plot(Timestamp, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
    plot(Timestamp, Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
    
    plot(Timestamp, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
    lines(Timestamp, Sub_metering_2, col="red")
    lines(Timestamp, Sub_metering_3, col="blue")
    legend("topright", bty = "n", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(Timestamp, Global_reactive_power, type = "l", ylab = "Global_reative_power", xlab = "datetime")  
})

## Close the PNG graphics device
dev.off()