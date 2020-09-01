setwd("C:/Users/nirma/Documents/GitHub/ExData_Plotting1")
#.png to store at ("C:/Users/nirma/Documents/GitHub/ExData_Plotting1/figure")

#Reading Data
readingtxt<-read.csv("C:/Users/nirma/Documents/GitHub/ExData_Plotting1/data.txt"
                        ,sep=";",header=T)
#Checking Data
head(readingtxt)

# Setting Date Limit
dataf<-readingtxt[readingtxt$Date%in%c("1/2/2007","2/2/2007"),] 
head(dataf)
settime<-strptime(paste(dataf$Date,dataf$Time,sep=" "),"%d/%m/%y %H:%M:%S")
head(settime)

#Combining the tables and creating final data set
finaldata<-cbind(settime,dataf)
head(finaldata)
finaldata<-readingtxt[readingtxt$Date %in% c("1/2/2007","2/2/2007"),]

#Creating first .png file and saving it in a folder
glbactpower<-as.numeric(finaldata$Global_active_power)
png("C:/Users/nirma/Documents/GitHub/ExData_Plotting1/figure/plot1.png",
    width=480,height=480)
hist(glbactpower,xlab="Global Active Power (Kilowatts)",ylab="Frequency",
     main="Global Active Power",col="red")
dev.off()

