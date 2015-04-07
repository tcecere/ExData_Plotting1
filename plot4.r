##Plot4, Course Project 1, Exploring Data
## Read and convert data to useful formats for plotting
##Note: I extracted Feb1-2 2007 from file and am just reading that

hpc_data<-read.csv2("household_power_consumption_Feb1-2.txt", na.strings="?", colClasses="character")
hpc_data$DateTime<-paste(hpc_data$Date, hpc_data$Time)
library(lubridate)
hpc_data$DateTime<-dmy_hms(hpc_data$DateTime)

##Change number fields from character to numeric
for (i in 3:9) {hpc_data[,i]<-as.numeric(hpc_data[,i])}

##set up png device
png(file="plot4.png")
par(mfrow=c(2,2))

##draw subplot #1
with(hpc_data, plot(DateTime, Global_active_power, type="l", xlab=""))

##draw subplot #2
with(hpc_data, plot(DateTime, Voltage, type="l", xlab="datetime", ylab= "Voltage"))

##draw subplot #3
with(hpc_data, {
     plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
     points(DateTime, Sub_metering_2, col="red", type="l")
     points(DateTime, Sub_metering_3, col="blue", type="l")
     legend("topright", col=c("black","red", "blue"), legend=colnames(hpc_data[7:9]), lwd=1, bty="n")
})
##draw subplot #4
with(hpc_data, plot(DateTime, Global_reactive_power, type="l", xlab="datetime"))

dev.off()


