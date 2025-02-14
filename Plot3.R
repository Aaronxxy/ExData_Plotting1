library(dplyr)
power<- read.table("./ExData_Plotting1/household_power_consumption.txt",skip = 1,sep = ";")
names(power)
head(power,16)
colnames(power)<- c("date", "Time","Global_active","Global_reactive","Voltage","Global_intencity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
tbl_df(power)
outcome<- filter(power, date %in% c("1/2/2007","2/2/2007"))
outcome$Specific <- strptime(paste(outcome$date,outcome$Time), format="%d/%m/%Y %H:%M:%S")

with(outcome, plot(Specific, as.numeric(as.character(Sub_metering_1)), type = "n", xlab = "",ylab = "Energy sub metering"))
with(outcome,lines(Specific, as.numeric(as.character(Sub_metering_1))))
with(outcome,lines(Specific, as.numeric(as.character(Sub_metering_2)),col = "red"))
with(outcome,lines(Specific, as.numeric(as.character(Sub_metering_3)), col = "blue"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),lty = 1)
        