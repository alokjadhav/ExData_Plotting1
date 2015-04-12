dir <- "S:/Online_courses/DataScience_Specialization/4_Exploratory_Data_Analysis/proj1"
setwd(dir)


#data
filename <- "household_power_consumption.txt"
data <- read.csv(filename,sep=";",stringsAsFactors=FALSE,na.strings="?")
data$Time <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")

from.date <- as.Date("2007-02-01")
to.date <- as.Date("2007-02-02")
i <- data$Date == from.date | data$Date == to.date
data <- data[i,]

#plot4.R
output <- "plot4.png"
par(mfrow = c(2,2))
#1
with(data, plot(Time, Global_active_power, type="l", ylab="Global Active Power (kilowatts)"))
#2
with(data, plot(Time, Voltage, type="l", ylab="Voltage"))
#3
with(data, plot(Time, Sub_metering_1 , type="l", ylab="Enery sub metering"))
with(data, lines(Time, Sub_metering_2, col="red"))
with(data, lines(Time, Sub_metering_3, col="blue"))
legend("topright",lty=c(1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#4
with(data, plot(Time, Global_reactive_power, type="l", ylab="Global Reactive Power (kilowatts)"))

dev.copy(png, output)
dev.off()

rm(data)

