plot4 <- function() {
		data = read.csv("household_power_consumption.txt", sep=";", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings=c("?"))

		data$Date <- as.Date(data$Date, format="%d/%m/%Y")
		
		twoDayData <- data[data$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]
		twoDayData$DateTime <- strptime(paste(twoDayData$Date, twoDayData$Time), format="%Y-%m-%d %H:%M:%S")

		par(mfcol = c(2, 2))

		with(twoDayData, plot(DateTime, Global_active_power, xlab="", ylab = "Glboal Active Power", type="l"));

		with(twoDayData, plot(DateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", t="n") )
		with(twoDayData,lines(DateTime, Sub_metering_1, col="black"))
		with(twoDayData,lines(DateTime, Sub_metering_2, col="red"))
		with(twoDayData,lines(DateTime, Sub_metering_3, col="blue"))
		legend("topright", lty = c(1,1), col=c("black", "red","blue"), legend=c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "), bty="n")
		
		with(twoDayData, plot(DateTime, Voltage, xlab="datetime", ylab = "Voltage", type="l"));

		with(twoDayData, plot(DateTime, Global_reactive_power, xlab="datetime", ylab = "Global_reactive_power", type="l"));
		
		dev.copy(png,'plot4.png',width=480,height=480)
		dev.off()
}