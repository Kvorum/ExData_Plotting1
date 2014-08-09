#### R code file that constructs the Plot 2 and save it to a PNG file ###

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
png(filename = "plot2.png", width = 480, height = 480, units = "px")

Sys.setlocale("LC_TIME", "English") # for weekdays in english

# building the plot
with(exdata, plot(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"),
                  Global_active_power, type = "l", xlab = "", 
                  ylab = "Global Active Power (kilowatts)"))

# close the device
dev.off()
