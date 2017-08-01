path <- "course-exploratory-data-analysis/week1-project1/household_power_consumption.txt"

# read data into workspace
raw <- read.table(path, header = TRUE, sep = ";", na.strings = "?")

# subset the required data
df <- subset(raw, Date == "1/2/2007" | Date == "2/2/2007")

# create Day column 
df$Day <- as.POSIXct(strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S", tz = "EST"))

#plot 3: sub metering plot
plot(df$Day, df$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
for (i in 7:9) { lines(df$Day, df[,i], col = (i-6)) }
legend("topright", legend = names(df[7:9]), lty = 1, lwd = 1, col = c(1:3), bty = "n")