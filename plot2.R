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

## creating a png file to save the plot

png("plot2.png", width=480, height=480)
plot(datetime, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()