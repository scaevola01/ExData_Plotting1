plot3 <- function(x) {
  power <- read.csv("poweruse.txt", sep = ";", stringsAsFactors = FALSE)
  power$Date <- strptime(power$Date, "%d/%m/%Y")
  power <- subset(power, Date == "2007-02-01"|Date == "2007-02-02")
  power$newDate <- with(power, paste(Date, Time))
  png(filename = "plot3.png")
  plot(as.POSIXct(power$newDate), power$Sub_metering_1, type='n', xlab = "", ylab = "Energy sub metering")
  lines(as.POSIXct(power$newDate), power$Sub_metering_1)
  lines(as.POSIXct(power$newDate), power$Sub_metering_2, col="red")
  lines(as.POSIXct(power$newDate), power$Sub_metering_3, col="blue")
  legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.off()
}
