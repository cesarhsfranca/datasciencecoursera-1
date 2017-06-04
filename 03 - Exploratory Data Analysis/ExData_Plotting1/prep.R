if (!file.exists("./data")){dir.create("./data")}

url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "./data/household_power_consumption.zip")

unzip("./data/household_power_consumption.zip", exdir = "./data")
