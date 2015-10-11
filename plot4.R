##read data from the file
data <- read.table('household_power_consumption.txt', header=T, sep=";")

##make sure the date is in the correct format 
##and filter for the two days neccessary for assignment
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
filteredData <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]

##format the data
filteredData$Global_active_power <- as.numeric(as.character(filteredData$Global_active_power))
filteredData$Voltage <- as.numeric(as.character(filteredData$Voltage))
filteredData$Global_reactive_power <- as.numeric(as.character(filteredData$Global_reactive_power))
filteredData$Sub_metering_1 <- as.numeric(as.character(filteredData$Sub_metering_1))
filteredData$Sub_metering_2 <- as.numeric(as.character(filteredData$Sub_metering_2))
filteredData$Sub_metering_3 <- as.numeric(as.character(filteredData$Sub_metering_3))

filteredData$DateTime <- paste(filteredData$Date, filteredData$Time, sep=" ")
filteredData$DateTime <- as.POSIXct(filteredData$DateTime)

##to correct legend resize issue for some reason I had to put devcopy first
dev.copy(png, file="plot4.png", width=480, height=480)

##prepare the area for 4 graphs
par(mfrow=c(2,2))

##plot1
plot(filteredData$DateTime,filteredData$Global_active_power,type='l',xlab='',ylab='Global Active Power')

##plot2
plot(filteredData$DateTime,filteredData$Voltage,type='l',xlab='datetime',ylab='Voltage')

##plot3
plot(filteredData$DateTime,filteredData$Sub_metering_1,col='black',xlab='',ylab='Energy sub metering',type='l')
lines(filteredData$DateTime,filteredData$Sub_metering_2,col='red')
lines(filteredData$DateTime,filteredData$Sub_metering_3,col='blue')
legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),bty='n',col=c('black','red','blue'),lty=c(1,1,1))

##plot4
plot(filteredData$DateTime,filteredData$Global_reactive_power,type='l',xlab='datetime',ylab='Global_reactive_power')

dev.off()