##Plot 1 - 

## read in data
dab <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE, dec = ".", header=TRUE)
## subset of desired dates
dab2 <- dab[which(dab$Date == "1/2/2007" | dab$Date == "2/2/2007"), ]
## create string of desired variable
GAP <- dab2$Global_active_power

png(file = "Plot1.png", width = 480, height = 480)
## create histogram
hist(GAP, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()   #### 

############END