### Plot 4  - 4 graphs/plots arranged
dab <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE, dec = ".", header=TRUE)
dab2 <- dab[which(dab$Date == "1/2/2007" | dab$Date == "2/2/2007"), ]

png(file = "Plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))   ### creates 'frame' for two row, two column of graphs.

### Global Active Power goes upper left
plot(DTs, dab2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")


### Voltage/datetime goes upper right
plot(DTs, dab2$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

### Energy sub metering goes lower left
plot(DTs, Sub1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(DTs, Sub2, col = "red")
lines(DTs, Sub3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", lty=c("solid", "solid", "solid"), col=c("black", "red", "blue"), cex = .7)
#### bty gets rid of box outline, cex scales in relation to default.

### Global_reactive_power goes lower right
plot(DTs, dab2$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
#### End plot 4