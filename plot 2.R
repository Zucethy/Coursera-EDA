setwd("~/Personal Training")

#Reads in data from file then subsets data for specified dates
data <- read.table("household_power_consumption.txt", na.strings="?", sep = ';', header = T)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Filter Dates for  2007-02-01 and 2007-02-02
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

## Plot 1
plot(data$Global_active_power ~ as.POSIXct(data$datetime), xlab="Global Active Power (kilowatts)", type = "l", 
     ylab="Global Active Power (kilowatts)")


# Save file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()

