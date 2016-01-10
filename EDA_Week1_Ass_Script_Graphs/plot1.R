'Plot 1'

library(lubridate)
library(dplyr)

par(mfrow = c(1,1))

US_ELEC<-read.csv("household_power_consumption.txt",header = T,sep = ";",stringsAsFactors = F)

US_ELEC$Date<-dmy(US_ELEC$Date)
US_ELEC$Global_active_power<-as.numeric(US_ELEC$Global_active_powe)
US_ELEC$Time<-hms(US_ELEC$Time)

US_ELEC_V1<-subset(US_ELEC,year(US_ELEC$Date) == 2007 & month(US_ELEC$Date) == 2 & day(US_ELEC$Date) < 3)

png("plot1.png",width = 480,height = 480)

hist(US_ELEC_V1$Global_active_power
    ,col = "red",xlab = "Global Active Power"
    ,ylab = "Frequency"
    ,main = "Global Active Power")

dev.off()


