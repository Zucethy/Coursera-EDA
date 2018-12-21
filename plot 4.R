setwd("~/Personal Training")

#Reads in data from file then subsets data for specified dates
data <- read.table("household_power_consumption.txt", na.strings="?", sep = ';', header = T)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Filter Dates for  2007-02-01 and 2007-02-02
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

## Plot 1
par(mfrow = c(2, 2))
plot(data$Global_active_power ~ as.POSIXct(data$datetime), type = "l", ylab = "Global Active Power", xlab = "")
plot(data$Voltage ~ as.POSIXct(data$datetime), type = "l")
plot(data$Sub_metering_1 ~ as.POSIXct(data$datetime), type = "l",  ylab = "Energy sub metering", xlab = "")
lines(data$Sub_metering_2 ~ as.POSIXct(data$datetime), col = "Red")
lines(data$Sub_metering_3 ~ as.POSIXct(data$datetime), col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(data$Global_active_power ~ as.POSIXct(data$datetime), type = "l")

# Save file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()

