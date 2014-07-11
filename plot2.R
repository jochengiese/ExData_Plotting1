data = read.csv("household_power_consumption.txt",sep=";")

theDates = as.Date(data$Date, format="%d/%m/%Y")

indices <- which(
    ( theDates == as.Date("2007-02-02", format="%Y-%m-%d") ) |
    ( theDates == as.Date("2007-02-01", format="%Y-%m-%d") )
    )

theData <- data[indices,];

theInstants <- strptime(paste(theData$Date, theData$Time), format= "%d/%m/%Y %H:%M:%S" )

#power <- as.numeric(as.character(theData$Global_active_power))
power <- as.numeric(levels(theData$Global_active_power)[theData$Global_active_power])


png(width=480,height=480,filename="plot2.png")
plot(theInstants, power, type="l", xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
