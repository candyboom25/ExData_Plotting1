file<- fread("household_power_consumption.txt", na.strings = "?", stringsAsFactors = FALSE)
newfile<- subset(file, file$Date == "1/2/2007" | file$Date == "2/2/2007")

newfile$Global_active_power <- as.numeric(as.character(newfile$Global_active_power))

png("plot1.png", width = 480, height = 480)
hist(newfile$Global_active_power, xlab = "Global Active Power(kilowatts)", main = "Global Active Power", col = "red")
dev.off()
    