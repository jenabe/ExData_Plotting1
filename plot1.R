##read data from the file
data <- read.table('household_power_consumption.txt', header=T, sep=";")

##make sure the date is in the correct format 
##and filter for the two days neccessary for assignment
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
filteredData <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]
##convert the global_active_power field to a numeric for plot
filteredData$Global_active_power <- as.numeric(as.character(filteredData$Global_active_power))

##create graph
hist(filteredData$Global_active_power, col='red', main='Global Active Power', xlab='Global Active Power (Kilowatts)')

##copy the plot just created to a PNG of 480 by 480
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()

