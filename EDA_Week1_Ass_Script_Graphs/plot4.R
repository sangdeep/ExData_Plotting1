'Plot 4'

library(lubridate)
library(dplyr)


US_ELEC<-read.csv("household_power_consumption.txt",header = T,sep = ";",stringsAsFactors = F)


US_ELEC$Date<-dmy(US_ELEC$Date)
US_ELEC$Global_active_power<-as.numeric(US_ELEC$Global_active_powe)
US_ELEC$Time<-hms(US_ELEC$Time)

US_ELEC_V1<-subset(US_ELEC,year(US_ELEC$Date) == 2007 & month(US_ELEC$Date) == 2 & day(US_ELEC$Date) < 3)

png("plot4.png",width = 480,height = 480)

par(mfrow=c(2,2))

'p4 - part 1'

plot(US_ELEC_V1$Global_active_power,type = "l",
     axes = F,xlab = "",
     ylab = "Global Active Power")

axis(side=1,at=c(0,500,1000,1500,2000,2500),
     labels = c("Thu","","","Fri","","Sat"))

axis(side=2,at=c(0,2,4,6),labels = c("0","2","4","6"))

box()


'p4 - part 2'

plot(US_ELEC_V1$Voltage,type = "l",
     axes = F,xlab = "",
     ylab = "Voltage")

axis(side=1,at=c(0,500,1000,1500,2000,2500),
     labels = c("Thu","","","Fri","","Sat"))

axis(side=2,at=c(234,238,242,246),labels = c("234","238","242","246"))

box()

'p4 - part 3'

plot(US_ELEC_V1$Sub_metering_3,
     lwd=2,xlab = "",axes=F,
     ylab = "Energy Sub Metering",type = "n",ylim = c(0,40))

with(US_ELEC_V1,lines(Sub_metering_1,lwd=2,col = "black"))
with(US_ELEC_V1,lines(Sub_metering_2,lwd=2,col = "red"))
with(US_ELEC_V1,lines(Sub_metering_3,lwd=2,col = "blue"))

legend("topright",pch = c("-","-","-"),col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

axis(side=1,at=c(0,500,1000,1500,2000,2500),
     labels = c("Thu","","","Fri","","Sat"))

axis(side=2,at=c(0,10,20,30,40),labels = c("0","10","20","30",""))

box()


'p4 - part 4'

plot(US_ELEC_V1$Global_reactive_power,type = "l",
     axes = F,xlab = "",
     ylab = "Global Reactive Power")

axis(side=1,at=c(0,500,1000,1500,2000,2500),
     labels = c("Thu","","","Fri","","Sat"))

axis(side=2,at=c(0.0,"",0.2,"",0.4,0.5),labels = c("0.0","0.1","0.2","0.3","0.4","0.5"))

box()
dev.off()

