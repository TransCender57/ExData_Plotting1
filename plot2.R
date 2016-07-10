data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

pdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

doi <- data.frame(strptime(paste(pdata$Date, pdata$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), as.numeric(pdata$Global_active_power))

colnames(doi) <- c("DateTime", "Global_active_power")

png(file = "plot2.png", width = 480, height = 480)
plot(doi$DateTime, doi$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()


