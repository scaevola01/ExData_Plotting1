plot2 <- function(x) {
  power <- read.csv("poweruse.txt", sep = ";", stringsAsFactors = FALSE)
  power$Date <- strptime(power$Date, "%d/%m/%Y")
  power <- subset(power, Date == "2007-02-01"|Date == "2007-02-02")
  power$newDate <- with(power, paste(Date, Time))
  png(filename = "plot2.png")
  plot(as.POSIXct(power$newDate), as.numeric(power$Global_active_power), type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
  dev.off()
}