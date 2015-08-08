setwd("~/Technical/R/John Hopkins School of Public Health/ExploringData/Project1/Data_Plotting_Project")

library(sqldf)
library(lubridate)

fileconnection<-file("../household_power_consumption.txt")


import<-sqldf('select * from fileconnection 
              where Date = "1/2/2007" or Date = "2/2/2007"', 
              file.format = list (header=TRUE, sep = ";"))

close(fileconnection)

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
legend("topright", lty="solid", col = c("black","red", "blue") ,cex=0.7, text.width=50000
        , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
dev.copy(png, file = "plot3.png",width=480, height=480) 
dev.off()
