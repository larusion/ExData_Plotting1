
# First we read the data
DATA <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)


# We paste date and time creating a new variable called datetime and then convert its class using strptime()
datetime <- paste(DATA$Date, DATA$Time)
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
Project <- cbind(datetime, DATA)


# We extract the part of the data we are going to analyze
keywords <- strptime(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
KEY <- paste(keywords, collapse = "|")
Project2 <- Project[grepl(KEY, Project$datetime),]



# We construct the plot and save it to a png file
png(file = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

with(Project2, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))
with(Project2, lines(datetime, Global_active_power))


with(Project2, plot(datetime, Voltage, type = "l"))


with(Project2, plot(datetime, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering"))
with(Project2, lines(datetime, Sub_metering_2, type = "l", col = "red"))
with(Project2, lines(datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")


with(Project2, plot(datetime, Global_reactive_power, type = "l"))

dev.off()
