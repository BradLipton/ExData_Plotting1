data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data.twodays <- subset(data,data$Date=="2007-02-01" | data$Date=="2007-02-02")
hist(data.twodays$Global_active_power, 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power",
     col="red")
dev.copy(png,file="plot1.png")
dev.off()
