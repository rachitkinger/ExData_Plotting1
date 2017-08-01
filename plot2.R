path <- "course-exploratory-data-analysis/week1-project1/household_power_consumption.txt"

# read data into workspace
raw <- read.table(path, header = TRUE, sep = ";", na.strings = "?")

# subset the required data
df <- subset(raw, Date == "1/2/2007" | Date == "2/2/2007")

# create Day column 
df$Day <- as.POSIXct(strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S", tz = "EST"))


#open png graphic device
png(filename = "course-exploratory-data-analysis/week1-project1/plot2.png")

#plot 2: Global Active Power trend
plot(df$Day, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")


#close device
dev.off()