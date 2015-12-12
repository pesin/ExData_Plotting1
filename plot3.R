filename="data/household_power_consumption.txt"


#setClass('timeClass')
#setAs("character","timeClass", function(from) as.POSIXct(strptime(from, '%H:%M:%S'))  )

data <- read.table(filename, header = TRUE, sep = ";", colClasses = c("character","character","NULL",
                                                                      "NULL","NULL"
                                                                      ,"NULL","numeric",
                                                                      "numeric","numeric"),na.strings = "?")
data <- data[ data$Date %in% c( "1/2/2007", "2/2/2007" ), ]

data["DateTime"]<-as.POSIXct(strptime(paste(data$Date,  data$Time), format="%d/%m/%Y %H:%M:%S"))




png("plot3.png",width = 480 ,height = 480)
plot(data$DateTime, data$Sub_metering_1,type="n",ylab = "Energy sub metering",
     xlab=" ")
lines(data$DateTime, data$Sub_metering_1, type="l", col="black")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")

legend("topright", pch = "-", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.off()