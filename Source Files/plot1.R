library(data.table)
power=fread("household_power_consumption.txt",na.strings=c("?",""))
##Date1="01/02/2007"
##Date2="02/02/2007"
Date1=as.Date("01/02/2007","%d/%m/%Y")
Date2=as.Date("02/02/2007","%d/%m/%Y")
power$Date<-as.Date(power$Date,"%d/%m/%Y")
temp<-power[power$Date==Date1|power$Date==Date2,]
temp$Global_active_power<-as.numeric(temp$Global_active_power)
png(file="plot1.png")
with(temp,hist(Global_active_power, main = "Global Active Power",xlab="Global Active Power(kilowatts)",col="red"))
dev.off()

