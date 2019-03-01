## Setting the Working directory
setwd("D:\\ONEDRIVE\\Tableau Training\\Coursera\\Exploratory data analysis")
## Getting the data set
data_electricity <- read.csv("D:\\ONEDRIVE\\Tableau Training\\Coursera\\Exploratory data analysis\\household_power_consumption.txt", header=T, sep=';', na.strings="?") 
## setting the time formats
data_electricity$Date <- as.Date(data_electricity$Date, format="%d/%m/%Y")
## getting only relevant data based in dates
data <- subset(data_electricity, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## remove the original data set to save memory
rm(data_electricity)
## date conversion
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
## Plotting the plot 1
hist(data$Global_active_power, main="Global Active Power", 
xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
## Saving a png file in the WD
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

