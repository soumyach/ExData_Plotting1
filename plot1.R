##loading the data from the link

data <- "C:/Users/user/Desktop/coursera/ExData_Plotting1-master/household_power_consumption.txt"

## reading data 

datar <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## subseeting the data with the date criteria given

datas <- datar[datar$Date %in% c("1/2/2007","2/2/2007") ,]

## converting the globalactivepower variable into numeric

globalActivePower <- as.numeric(datas$Global_active_power)

## creating a png file to save the histogram

png("plot1.png", width=480, height=480)

## histogram to represent the global active power

hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
