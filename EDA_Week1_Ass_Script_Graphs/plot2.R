'Plot 2'

library(lubridate)
library(dplyr)


US_ELEC<-read.csv("household_power_consumption.txt",header = T,sep = ";",stringsAsFactors = F)

US_ELEC$Date<-dmy(US_ELEC$Date)
US_ELEC$Global_active_power<-as.numeric(US_ELEC$Global_active_powe)
US_ELEC$Time<-hms(US_ELEC$Time)

US_ELEC_V1<-subset(US_ELEC,year(US_ELEC$Date) == 2007 & month(US_ELEC$Date) == 2 & day(US_ELEC$Date) < 3)

png("plot2.png",width = 480,height = 480)

plot(US_ELEC_V1$Global_active_power,type = "l",
     lwd=2,axes = F,xlab = "",
     ylab = "Global Active Power")

axis(side=1,at=c(0,500,1000,1500,2000,2500),
     labels = c("Thu","","","Fri","","Sat"))

axis(side=2,at=c(0,2,4,6),labels = c("0","2","4","6"))

box()

dev.off()

