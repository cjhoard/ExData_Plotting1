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
png(filename="plot3.png",width = 480, height = 480, units = "px", pointsize = 12,type="cairo")
with(powerdat, plot(datetime,Sub_metering_1,ylab='Energy sub metering',xlab='',type='l'))
with(powerdat, lines(datetime,Sub_metering_2,ylab='Energy sub metering',xlab='',col='#FF2500'))
with(powerdat, lines(datetime,Sub_metering_3,ylab='Energy sub metering',xlab='',col='blue'))
legend('topright',lty=c(1,1,1),col=c('black','#FF2500','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.off()
