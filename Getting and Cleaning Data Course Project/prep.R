if (!file.exists("./data")){dir.create("./data")}

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, "./data/project_dataset.zip")

unzip("./data/project_dataset.zip", exdir = "./data")
