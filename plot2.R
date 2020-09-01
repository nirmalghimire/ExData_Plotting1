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

#Creating second .png file and saving it
png("C:/Users/nirma/Documents/GitHub/ExData_Plotting1/figure/plot2.png",
    width=480,height=480)
plot(sub$datetime,sub$Global_active_power, type="l", col="black",
     xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
