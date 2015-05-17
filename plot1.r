plot1<- function(pathdata,pathsaveimg){
  data <- read.table(pathdata, header = TRUE, sep = ";")

  interest <- data[data$Date == "1/2/2007"|data$Date == "2/2/2007",]
  interest$Global_active_power <- as.numeric(as.character(interest$Global_active_power))
  
  png(filename = pathsaveimg)
  hist(interest$Global_active_power, breaks = 24, col = "red",main="Global Active Power",xlab = "Global Active Power (KiloWatt)", ylab= "Frequency") 
  dev.off()
}

plot1("/home/giulia/Documents/courses/02_RProgramming/project1/project1/household_power_consumption.txt",
      '/home/giulia/Documents/courses/02_RProgramming/project1/project1/plot1.png')
