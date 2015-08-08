setwd("~/Technical/R/John Hopkins School of Public Health/ExploringData/Project1/Data_Plotting_Project")

library(sqldf)
library(lubridate)

fileconnection<-file("../household_power_consumption.txt")


import<-sqldf('select * from fileconnection 
              where Date = "1/2/2007" or Date = "2/2/2007"', 
              file.format = list (header=TRUE, sep = ";"))

close(fileconnection)

plot (dmy_hms(paste(import$Date,import$Time , sep=" "))
        ,import$Global_active_power 
        ,xlab=""
        ,ylab="Global Active Power (kilowatts)"
        ,ty="lines")

dev.copy(png, file = "plot2.png",width=480, height=480) 
dev.off()
