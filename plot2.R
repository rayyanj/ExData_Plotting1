plot2 <- function() {
		data = read.csv("household_power_consumption.txt", sep=";", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings=c("?"))

		data$Date <- as.Date(data$Date, format="%d/%m/%Y")
		
		twoDayData <- data[data$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]
		twoDayData$DateTime <- strptime(paste(twoDayData$Date, twoDayData$Time), format="%Y-%m-%d %H:%M:%S")

		with(twoDayData, plot(DateTime, Global_active_power, xlab="", ylab = "Glboal Active Power (kilowatts)", type="l"));

		dev.copy(png,'plot2.png',width=480,height=480)
		dev.off()
}