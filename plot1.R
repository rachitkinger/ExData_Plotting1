path <- "course-exploratory-data-analysis/week1-project1/household_power_consumption.txt"

# read data into workspace
raw <- read.table(path, header = TRUE, sep = ";", na.strings = "?")

# subset the required data
df <- subset(raw, Date == "1/2/2007" | Date == "2/2/2007")

# create Day column 
df$Day <- as.POSIXct(strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S", tz = "EST"))

#open png graphic device
png(filename = "course-exploratory-data-analysis/week1-project1/plot1.png")

#plot 1: histogram of Global Active Power
hist(df$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power" )

#close device
dev.off()