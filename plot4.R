file<- fread("household_power_consumption.txt", na.strings = "?", stringsAsFactors = FALSE)
newfile<- subset(file, file$Date == "1/2/2007" | file$Date == "2/2/2007")

newfile$Global_active_power <- as.numeric(as.character(newfile$Global_active_power))

newfile$Date = as.Date(newfile$Date, format = "%d/%m/%Y")
datetime = paste((newfile$Date),newfile$Time)
newfile$Datetime<- as.POSIXct(datetime)



png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(newfile$Datetime, newfile$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")

plot(newfile$Datetime, newfile$Voltage, xlab = "datetime", type = "l")

plot(newfile$Datetime, newfile$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type ="l")
lines(newfile$Datetime, newfile$Sub_metering_2, col = "red")
lines(newfile$Datetime, newfile$Sub_metering_3, col = "blue")
legend("topright", lty =1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red","blue"))

plot(newfile$Datetime, newfile$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type ="l")

dev.off()