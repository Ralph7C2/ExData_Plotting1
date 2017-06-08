# Load in the data(Only the needed dates)
pw0 <- read.table(file="household_power_consumption.txt", header=FALSE, sep=";", na.strings="?", skip=66637, nrows = 2880, stringsAsFactors = F)
# Read and apply the column names
pw0.names <- read.table(file="household_power_consumption.txt", header=FALSE, sep=";", nrows = 1, colClasses = "character")
names(pw0) <- pw0.names
# Change the character date and time fields to a date/time field
pw0 <- cbind(strptime(paste(pw0$Date, pw0$Time), format="%d/%m/%Y %H:%M:%S"), pw0[,3:9])
names(pw0)[1] <- "time"

#Generate the chart
plot(pw0$time, pw0$Global_active_power, main="Global Active Power", ylab="Global Active Power (kilowatts)", xlab="", type="n")
lines(pw0$time, pw0$Global_active_power)