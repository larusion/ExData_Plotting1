DATA <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)
datetime <- paste(DATA$Date, DATA$Time)
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
Project <- cbind(datetime, DATA)
keywords <- strptime(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
KEY <- paste(keywords, collapse = "|")
Project2 <- Project[grepl(KEY, Project$datetime),]

png(file = "plot3.png", width = 480, height = 480)

with(Project2, plot(datetime, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering"))
with(Project2, lines(datetime, Sub_metering_2, type = "l", col = "red"))
with(Project2, lines(datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
