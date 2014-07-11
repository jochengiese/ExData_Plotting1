data = read.csv("household_power_consumption.txt",sep=";")

theDates = as.Date(data$Date, format="%d/%m/%Y")

indices <- which(
    ( theDates == as.Date("2007-02-02", format="%Y-%m-%d") ) |
    ( theDates == as.Date("2007-02-01", format="%Y-%m-%d") )
    )

theData <- data[indices,];

power <- as.numeric(as.character(theData$Global_active_power))

png(width=480,height=480,filename="plot1.png")
hist(power,main="Global Active Power", xlab="Global Active Power (kilowatts)",
     col="red")
dev.off()
