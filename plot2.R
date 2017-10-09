# Supporting Resources:
# Data Camp Tutorial: https://www.datacamp.com/community/tutorials/r-data-import-tutorial
# Coursera Materials: https://www.coursera.org/learn/exploratory-data-analysis

# Load the data
txtData <- 'household_power_consumption.txt'
df <- read.table(txtData, header=TRUE, sep =';', stringsAsFactors=FALSE)

# Extract the target subset
tData <- (df[df$Date %in% c('1/2/2007','2/2/2007') ,])

# Call PNG Graphics Device
png('plot2.png', width=504, height=504, bg='transparent')

# Extract Concatenated Time Variables
tDataDateTime <- strptime(paste(tData$Date, tData$Time, sep=' '), '%d/%m/%Y %H:%M:%S')

# Extract Global Active Power as a Numeric Data Type
tDataGlobalActivePower <- as.numeric(tData$Global_active_power)

# Plot All the Information
plot(tDataDateTime, tDataGlobalActivePower, type='l', ylab='Global Active Power (kilowatts)', xlab='')

# Close Graphics Device
dev.off()