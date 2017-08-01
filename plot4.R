path <- "course-exploratory-data-analysis/week1-project1/household_power_consumption.txt"

# read data into workspace
raw <- read.table(path, header = TRUE, sep = ";", na.strings = "?")

# subset the required data
df <- subset(raw, Date == "1/2/2007" | Date == "2/2/2007")

# create Day column 
df$Day <- as.POSIXct(strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S", tz = "EST"))

#open png graphic device
png(filename = "course-exploratory-data-analysis/week1-project1/plot4.png")

# plot4: 4 panel plot
par(mfrow = c(2,2)) #this sets the parameter

hist(df$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power" ) #plots the topleft plot
plot(df$Day, df$Voltage, xlab = "datetime", ylab = "Voltage", type = "l") #plots the top right plot
plot(df$Day, df$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering") # plots the bottom left plot without data
for (i in 7:9) { lines(df$Day, df[,i], col = (i-6)) } # plots the lines in the bottom left plot
legend("topright", legend = names(df[7:9]), lty = 1, lwd = 1, col = c(1:3), bty = "n") # plots the legend of the bottom left plot
plot(df$Day, df$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power") # plots the bottom right plot

#close device
dev.off()

