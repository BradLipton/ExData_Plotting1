data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data.twodays <- subset(data,data$Date=="2007-02-01" | data$Date=="2007-02-02")
plot(data.twodays$Sub_metering_1,type="l",
      ylab="Energy sub metering", xlab="", xaxt='n')
lines(data.twodays$Sub_metering_2,type="l",col="red")
lines(data.twodays$Sub_metering_3,type="l",col="blue")
axis(1,c(0,1440,2880),c("Thu","Fri","Sat"))
legend("topright",col=c("black","red","blue"), lty=c(1,1,1),
      legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file="plot3.png")
dev.off()