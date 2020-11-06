#set working directory
setwd("C:/Users/pinnsira/Desktop/Coursera")

#reading the data, naming the variables, and subsetting the data
data <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
df <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

#Transforming Date and Time variables
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df$Time <- strptime(df$Time, format="%H:%M:%S")
df[1:1440,"Time"] <- format(df[1:1440,"Time"],"2007-02-01 %H:%M:%S")
df[1441:2880,"Time"] <- format(df[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#Plotting and saving the file
png("plot3.png", width=480, height=480)
plot(df$Time,subpower_con$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(df,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(df,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(df,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()