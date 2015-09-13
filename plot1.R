plot1 <- function() {
		data = read.csv("household_power_consumption.txt", sep=";", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings=c("?"))

		data$Date <- as.Date(data$Date, format="%d/%m/%Y")
		
		twoDayData <- data[data$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]
		twoDayData$DateTime <- strptime(paste(twoDayData$Date, twoDayData$Time), format="%Y-%m-%d %H:%M:%S")

		hist(twoDayData$Global_active_power, main = "Global Active Power", xlab = "Glboal Active Power (kilowatts)", ylab = "Frequency", col = "red")

		dev.copy(png,'plot1.png',width=480,height=480)
		dev.off()
}