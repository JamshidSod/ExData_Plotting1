hpc<- read.table("household_power_consumption.txt", sep=";", header=T, quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?")

# Subsetting the full hpc to obtain the hpc related to two days: 
hpc<- subset(hpc, (hpc$Date == "1/2/2007" | hpc$Date== "2/2/2007")) 
# change the date format
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")

hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time))



# creating Plot2
png("plot2.png", width=480, height= 480)

plot(hpc$DateTime, hpc$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="")

dev.off()
