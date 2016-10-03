setwd("/Users/Daniel/Documents")
upload <- "household_power_consumption.txt"
data <- read.table(upload, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
dataRange <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

Global_active_power <- as.numeric(dataRange$Global_active_power)
png(name = "plot1.png", width = 480, height = 480)
hist(Global_active_power, main="Global Active Power", col = "red", xlab= "Global Active Power (kilowatts)")
dev.off()
