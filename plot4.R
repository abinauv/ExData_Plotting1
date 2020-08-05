#getting the data
data <- read.csv("C:\\Users\\abina\\Desktop\\Exploratory Data Analysis\\household_power_consumption.txt",
                 header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
# subsetting the data
datasubset <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
# converting to date or time class
datasubset$Date <- as.Date(datasubset$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(datasubset$Date), datasubset$Time)
datasubset$Datetime <- as.POSIXct(datetime)
# plot 4
png("plot4.png", width=480, height=480) # getting the output as a PNG file
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(datasubset, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})
dev.off()