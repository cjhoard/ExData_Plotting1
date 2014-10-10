######################################################
#This code downloads and plots power data for the 
#coursera Exploratory Data Analysis class
#######################################################
#require package to easily translate character dates to actual dates.
require(lubridate)
#Download the file
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"),header=TRUE,sep=";",na.strings=c("NA","?"),stringsAsFactors=FALSE)
unlink(temp)

#Subset the data that we actually need
powerdat<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")
powerdat$datetime<-dmy_hms(paste(powerdat$Date,powerdat$Time,sep=' '))


#Build the time series of global active power from 2/1-2/2/2007
png(filename="plot2.png",width = 480, height = 480, units = "px", pointsize = 12,type="windows")
plot(powerdat$datetime,powerdat$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab='')
dev.off()
