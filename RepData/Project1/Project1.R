#########      Reproducible - Project 1
library(magrittr)
library(dplyr)
library(ggplot2)


######set directory

data <- read.csv("activity.csv")
d2 <- tbl_df(data)      #turns into data table 

### groups by date, then figures daily steps, then histogram

by_date <- group_by(d2, date)
sum_by_date <- summarize(by_date, Total_steps= sum(steps))
Daily_Steps <- sum_by_date$Total_steps

hist(Daily_Steps, breaks = 18, xlim = c(0,25000))                         # histogram of sum of steps

(DSMean <- round(as.numeric(mean(Daily_Steps, na.rm = TRUE)), 2))   ### calculate and print the daily mean and Median
(DSMedian <- as.numeric(median(Daily_Steps, na.rm = TRUE)))

############## END part 1  ######################
###Begin Part II ###########
### Calculate

by_interval <- group_by(d2, interval)
avg_by_interval <- summarize(by_interval, MeanStep = mean(na.omit(steps)))
plot(avg_by_interval, type = "l", xlab= "5 min time interval", ylab = "Avg. steps")       ### plot

Hi_Int <- arrange(avg_by_interval, desc(MeanStep))
print("Highest interval ")
print(Hi_Int[1,])    ###### print out the interval with the highest avg. steps

#### End PartII

### Begin Part III   ####
####count NAs in the d2 data table  then in each part
d2NAs <- sum(is.na(d2))
stepsNA <- sum(is.na(d2$steps))
dateNA <- sum(is.na(d2$date))
intervalNA <- sum(is.na(d2$interval))
## end of na counts

###  now to impute

dt_imp <- mutate(by_interval, imp = mean(steps, na.rm = TRUE))  ### create new column with mean of interval

# Replace the NAs with "imp" the imputed mean (by interval)
dt_imp$steps <- ifelse(is.na(dt_imp$steps),
                                 dt_imp$imp,       ### if true set to avg. from new column
                                 dt_imp$steps)     ####else set as before

# Remove the imputed column as it is no longer needed
dt_imp$imp <- NULL


by_date_imp <- group_by(dt_imp, date)
sum_by_date_imp <- summarize(by_date_imp, Total_Steps = sum(steps))
Daily_Steps_imp <- sum_by_date_imp$Total_Steps
hist(Daily_Steps_imp, breaks = 18, xlim = c(0,25000), ylim = c(0,20))                         # histogram of sum of steps

mean( Daily_Steps_imp)
median( Daily_Steps_imp  )

#########
###################


#### part IV Begin

days <- group_by(dt_imp, date)

###  Add the weekday/weekend column "weekday_end".
ddays <- days %>% mutate(weekday_end = ( ifelse( weekdays(as.POSIXct(date)) %in% c("Saturday","Sunday"), "Weekend", "Weekday") ) )
### change column to factor
ddays$weekday_end <- as.factor(ddays$weekday_end)                      

agg <- aggregate(x = ddays$steps, by = list(ddays$interval,ddays$weekday_end), FUN = mean )
names(agg) <- c("interval","weekday_end","steps")

aggPlot <- ggplot(agg,aes(interval,steps)) +
      ggtitle("Avg. Steps by Time Interval") +
      facet_grid(. ~ weekday_end) +
      geom_line(size = 1.3)
aggPlot

####END####
