data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

pdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

doi <- data.frame(strptime(paste(pdata$Date, pdata$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), as.numeric(pdata$Sub_metering_1), as.numeric(pdata$Sub_metering_2), as.numeric(pdata$Sub_metering_3))

colnames(doi) <- c("DateTime", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")


png(file = "plot3.png", width = 480, height = 480)
ymax <- max(doi$Sub_metering_1, doi$Sub_metering_2, doi$Sub_metering_3)
plot(doi$DateTime, doi$Sub_metering_1, type = "l", ylim = c(0, ymax), xlab = "", ylab = "Energy sub metering")
par(new = TRUE)
plot(doi$DateTime, doi$Sub_metering_2, type = "l", ylim = c(0, ymax), xlab = "", ylab = "", col = "red")
par(new = TRUE)
plot(doi$DateTime, doi$Sub_metering_3, type = "l", ylim = c(0, ymax), xlab = "", ylab = "", col = "blue")
par(new = FALSE)
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)
dev.off()
