## Getting full dataset
# raw data (.txt) files are downloaded and saved to 'path_to_working_folder/ExData_Plotting1/Data/'
dataset_raw <- read.csv("./ExData_Plotting1/Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dataset_raw$Date <- as.Date(dataset_raw$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(dataset_raw, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataset_raw)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
