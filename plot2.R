# getting the data
data <- read.csv("C:\\Users\\abina\\Desktop\\Exploratory Data Analysis\\household_power_consumption.txt",
                      header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
# subsetting the data
datasubset <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
# converting to date and time class
datasubset$Date <- as.Date(datasubset$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(datasubset$Date), datasubset$Time)
datasubset$Datetime <- as.POSIXct(datetime)
# Plot 2
png("plot2.png", width=480, height=480) # getting the output as a PNG file
with(datasubset, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})
dev.off()