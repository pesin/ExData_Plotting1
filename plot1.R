filename="household_power_consumption.txt"
data <- read.table(filename, header = TRUE, sep = ";", colClasses = c("character","NULL","numeric","NULL","NULL"
                                                                      ,"NULL","NULL","NULL","NULL"),na.strings = "?")
data <- data[ data$Date %in% c( "1/2/2007", "2/2/2007" ), ]

hist(data$Global_active_power, main="Global Active Power", col="red", xlab = "Global Active Power (kilowatts)")

png("plot1.png")
hist(data$Global_active_power, main="Global Active Power", col="red", xlab = "Global Active Power (kilowatts)")
dev.off()