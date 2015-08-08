setwd("~/Technical/R/John Hopkins School of Public Health/ExploringData/Project1/Data_Plotting_Project")

library(sqldf)
library(lubridate)

fileconnection<-file("../household_power_consumption.txt")


import<-sqldf('select * from fileconnection 
              where Date = "1/2/2007" or Date = "2/2/2007"', 
              file.format = list (header=TRUE, sep = ";"))

close(fileconnection)


par(mfrow=c(2,2)
    ,mar=c(4.1, 4.1, 0.3, 2.1)
    ,ps=14)

#1st quadrant
plot (dmy_hms(paste(import$Date,import$Time , sep=" "))
      , import$Global_active_power 
      ,xlab=""
      ,ylab="Global Active Power"
      ,ty="lines")

#2nd quadrant
plot (dmy_hms(paste(import$Date,import$Time , sep=" "))
      , import$Voltage 
      ,xlab="datetime"
      ,ylab="Voltage"
        ,ty="lines")

#3rd quadrant
plot ( dmy_hms(paste(import$Date,import$Time , sep=" "))
       ,import$Sub_metering_1 
       ,type="n"
       ,xlab=""
       ,ylab="Energy Sub Metering")
lines(dmy_hms(paste(import$Date,import$Time , sep=" "))
      , import$Sub_metering_1, col="black")
lines(dmy_hms(paste(import$Date,import$Time , sep=" "))
      , import$Sub_metering_2, col="red")
lines(dmy_hms(paste(import$Date,import$Time , sep=" "))
      , import$Sub_metering_3, col="blue")
legend("topright"
       ,lty="solid"
       ,col = c("black","red", "blue"), bty="n"
       ,cex=0.9
       ,text.width=100000
       ,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#4th quadrant
plot (dmy_hms(paste(import$Date,import$Time , sep=" "))
      , import$Global_reactive_power 
      ,xlab="datetime"
      ,ty="lines"
      ,ylab="Global_reactive_power")


par(mfrow=c(1,1)
    ,mar=c(5.1, 4.1, 4.1, 2.1)
    ,ps=14)

dev.copy(png, file = "plot4.png",width=480, height=480) 
dev.off()
        

