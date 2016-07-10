data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

pdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

png(file = "plot1.png", width = 480, height = 480)
hist(as.numeric(pdata$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Acrtive Power (kilowatts)")
dev.off()
