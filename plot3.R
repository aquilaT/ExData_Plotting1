data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
		stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
subSetData$datetime <- mapply(function(s1, s2){as.POSIXct(paste(s1, s2), format = "%d/%m/%Y %H:%M:%S")},
		subSetData$Date,subSetData$Time)
png("plot3.png")
plot(subSetData$datetime, subSetData$Sub_metering_1, type="l", xaxt = "n",
		ylab = "Energy sub metering", xlab = "")
lines(subSetData$datetime, subSetData$Sub_metering_2, col = "red")
lines(subSetData$datetime, subSetData$Sub_metering_3, col = "blue")
axis.POSIXct(1, as.POSIXct(subSetData$datetime, origin="1970-01-01"))
legend("topright", lty = 1, col = c("black", "red", "blue"),
		legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()