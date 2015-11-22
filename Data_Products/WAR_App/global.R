#### Global.R
### read in the data and make it available to both ui.R and server.R


WARs <- read.csv('Data/WARs.csv')
rownames(WARs)  <- WARs[,1]
WARs[,1] <- NULL

WARs['3YrAvg', ]  <- (colSums(WARs)/3)
