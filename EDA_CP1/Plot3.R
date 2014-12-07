library(data.table)
library(grDevices)
png(filename="Plot3.png", width=480, height=480, bg=" dark gray")
DT <- fread("household_power_consumption.txt", header=TRUE, sep=";", na.strings=c("?","NA"))
setkey(DT, Date)
DT2 <- DT[c("1/2/2007", "2/2/2007")]
p1 <- DT2[,as.numeric(Global_active_power)]
p2 <- strptime(paste(DT2$Date, DT2$Time), "%d/%m/%Y %H:%M:%S")
s1 <- DT2[,as.numeric(Sub_metering_1)]
s2 <- DT2[,as.numeric(Sub_metering_2)]
s3 <- DT2[,as.numeric(Sub_metering_3)]
plot(p2,s1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(p2,s2,type="l",col="red")
lines(p2,s3,type="l",col="blue")
legend("topright",lty="solid", col= c("black","red","blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()