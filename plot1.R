# plot 1
# reading the data
data <- read.csv("C:\\Users\\abina\\Desktop\\Exploratory Data Analysis\\household_power_consumption.txt", header=T, 
                 sep=';', na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
# subsetting data
datasubset <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
# converting to date class
datasubset$Date <- as.Date(datasubset$Date, format="%d/%m/%Y")
png("plot1.png", width=480, height=480) # getting the output as a PNG file
# plotting the histogram
hist(datasubset$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()