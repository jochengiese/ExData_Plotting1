data = read.csv("household_power_consumption.txt",sep=";")

theDates = as.Date(data$Date, format="%d/%m/%Y")

indices <- which(
    ( theDates == as.Date("2007-02-02", format="%Y-%m-%d") ) |
    ( theDates == as.Date("2007-02-01", format="%Y-%m-%d") )
    )

theData <- data[indices,];

theInstants <- strptime(paste(theData$Date, theData$Time), format= "%d/%m/%Y %H:%M:%S" )

submeter1 <- as.numeric(levels(theData$Sub_metering_1)[theData$Sub_metering_1])
submeter2 <- as.numeric(levels(theData$Sub_metering_2)[theData$Sub_metering_2])
submeter3 <- as.numeric((theData$Sub_metering_3))

png(width=480,height=480,filename="plot3.png")
plot(theInstants, submeter1, type="l", xlab="",ylab="Energy sub metering", col="black")
lines(theInstants, submeter2, col="red")
lines(theInstants, submeter3, col="blue")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,col=c('black','red','blue'))
dev.off()
