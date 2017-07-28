# Download data
#elecURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(elecURL, destfile = "household_power_consumption.zip")

#unzip data
#unzip("household_power_consumption.zip")


## Read data into dataframe, file must be named 'household_power_consumption.txt' and in the current working directory
## uncomment download and unzip commands above if you dont have the data
elecData <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

## Create new dataframe for dates 2007-02-01 and 2007-02-02
elecData2 <- elecData[(elecData$Date %in% c("1/2/2007","2/2/2007"))  ,]

## Histogram of frequency of Global Active Power values
hist(as.numeric(as.character(elecData2$Global_active_power)), breaks=15, xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power", col="Red", xlim=c(0,6), ylim=c(0,1200))

## copy plot to png file
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()