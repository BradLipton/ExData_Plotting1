data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data.twodays <- subset(data,data$Date=="2007-02-01" | data$Date=="2007-02-02")

par(mfrow=c(2,2))

plot(data.twodays$Global_active_power,
     type="l", ylab="Global Active Power", xlab="", xaxt='n')
axis(1,c(0,1440,2880),c("Thu","Fri","Sat"))

plot(data.twodays$Voltage,type="l",
      ylab="Voltage", xlab="datetime", xaxt='n')
axis(1,c(0,1440,2880),c("Thu","Fri","Sat"))

plot(data.twodays$Sub_metering_1,type="l",
     ylab="Energy sub metering", xlab="", xaxt='n')
lines(data.twodays$Sub_metering_2,type="l",col="red")
lines(data.twodays$Sub_metering_3,type="l",col="blue")
axis(1,c(0,1440,2880),c("Thu","Fri","Sat"))
legend("topright",col=c("black","red","blue"), lty=c(1,1,1), cex=.7,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(data.twodays$Global_reactive_power,type="l",
      ylab="Global_reactive_power",xlab="datetime", xaxt='n')
axis(1,c(0,1440,2880),c("Thu","Fri","Sat"))

dev.copy(png,file="plot4.png")
dev.off()