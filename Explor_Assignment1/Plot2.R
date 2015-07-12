### Plot 2 - Global Active Power line graph
### Extract and sort data
dab <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE, dec = ".", header=TRUE)
dab2 <- dab[which(dab$Date == "1/2/2007" | dab$Date == "2/2/2007"), ]

GAP <- dab2$Global_active_power

##  extract date and time, and combine in a vector
tDate <- dab2$Date
tTime <- dab2$Time
tComb <- paste(tDate, tTime)
### convert to time class
DTs <- strptime(tComb, "%d/%m/%Y %H:%M:%S")
png(file = "Plot2.png", width = 480, height = 480)

###  plot GAP over time
plot(DTs, GAP, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
#### END