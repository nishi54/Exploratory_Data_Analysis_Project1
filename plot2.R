setwd("/Users/Daniel/Documents")
upload <- "household_power_consumption.txt"
data <- read.table(upload, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
dataRange <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

Global_active_power <- as.numeric(dataRange$Global_active_power)
Date <- strptime(paste(subSetData$Date, subSetData$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
plot(Date, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
png("plot2.png", width = 480, height = 480)
dev.off()