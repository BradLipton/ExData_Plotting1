data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data.twodays <- subset(data,data$Date=="2007-02-01" | data$Date=="2007-02-02")
plot(data.twodays$Global_active_power,
      type="l", ylab="Global Active Power (kilowatts)", xlab="", xaxt='n')
axis(1,c(0,1440,2880),c("Thu","Fri","Sat"))
dev.copy(png,file="plot2.png")
dev.off()
