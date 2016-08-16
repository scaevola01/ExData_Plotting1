plot1 <- function(x) {
  power <- read.csv("poweruse.txt", sep = ";", stringsAsFactors = FALSE)
  power$Date <- strptime(power$Date, "%d/%m/%Y")
  power <- subset(power, Date == "2007-02-01"|Date == "2007-02-02")
  power$newDate <- with(power, paste(Date, Time))
  png(filename = "plot1.png")
  hist(as.numeric(power$Global_active_power), main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
  dev.off()
}