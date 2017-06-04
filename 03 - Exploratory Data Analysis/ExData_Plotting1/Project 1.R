file <- "./data/household_power_consumption.txt"

hpc <- read.table(file, header = TRUE, sep = ";",
           na.strings = "?", colClasses = c("character", "character", "numeric",
           "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

hpc <- transform(hpc, 
                 DateTime = as.POSIXct(paste(Date, Time, sep = " "), 
                                  format = c("%d/%m/%Y %H:%M:%S")))

# hpc <- transform(hpc, Date = as.Date(Date, format = c("%d/%m/%Y")))

hpcs <- subset(hpc, DateTime >= "2007-02-01" & DateTime < "2007-02-03")

head(hpcs)
tail(hpcs)

# Plot 1
hist(hpcs$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

# Plot 2
plot(hpcs$DateTime, hpcs$Global_active_power, type = "n",
     ylab = "Global Active Power (kilowatts)", 
     xlab = "")
lines(hpcs$DateTime, hpcs$Global_active_power)

# Plot 3
plot(hpcs$DateTime, hpcs$Sub_metering_1, type = "n",
     ylab = "Energy sub metering", 
     xlab = "")
lines(hpcs$DateTime, hpcs$Sub_metering_1)
lines(hpcs$DateTime, hpcs$Sub_metering_2, col = "red")
lines(hpcs$DateTime, hpcs$Sub_metering_3, col = "blue")
legend("topright", lty=c(1,1,1),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"))

# Plot 4
plot(hpcs$DateTime, hpcs$Sub_metering_1, type = "n",
     ylab = "Energy sub metering", 
     xlab = "")
lines(hpcs$DateTime, hpcs$Sub_metering_1)
lines(hpcs$DateTime, hpcs$Sub_metering_2, col = "red")
lines(hpcs$DateTime, hpcs$Sub_metering_3, col = "blue")
legend("topright", lty=c(1,1,1),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"))

