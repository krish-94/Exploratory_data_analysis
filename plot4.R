# To read the data, format the time and date column and subset for the required dates

datafile <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",stringsAsFactors = FALSE)
datafile$Time <- strptime(paste(datafile$Date, datafile$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
datafile$Date <- as.Date(datafile$Date,"%d/%m/%Y")
Req_data <- subset(datafile, (Date >= '2007-02-01' & Date <= '2007-02-02'))

# To make the fourth plot
png("plot4.png", width = 480,height = 480)
par(mfrow=c(2,2))

#1st plot
with(Req_data, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power"))

#2nd plot
with(Req_data, plot (Time, Voltage, type="l", xlab="datetime", ylab="Voltage"))

#3rd plot
with(Req_data, plot(Time, Sub_metering_1, type="l", 
                    xlab="", ylab="Energy sub metering"))
lines(Req_data$Time, Req_data$Sub_metering_2, col = "red")
lines(Req_data$Time, Req_data$Sub_metering_3, col = "blue")
legend ("topright",col=c("black","red","blue"),
        c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),bty = "n")

#4th plot
with(Req_data, plot(Time, Global_reactive_power, type="l", xlab="datetime", ylab="Global reactive Power"))

dev.off()