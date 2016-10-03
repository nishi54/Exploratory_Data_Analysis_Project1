setwd("/Users/Daniel/Documents")
upload <- "household_power_consumption.txt"
data <- read.table(upload, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
dataRange <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

Global_active_power <- as.numeric(dataRange$Global_active_power)
Date <- strptime(paste(dataRange$Date, dataRange$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot3.png", width = 480, height = 480)
Sub_metering_1 <- as.numeric(dataRange$Sub_metering_1)
plot(Date, Sub_metering_1, type = "l", ylab = "Energy Submetering", xlab = "")
Sub_metering_2 <- as.numeric(dataRange$Sub_metering_2)
lines(Date, Sub_metering_2, type = "l", col = "red")
Sub_metering_3 <- as.numeric(dataRange$Sub_metering_3)
lines(Date, Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 1, col = c("black", "red", "blue"))
dev.off()