library(data.table)
library(grDevices)

png(filename="Plot1.png", width=480, height=480, bg="dark gray")
DT <- fread("household_power_consumption.txt", header=TRUE, sep=";", na.strings=c("?","NA"))
setkey(DT, Date)
DT2 <- DT[c("1/2/2007", "2/2/2007")]
p1 <- DT2[,as.numeric(Global_active_power)]
hist(p1, col="red", xlab="Global active Power (kilowatts)", main="Global Active Power")
dev.off()




