library(data.table)
power=fread("household_power_consumption.txt",na.strings=c("?",""))
##Date1="01/02/2007"
##Date2="02/02/2007"
Date1=as.Date("01/02/2007","%d/%m/%Y")
Date2=as.Date("02/02/2007","%d/%m/%Y")
power$Date<-as.Date(power$Date,"%d/%m/%Y")
temp<-power[power$Date==Date1|power$Date==Date2,]
temp$Sub_metering_1<-as.numeric(temp$Sub_metering_1)
temp$Sub_metering_2<-as.numeric(temp$Sub_metering_2)
temp$Sub_metering_3<-as.numeric(temp$Sub_metering_3)
date_time<-paste(as.character(temp$Date),temp$Time)
date_time<-strptime(date_time,  "%Y-%m-%d %H:%M:%S")##convert the time
##create a png file
png(file="plot3.png")
plot(date_time,temp$Sub_metering_1,xlab="",ylab="Energy sub metering",pch = 27)
lines(date_time,temp$Sub_metering_1)##draw lines bewteen those points
##plot(date_time,temp$Sub_metering_2,pch = 27)
lines(date_time,temp$Sub_metering_2,col="red")
##plot(date_time,temp$Sub_metering_3,pch = 27)
lines(date_time,temp$Sub_metering_3,col="blue")
legend("topright", lty=c(1,1,1), col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()