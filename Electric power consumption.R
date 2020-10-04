download <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "temp")

unzip("temp")
unlink("temp")

power_consumption <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

power_consumption$dt <- strptime(paste(power_consumption$Date, power_consumption$Time), "%d/%m/%Y %H:%M:%S")

power_consumption$Date <- as.Date(power_consumption$Date, "%d/%m/%Y")

power_consumption_subset <- subset(power_consumption, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

hist(power_consumption_subset$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", breaks = 13, ylim = c(0,1200), xlim = c(0, 6))

plot(power_consumption_subset$dt, power_consumption_subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(power_consumption_subset$dt, power_consumption_subset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

points(power_consumption_subset$dt, power_consumption_subset$Sub_metering_2, type = "l", col = "red")

points(power_consumption_subset$dt, power_consumption_subset$Sub_metering_3, type = "l", col = "blue")

legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

