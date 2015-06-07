DATA <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)
datetime <- paste(DATA$Date, DATA$Time)
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
Project <- cbind(datetime, DATA)
keywords <- strptime(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
KEY <- paste(keywords, collapse = "|")
Project2 <- Project[grepl(KEY, Project$datetime),]

png(file = "plot2.png", width = 480, height = 480)

with(Project2, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))


dev.off()
