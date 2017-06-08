# Load in the data(Only the needed dates)
pw0 <- read.table(file="household_power_consumption.txt", header=FALSE, sep=";", na.strings="?", skip=66637, nrows = 2880, stringsAsFactors = F)
# Read and apply the column names
pw0.names <- read.table(file="household_power_consumption.txt", header=FALSE, sep=";", nrows = 1, colClasses = "character")
names(pw0) <- pw0.names

#Generate the required histogram
hist(pw0$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")