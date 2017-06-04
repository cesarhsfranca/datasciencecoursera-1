url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "household_power_consumption.zip")
unzip("household_power_consumption.zip")

hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                  na.strings = "?", colClasses = c("character", "character", "numeric",
                                                   "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

hpc <- transform(hpc, 
                 datetime = as.POSIXct(paste(Date, Time, sep = " "), 
                                       format = c("%d/%m/%Y %H:%M:%S")))
hpcsubset <- subset(hpc, datetime >= "2007-02-01" & datetime < "2007-02-03")

# Plot 4
png(file = "plot4.png", width = 504, height = 504, bg = "transparent")
par(mfrow = c(2, 2), mar = c(4,4,2,2))

with(hpcsubset, plot(datetime, Global_active_power, type = "n",
     ylab = "Global Active Power", 
     xlab = ""))
lines(hpcsubset$datetime, hpcsubset$Global_active_power)

with(hpcsubset, plot(datetime, Voltage, type = "n",
     ylab = "Voltage"))
lines(hpcsubset$datetime, hpcsubset$Voltage)

with(hpcsubset, plot(datetime, Sub_metering_1, type = "n",
     ylab = "Energy sub metering", 
     xlab = ""))
lines(hpcsubset$datetime, hpcsubset$Sub_metering_1)
lines(hpcsubset$datetime, hpcsubset$Sub_metering_2, col = "red")
lines(hpcsubset$datetime, hpcsubset$Sub_metering_3, col = "blue")
legend("topright", lty=c(1,1,1),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"))

with(hpcsubset, plot(datetime, Global_reactive_power, type = "n"))
lines(hpcsubset$datetime, hpcsubset$Global_reactive_power)

dev.off()
