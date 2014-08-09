#### R code file that constructs the Plot 4 and save it to a PNG file ###

# code for reading the data 
if (!file.exists("household_power_consumption.txt")){
        download.file(url = "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile = "exdata-data-household_power_consumption.zip")
        unzip("exdata-data-household_power_consumption.zip")
}
exdata <- read.table("household_power_consumption.txt", header = TRUE, 
                     sep = ";", stringsAsFactors = FALSE, na.strings = "?", 
                     fill = FALSE, skip = 66636, nrows = 2880)

# restore header
names(exdata) <- names(read.table("household_power_consumption.txt", 
                                  sep = ";", header = TRUE, nrows = 1))

# open device for writing
png(filename = "plot4.png", width = 480, height = 480, units = "px")

# change device's default graphical parameter
par(mfrow = c(2, 2))

# convert the Date and Time variables to Date/Time variable
datetime <- strptime(paste(exdata$Date,exdata$Time), "%d/%m/%Y %H:%M:%S")

# buildind the plot
with(exdata, {
        plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
        plot(datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
        plot(datetime, Sub_metering_1,
                          xlab = "", ylab = "Energy sub metering", type = "l")
        lines(datetime, Sub_metering_2, col = "red")
        lines (datetime, Sub_metering_3, col = "blue")
        legend("topright", lty = "solid", col = c("black", "blue", "red"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(datetime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})

# close the device
dev.off()

