memory_estimated <- 2075259*9*8/(10^9)
library(dplyr)
power<- read.table("./ExData_Plotting1/household_power_consumption.txt",skip = 1,sep = ";")
names(power)
head(power,16)
colnames(power)<- c("date", "Time","Global_active","Global_reactive","Voltage","Global_intencity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
tbl_df(power)
outcome<- filter(power, date %in% c("1/2/2007","2/2/2007"))

hist(as.numeric(as.character(outcome$Global_active)), col = "red",xlab = "Global Active Power(kilowatts)",main = "Global Active Power")


outcome$Specific <- strptime(paste(outcome$date,outcome$Time), format="%d/%m/%Y %H:%M:%S") 
with(outcome,(plot(Specific, as.numeric(as.character(Global_active)), type="l", xlab="", ylab="Global Active Power (kilowatts)")))

outcome$Specific <- strptime(paste(outcome$date,outcome$Time), format="%d/%m/%Y %H:%M:%S")         
