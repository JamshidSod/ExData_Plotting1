hpc<- read.table("household_power_consumption.txt", sep=";", header=T, quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?")

# Subsetting the full data to obtain the data related to two days: 
hpc<- subset(hpc, (hpc$Date == "1/2/2007" | hpc$Date== "2/2/2007")) 

# creating Plot1
png("plot1.png", width=480, height= 480)

hist(hpc$Global_active_power, col= "red", xlab= "Global Active Power (kilowatts)", ylab= "Frequency", main= "Global Active Power")

dev.off() 
