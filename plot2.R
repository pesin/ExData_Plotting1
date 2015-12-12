filename="data/household_power_consumption.txt"


#setClass('timeClass')
#setAs("character","timeClass", function(from) as.POSIXct(strptime(from, '%H:%M:%S'))  )

data <- read.table(filename, header = TRUE, sep = ";", colClasses = c("character","character","numeric","NULL","NULL"
                                                                      ,"NULL","NULL","NULL","NULL"),na.strings = "?")
data <- data[ data$Date %in% c( "1/2/2007", "2/2/2007" ), ]

data["DateTime"]<-as.POSIXct(strptime(paste(data$Date,  data$Time), format="%d/%m/%Y %H:%M:%S"))

#plot(data$DateTime, data$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)",
 #    xlab=" ")


png("plot2.png",width = 480 ,height = 480)
plot(data$DateTime, data$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)",
     xlab=" ")

dev.off()