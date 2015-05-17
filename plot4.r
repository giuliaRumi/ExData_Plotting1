plot4<- function(pathdata,pathsaveimg){
  data <- read.table(pathdata, header = TRUE, sep = ";")
  
  interest <- data[data$Date == "1/2/2007"|data$Date == "2/2/2007",]
  interest$Global_active_power <- as.numeric(as.character(interest$Global_active_power))
  interest$Sub_metering_1 <- as.numeric(as.character(interest$Sub_metering_1))
  interest$Sub_metering_2 <- as.numeric(as.character(interest$Sub_metering_2))
  interest$dateTime <- strptime(paste(interest$Date,interest$Time), "%d/%m/%Y %H:%M:%S")
  interest$Voltage <- as.numeric(as.character(interest$Voltage))
  interest$Global_reactive_power <- as.numeric(as.character(interest$Global_reactive_power))
  
  png(filename = pathsaveimg)
  par(bg=NA)
  par(mfrow = c(2, 2))
  plot(interest$dateTime, interest$Global_active_power, type = "n",ylab = "Global Active Power", xlab = "") 
  lines(interest$dateTime,interest$Global_active_power)
  plot(interest$dateTime, interest$Voltage, type = "n",ylab = "Voltage", xlab="datetime") 
  lines(interest$dateTime,interest$Voltage)
  plot(interest$dateTime, interest$Sub_metering_1, type = "n",ylab = "Energy sub metering", xlab = "") 
  lines(interest$dateTime,interest$Sub_metering_1)
  lines(interest$dateTime,interest$Sub_metering_2, col = "red")
  lines(interest$dateTime,interest$Sub_metering_3, col = "blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","blue","red"))
  plot(interest$dateTime, interest$Global_reactive_power, type = "n",ylab = "Global_reactive_power", xlab="datetime") 
  lines(interest$dateTime,interest$Global_reactive_power)
  dev.off()
}


plot4("/home/giulia/Documents/courses/02_RProgramming/project1/project1/household_power_consumption.txt",
      '/home/giulia/Documents/courses/02_RProgramming/project1/project1/plot4.png')