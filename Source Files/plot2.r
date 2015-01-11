library(data.table)
power=fread("household_power_consumption.txt",na.strings=c("?",""))
##Date1="01/02/2007"
##Date2="02/02/2007"
Date1=as.Date("01/02/2007","%d/%m/%Y")
Date2=as.Date("02/02/2007","%d/%m/%Y")
power$Date<-as.Date(power$Date,"%d/%m/%Y")
temp<-power[power$Date==Date1|power$Date==Date2,]
temp$Global_active_power<-as.numeric(temp$Global_active_power)
date_time<-paste(as.character(temp$Date),temp$Time)
date_time<-strptime(date_time,  "%Y-%m-%d %H:%M:%S")##convert the time
##temp<-temp[,date_time:=date_time]
png(file="plot2.png")##create a png file
plot(date_time,temp$Global_active_power,xlab="",ylab="Global Active Power(kilowatts)",pch=27)
lines(date_time,temp$Global_active_power)##draw lines bewteen those points
dev.off()