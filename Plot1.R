# To read the data, format the time and date column and subset for the required dates

datafile <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",stringsAsFactors = FALSE)
datafile$Time <- strptime(paste(datafile$Date, datafile$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
datafile$Date <- as.Date(datafile$Date,"%d/%m/%Y")
Req_data <- subset(datafile, (Date >= '2007-02-01' & Date <= '2007-02-02'))

# To convert the required column into numeric and plot the first graph

plot1 <- as.numeric(Req_data$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(plot1, main = "Global Active Power", xlab = "Global Active power (KW)", col = "red")
dev.off()