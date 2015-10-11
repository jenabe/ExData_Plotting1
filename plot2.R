##read data from the file
data <- read.table('household_power_consumption.txt', header=T, sep=";")

##make sure the date is in the correct format 
##and filter for the two days neccessary for assignment
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
filteredData <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]

##format the x and y variables of the axis
filteredData$Global_active_power <- as.numeric(as.character(filteredData$Global_active_power))
filteredData$DateTime <- paste(filteredData$Date, filteredData$Time, sep=" ")
filteredData$DateTime <- as.POSIXct(filteredData$DateTime)

##create graph
plot(filteredData$DateTime,filteredData$Global_active_power,type='l',xlab ='',ylab='Global Active Power (Kilowatts)')

##copy the plot just created to a PNG of 480 by 480
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()