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

## changing the sub metering variable into numeric

sm1 <- as.numeric(datas$Sub_metering_1)
sm2 <- as.numeric(datas$Sub_metering_2)
sm3 <- as.numeric(datas$Sub_metering_3)

## creating a png file to save the plot

png("plot3.png", width=480, height=480)
plot(datetime, sm1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sm2, type="l", col="red")
lines(datetime, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()