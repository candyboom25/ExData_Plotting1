file<- fread("household_power_consumption.txt", na.strings = "?", stringsAsFactors = FALSE)
newfile<- subset(file, file$Date == "1/2/2007" | file$Date == "2/2/2007")

newfile$Global_active_power <- as.numeric(as.character(newfile$Global_active_power))

newfile$Date = as.Date(newfile$Date, format = "%d/%m/%Y")
datetime = paste((newfile$Date),newfile$Time)
newfile$Datetime<- as.POSIXct(datetime)

png("plot2.png", width = 480, height = 480)
plot(newfile$Datetime, newfile$Global_active_power, xlab = "", ylab = "Global Active Power(kilowatts)", type ="l")
dev.off()