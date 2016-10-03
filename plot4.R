setwd("/Users/Daniel/Documents")
upload <- "household_power_consumption.txt"
data <- read.table(upload, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
dataRange <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2)) 
Global_active_power <- as.numeric(dataRange$Global_active_power)
Date <- strptime(paste(dataRange$Date, dataRange$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
plot(Date, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", cex = 1)
Voltage <- as.numeric(dataRange$Voltage)
plot(Date, Voltage, type="l", xlab = "datetime", ylab="Voltage")
Sub_metering_1 <- as.numeric(dataRange$Sub_metering_1)
plot(Date, Sub_metering_1, type="l", xlab = "", ylab="Energy Submetering")
Sub_metering_2 <- as.numeric(dataRange$Sub_metering_2)
lines(Date, Sub_metering_2, type="l", col="red")
Sub_metering_3 <- as.numeric(dataRange$Sub_metering_3)
lines(Date, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=1, col=c("black", "red", "blue"), bty="o")
Global_reactive_power <- as.numeric(dataRange$Global_reactive_power)
plot(Date, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()