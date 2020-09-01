setwd("C:/Users/nirma/Documents/GitHub/ExData_Plotting1")
#.png to store at ("C:/Users/nirma/Documents/GitHub/ExData_Plotting1/figure")

#Reading Data
readingtxt<-read.csv("C:/Users/nirma/Documents/GitHub/ExData_Plotting1/data.txt"
                     ,sep=";",header=T)
#Checking Data
head(readingtxt)

# Subsetting Date Limit
sub<-subset(readingtxt,(readingtxt$Date=="1/2/2007"|readingtxt$Date=="2/2/2007"))
head(sub)

#Changing the class of date to date
sub$Date<-as.Date(sub$Date,format="%d/%m/%y")

#Creating new datetime column
sub$datetime<-as.POSIXct(paste(sub$Date,sub$Time))
head(sub$datetime)

#Creating Plot 4
png("C:/Users/nirma/Documents/GitHub/ExData_Plotting1/figure/plot4.png",
    width=480,height=480)

#Adjusting 4 plots (2X2)
par(mfrow=c(2,2))
plot(sub$datetime,sub$Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering")
lines(sub$datetime,sub$Sub_metering_2,type="l",col="red")
lines(sub$datetime,sub$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_Metering_3"),lty=1,
       col=c("black","red","blue"))
plot(sub$datetime,sub$Global_active_power, type="l",lwd=1,xlab="",ylab="Global 
     Active Power(Kilowatts)")
plot(sub$datetime,sub$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(sub$datetime,sub$Global_reactive_power,type="l",xlab="datetime",
     ylab="Global_Reactive_Power")
dev.off()