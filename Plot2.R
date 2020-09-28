consumption<-read.csv("household_power_consumption.txt",sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
consumption <- within(consumption, Datetime <- strptime(paste(consumption$Date,consumption$Time),format="%d/%m/%Y %H:%M:%S"))
fechas <- which(format(consumption$Datetime,"%Y-%m-%d")=="2007-02-01"|format(consumption$Datetime,"%Y-%m-%d")=="2007-02-02")


consumption<-consumption[fechas,]
plot(consumption$Datetime,consumption$Global_active_power,type="l",xlab="Global active power(kilowatts)")
dev.copy(png,file="Plot2.png")
dev.off()
