## Download data
#elecURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(elecURL, destfile = "household_power_consumption.zip")

## unzip data
#unzip("household_power_consumption.zip")


## Read data into dataframe, file must be named 'household_power_consumption.txt' and in the current working directory
## uncomment download and unzip commands above if you dont have the data
elecData <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

## Create new dataframe for dates 2007-02-01 and 2007-02-02
elecData2 <- elecData[(elecData$Date %in% c("1/2/2007","2/2/2007"))  ,]

# combine Date and Time columns and update to POSIX format
library(lubridate)
elecData2$DateTime <- paste(as.character(elecData2$Date), as.character(elecData2$Time), sep=" ")
elecData2$DateTime <- dmy_hms(elecData2$DateTime)

# set graphs env to have 2 x 2 output (fill cols first) and space around each plot
opar <- par(mfcol=c(2,2), mar=c(4,4,2,2))  


# 1st  plot (top left) of Date Time vs. Global Active Power
plot(elecData2$DateTime, (as.numeric(as.character(elecData2$Global_active_power))), type="l", xlab="", ylab="Global Active Power")

# 2nd plot (bottom left) of Date Time vs. Sub Metering 1,2, and 3
plot(elecData2$DateTime, (as.numeric(as.character(elecData2$Sub_metering_1))), type="l", ylab="Energy sub metering", xlab="", ylim=c(0,40))
lines(elecData2$DateTime, (as.numeric(as.character(elecData2$Sub_metering_2))), type="l", col="red")
lines(elecData2$DateTime, (as.numeric(as.character(elecData2$Sub_metering_3))), type="l", col="blue")
legend("topright", pch="-", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))

# 3rd plot (top right) of Date Time vs. Voltage
plot(elecData2$DateTime, as.numeric(as.character(elecData2$Voltage)), type="l", xlab="datetime", ylab="Voltage")

# 4th plot (bottom right) of Date Time vs. Global Reactive Power
plot(elecData2$DateTime, as.numeric(as.character(elecData2$Global_reactive_power)), type="l", xlab="datetime", ylab="Global_reactive_power")


# reset graphic env parameters back to their original values 
par(opar)

# copy plot to png file
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()

