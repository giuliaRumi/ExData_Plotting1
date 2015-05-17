plot2<- function(pathdata,pathsaveimg){
 
  data <- read.table(pathdata, header = TRUE, sep = ";")

  interest <- data[data$Date == "1/2/2007"|data$Date == "2/2/2007",]
  interest$Global_active_power <- as.numeric(as.character(interest$Global_active_power))
  interest$dateTime <- strptime(paste(interest$Date,interest$Time), "%d/%m/%Y %H:%M:%S")
  
  
  png(filename = pathsaveimg)
  par(bg=NA)
  plot(interest$dateTime, interest$Global_active_power, type = "n",main="Global Active Power",ylab = "Global Active Power (KiloWatt)", xlab="Time") 
  lines(interest$dateTime,interest$Global_active_power)
  dev.off()
}

plot2("/home/giulia/Documents/courses/02_RProgramming/project1/project1/household_power_consumption.txt",
      '/home/giulia/Documents/courses/02_RProgramming/project1/project1/plot2.png')
