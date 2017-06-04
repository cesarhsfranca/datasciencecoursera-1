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

# Plot 2
png(file = "plot2.png", width = 504, height = 504, bg = "transparent")
plot(hpcsubset$datetime, hpcsubset$Global_active_power, type = "n",
     ylab = "Global Active Power (kilowatts)", 
     xlab = "")
lines(hpcsubset$datetime, hpcsubset$Global_active_power)
dev.off()
