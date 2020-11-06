#set working directory
setwd("C:/Users/pinnsira/Desktop/Coursera")

#reading the data
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F, comment.char="", quote='\"')

#subsetting the data
df <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
df$Date <- as.Date(df$Date, format="%d/%m/%Y")

#plotting a histogram
hist(df$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#saving as plot1.png
png("plot1.png", width=480, height=480)
dev.off()