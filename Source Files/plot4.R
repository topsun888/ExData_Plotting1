library(data.table)
power=fread("household_power_consumption.txt",na.strings=c("?",""))
##Date1="01/02/2007"
##Date2="02/02/2007"
Date1=as.Date("01/02/2007","%d/%m/%Y")
Date2=as.Date("02/02/2007","%d/%m/%Y")
##convert characters to numerics
power$Date<-as.Date(power$Date,"%d/%m/%Y")
temp<-power[power$Date==Date1|power$Date==Date2,]
temp$Global_active_power<-as.numeric(temp$Global_active_power)
temp$Sub_metering_1<-as.numeric(temp$Sub_metering_1)
temp$Sub_metering_2<-as.numeric(temp$Sub_metering_2)
temp$Sub_metering_3<-as.numeric(temp$Sub_metering_3)
temp$Voltage<-as.numeric(temp$Voltage)
temp$Global_reactive_power<-as.numeric(temp$Global_reactive_power)
date_time<-paste(as.character(temp$Date),temp$Time)
date_time<-strptime(date_time,  "%Y-%m-%d %H:%M:%S")##convert the time

##Drawing the plots
##create a png file
png(file="plot4.png")
par(mfrow=c(2,2))
##The first plot
plot(date_time,temp$Global_active_power,xlab="",ylab="Global Active Power",pch=27)
lines(date_time,temp$Global_active_power)##draw lines bewteen those points
##The second plot
plot(date_time,temp$Voltage,xlab="datetime",ylab="Voltage",pch=27)
lines(date_time,temp$Voltage)##draw lines bewteen those points
##The third plot
plot(date_time,temp$Sub_metering_1,xlab="",ylab="Energy sub metering",pch = 27)
lines(date_time,temp$Sub_metering_1)##draw lines bewteen those points
lines(date_time,temp$Sub_metering_2,col="red")
lines(date_time,temp$Sub_metering_3,col="blue")
legend("topright", lty=c(1,1,1), bty="n",col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
##The fourth plot
plot(date_time,temp$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",pch=27)
lines(date_time,temp$Global_reactive_power)
dev.off()

