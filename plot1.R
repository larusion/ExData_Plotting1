
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
png(file = "plot1.png", width = 480, height = 480)

with(Project2, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))

dev.off()
