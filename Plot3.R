consumption<-read.csv("household_power_consumption.txt",sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
consumption <- within(consumption, Datetime <- strptime(paste(consumption$Date,consumption$Time),format="%d/%m/%Y %H:%M:%S"))
fechas <- which(format(consumption$Datetime,"%Y-%m-%d")=="2007-02-01"|format(consumption$Datetime,"%Y-%m-%d")=="2007-02-02")


consumption<-consumption[fechas,]

with(consumption,plot(Datetime,Sub_metering_1,main="Sub metering",type="l",ylab="Energy sub metering"))
with(consumption,lines(Datetime,Sub_metering_2,col="red"))
with(consumption,lines(Datetime,Sub_metering_3,col="blue"))
legend("topright",pch="-",col=c("red","red","blue"),legend=c("Sub metering 1","Sub metering 2","Sub metering 3"))


dev.copy(png,file="Plot3.png")
dev.off()
