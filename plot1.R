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


#plot1.R
output <- "plot1.png"
with(data, hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.copy(png, output)
dev.off()


rm(data)