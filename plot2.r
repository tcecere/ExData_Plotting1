##Plot2, Course Project 1, Exploring Data
## Read and convert data to useful formats for plotting
##Note: I extracted Feb1-2 2007 from file and am just reading that

hpc_data<-read.csv2("household_power_consumption_Feb1-2.txt", na.strings="?", colClasses="character")
hpc_data$DateTime<-paste(hpc_data$Date, hpc_data$Time)
library(lubridate)
hpc_data$DateTime<-dmy_hms(hpc_data$DateTime)

##Change number fields from character to numeric
for (i in 3:9) {hpc_data[,i]<-as.numeric(hpc_data[,i])}

##set up png device
png(file="plot2.png")

##draw plot
with(hpc_data, plot(DateTime, Global_active_power, type="l", xlab="", ylab= "Global Active Power (killowatts)"))

dev.off()


