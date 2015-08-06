hpc<- read.table("household_power_consumption.txt", sep=";", header=T, quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?")

# Subsetting the full hpc to obtain the hpc related to two days: 
hpc<- subset(hpc, (hpc$Date == "1/2/2007" | hpc$Date== "2/2/2007")) 
# change the date format
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")

hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time))



# creating Plot4
png("plot4.png", width = 480, height = 480)

# divide the plot device into four subplots
par(mfrow=c(2,2)) 
# top left
plot(hpc$DateTime, hpc$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="") 
# top right
plot(hpc$DateTime, hpc$Voltage, type="l", xlab="datetime", ylab="Voltage")   
# bottom left
plot(hpc$DateTime, hpc$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(hpc$DateTime, hpc$Sub_metering_2, type="l", col="red")
lines(hpc$DateTime, hpc$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c("black", "red", "blue")) 
# bottom right
plot(hpc$DateTime, hpc$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")  

dev.off() 
