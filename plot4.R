# Load in the data(Only the needed dates)
pw0 <- read.table(file="household_power_consumption.txt", header=FALSE, sep=";", na.strings="?", skip=66637, nrows = 2880, stringsAsFactors = F)
# Read and apply the names
pw0.names <- read.table(file="household_power_consumption.txt", header=FALSE, sep=";", nrows = 1, colClasses = "character")
names(pw0) <- pw0.names
# Change the character date and time fields to a date/time field
pw0 <- cbind(strptime(paste(pw0$Date, pw0$Time), format="%d/%m/%Y %H:%M:%S"), pw0[,3:9])
names(pw0)[1] <- "time"

# Set the plot to use 4 graphs
par(mfrow=c(2,2))

# Plot the first graph(upper-left)
plot(pw0$time, pw0$Global_active_power, main="", ylab="Global Active Power (kilowatts)", xlab="", type="n")
lines(pw0$time, pw0$Global_active_power)

# Plot the second graph(upper-right)
plot(pw0$time, pw0$Voltage, main="", ylab="Voltage", xlab="datetime", type="n")
lines(pw0$time, pw0$Voltage)

# Plot the third graph(lower-left)
plot(pw0$time, pw0$Sub_metering_1, main="", ylab="Energy sub metering", xlab="", type="n")
lines(pw0$time, pw0$Sub_metering_1, col="black")
lines(pw0$time, pw0$Sub_metering_2, col="red")
lines(pw0$time, pw0$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_3", "Sub_metering_3"), bty="n")

# Plot the fourth and final graph(lower-right)
plot(pw0$time, pw0$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", main="", type="n")
lines(pw0$time, pw0$Global_reactive_power)