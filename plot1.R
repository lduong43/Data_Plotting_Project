setwd("~/Technical/R/John Hopkins School of Public Health/ExploringData/Project1/Data_Plotting_Project")

library(sqldf)

fileconnection<-file("../household_power_consumption.txt")


import<-sqldf('select * from fileconnection 
              where Date = "1/2/2007" or Date = "2/2/2007"', 
              file.format = list (header=TRUE, sep = ";"))

close(fileconnection)

hist(import$Global_active_power, col="red",xlab="Global Active Power (kilowatts)", main = "Global Active Power")

dev.copy(png, file = "plot1.png",width=480, height=480) 
dev.off()

