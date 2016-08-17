plot1 <- function(x) {
  #Read in the data
  power <- read.csv("poweruse.txt", sep = ";", stringsAsFactors = FALSE)
  
  #Subset the dates
  power$Date <- strptime(power$Date, "%d/%m/%Y")
  power <- subset(power, Date == "2007-02-01"|Date == "2007-02-02")
  
  #Get the right time associated with the dates, so that it plots correctly
  power$newDate <- with(power, paste(Date, Time))
  
  #Plot the graph
  png(filename = "plot1.png")
  hist(as.numeric(power$Global_active_power), main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
  dev.off()
}
