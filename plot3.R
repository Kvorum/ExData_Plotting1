#### R code file that constructs the Plot 3 and save it to a PNG file ###

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
png(filename = "plot3.png", width = 480, height = 480, units = "px")

#  convert the Date and Time variables to Date/Time variable
datetime <- strptime(paste(exdata$Date,exdata$Time), "%d/%m/%Y %H:%M:%S")

# buildind the plot
with(exdata, plot(datetime, Sub_metering_1,
                  xlab = "", ylab = "Energy sub metering", type = "l"))
with(exdata, lines(datetime, Sub_metering_2, col = "red"))
with(exdata, lines (datetime, Sub_metering_3, col = "blue"))
legend("topright", lty = "solid", col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# close the device
dev.off()


