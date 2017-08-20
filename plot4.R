##loading the data from the link

data <- "C:/Users/user/Desktop/coursera/ExData_Plotting1-master/household_power_consumption.txt"

## reading data 

datar <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## subseeting the data with the date criteria given

datas <- datar[datar$Date %in% c("1/2/2007","2/2/2007") ,]

## changing the class of date and time

datetime <- strptime(paste(datas$Date, datas$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## changing the global active power variable into numeric 

gap <- as.numeric(datas$Global_active_power)

## changing the global re-active power variable into numeric 

grp <- as.numeric(datas$Global_reactive_power)

## changing the voltage variable into numeric

voltage <- as.numeric(datas$Voltage)

## changing the sub metering variable into numeric

sm1 <- as.numeric(datas$Sub_metering_1)
sm2 <- as.numeric(datas$Sub_metering_2)
sm3 <- as.numeric(datas$Sub_metering_3)

## creating a png file to save the plot

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
plot(datetime, gap, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, sm1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sm2, type="l", col="red")
lines(datetime, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, grp, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

