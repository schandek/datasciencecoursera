library(data.table)
library(grDevices)
png(filename="Plot2.png", width=480, height=480, bg="dark gray")
DT <- fread("household_power_consumption.txt", header=TRUE, sep=";", na.strings=c("?","NA"))
setkey(DT, Date)
DT2 <- DT[c("1/2/2007", "2/2/2007")]
p1 <- DT2[,as.numeric(Global_active_power)]
p2 <- strptime(paste(DT2$Date, DT2$Time), "%d/%m/%Y %H:%M:%S")
plot(p2,p1, type="l", xlab="", ylab="Global active Power (kilowatts)")
dev.off()