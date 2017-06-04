file <- "./data/household_power_consumption.txt"

hpc <- read.table(file, header = TRUE, sep = ";",
           na.strings = "?", colClasses = c("character", "character", "numeric",
           "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

hpc <- transform(hpc, Date = as.Date(Date, format = c("%d/%m/%Y")))

#hpc <- transform(hpc, 
#                 DateTime = as.POSIXct(paste(Date, Time, sep = ""), 
#                                  format = c("%d/%m/%Y %H:%M:%S")))

hpcs <- subset(hpc, Date >= "2007-02-01" & Date <= "2007-02-02")

head(hpcs)
tail(hpcs)
