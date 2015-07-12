######  Plot 3    Graph of sub_metering

### Get data
dab <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE, dec = ".", header=TRUE)
dab2 <- dab[which(dab$Date == "1/2/2007" | dab$Date == "2/2/2007"), ]


par(mfrow= c(1,1))           ##### create 'frame' for plot - this is the default, but just to be safe...
### extract, combine and create time vector
tDate <- dab2$Date
tTime <- dab2$Time
tComb <- paste(tDate, tTime)

DTs <- strptime(tComb, "%d/%m/%Y %H:%M:%S")

### extract individual meter readings
Sub1 <- dab2$Sub_metering_1
Sub2 <- dab2$Sub_metering_2
Sub3 <- dab2$Sub_metering_3

### plot then add lines and the pesky legend.
png(file = "Plot3.png", width = 480, height = 480)
plot(DTs, Sub1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(DTs, Sub2, col = "red")
lines(DTs, Sub3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c("solid", "solid", "solid"), col=c("black", "red", "blue"), cex = 1)
dev.off()
######### END