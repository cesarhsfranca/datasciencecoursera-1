file <- "./data/household_power_consumption.txt"

hpc <- read.table(file, header = TRUE, sep = ";",
                  na.strings = "?", colClasses = c("character", "character", "numeric",
                                                   "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

hpc <- transform(hpc, 
                 datetime = as.POSIXct(paste(Date, Time, sep = " "), 
                                       format = c("%d/%m/%Y %H:%M:%S")))
hpcs <- subset(hpc, datetime >= "2007-02-01" & datetime < "2007-02-03")

# Plot 1
hist(hpcs$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

# Plot 2
plot(hpcs$datetime, hpcs$Global_active_power, type = "n",
     ylab = "Global Active Power (kilowatts)", 
     xlab = "")
lines(hpcs$datetime, hpcs$Global_active_power)

# Plot 3
plot(hpcs$datetime, hpcs$Sub_metering_1, type = "n",
     ylab = "Energy sub metering", 
     xlab = "")
lines(hpcs$datetime, hpcs$Sub_metering_1)
lines(hpcs$datetime, hpcs$Sub_metering_2, col = "red")
lines(hpcs$datetime, hpcs$Sub_metering_3, col = "blue")
legend("topright", lty=c(1,1,1),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"))

# Plot 4
par(mfrow = c(2, 2))

plot(hpcs$datetime, hpcs$Global_active_power, type = "n",
     ylab = "Global Active Power", 
     xlab = "")
lines(hpcs$datetime, hpcs$Global_active_power)

plot(hpcs$datetime, hpcs$Voltage, type = "n",
     ylab = "Voltage", 
     xlab = "")
lines(hpcs$datetime, hpcs$Voltage)

plot(hpcs$datetime, hpcs$Sub_metering_1, type = "n",
     ylab = "Energy sub metering", 
     xlab = "")
lines(hpcs$datetime, hpcs$Sub_metering_1)
lines(hpcs$datetime, hpcs$Sub_metering_2, col = "red")
lines(hpcs$datetime, hpcs$Sub_metering_3, col = "blue")
legend("topright", lty=c(1,1,1),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"))

with(hpcs, plot(datetime, Global_reactive_power, type = "n"))
lines(hpcs$datetime, hpcs$Global_reactive_power)
