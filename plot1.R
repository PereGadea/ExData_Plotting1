### Coursera. Exploratory Data Analysis
##  Course Project 1 
#   Rcode for plot1

# get the data from web to C:/ (not part of the exercise)
# fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# download.file(fileURL, destfile="~/R/data.zip")
# unzip("data.zip")

# put the data in R
data <- read.table("household_power_consumption.txt", header = T, sep =";", comment.char="", nrows =2075259, colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")

# transform the columns date&time in a one column
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date = NULL       		# delete to save memory
data$Time = NULL 			# id

# select the days 
data2 <- data[grepl("^2007-02-01", data$DateTime),]
data3 <- data[grepl("^2007-02-02", data$DateTime),]
dataset <- rbind(data2, data3)
rm(data2) 				# delete to save memory
rm(data3)				# id

### plot 1
png(filename="plot1.png", width = 480, height = 480)
hist(dataset$Global_active_power, col = "red", ylim = c(0,1200), xlim = c(0,6), ylab="Frequency", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()