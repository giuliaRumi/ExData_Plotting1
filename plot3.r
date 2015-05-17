plot3<- function(pathdata,pathsaveimg){
    
  data <- read.table(pathdata, header = TRUE, sep = ";")
  
  interest <- data[data$Date == "1/2/2007"|data$Date == "2/2/2007",]
  interest$Sub_metering_1 <- as.numeric(as.character(interest$Sub_metering_1))
  interest$Sub_metering_2 <- as.numeric(as.character(interest$Sub_metering_2))
  interest$dateTime <- strptime(paste(interest$Date,interest$Time), "%d/%m/%Y %H:%M:%S")
  
  
  png(filename = pathsaveimg)
  par(bg=NA)
  plot(interest$dateTime, interest$Sub_metering_1, type = "n",main="Energy sub metering",ylab = "Energy sub metering", xlab="Time") 
  lines(interest$dateTime,interest$Sub_metering_1)
  lines(interest$dateTime,interest$Sub_metering_2, col = "red")
  lines(interest$dateTime,interest$Sub_metering_3, col = "blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","blue","red"))
  dev.off()
}

plot3("/home/giulia/Documents/courses/02_RProgramming/project1/project1/household_power_consumption.txt",
      '/home/giulia/Documents/courses/02_RProgramming/project1/project1/plot3.png')