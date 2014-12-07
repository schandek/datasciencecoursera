library(data.table)
library(grDevices)

png(filename="Plot4.png", width=480, height=480, bg="dark gray")

DT <- fread("household_power_consumption.txt", header=TRUE, sep=";", na.strings=c("?","NA"))
setkey(DT, Date)
DT2 <- DT[c("1/2/2007", "2/2/2007")]
gap <- DT2[,as.numeric(Global_active_power)]
grp <- DT2[,as.numeric(Global_reactive_power)]
v <- DT2[,as.numeric(Voltage)]
dt <- strptime(paste(DT2$Date, DT2$Time), "%d/%m/%Y %H:%M:%S")

sm1 <- DT2[,as.numeric(Sub_metering_1)]
sm2 <- DT2[,as.numeric(Sub_metering_2)]
sm3 <- DT2[,as.numeric(Sub_metering_3)]

par(mfrow=c(2,2))
plot(dt,gap, type="l", col="black", xlab="datetime", ylab="Global_active_power")
plot(dt,v, type="l", col="black", xlab="datetime", ylab="Voltage")
plot(dt,sm1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(dt,sm2,type="l",col="red")
lines(dt,sm3,type="l",col="blue")
legend("topright",lty="solid", bty="n",col= c("black","red","blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(dt,grp, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")

dev.off()


