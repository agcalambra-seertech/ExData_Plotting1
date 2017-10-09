# Supporting Resources:
# Data Camp Tutorial: https://www.datacamp.com/community/tutorials/r-data-import-tutorial
# Coursera Materials: https://www.coursera.org/learn/exploratory-data-analysis

# Load the data
txtData <- 'household_power_consumption.txt'
df <- read.table(txtData, header=TRUE, sep =';', stringsAsFactors=FALSE)

# Extract the target subset
tData <- (df[df$Date %in% c('1/2/2007','2/2/2007') ,])

# Extract Concatenated Time Variables
tDataDateTime <- strptime(paste(tData$Date, tData$Time, sep=' '), '%d/%m/%Y %H:%M:%S')

# Extract Global Active Power as a Numeric Data Type
tDataGlobalActivePower <- as.numeric(tData$Global_active_power)

# Extract Voltage as a Numeric Data Type
tDataVoltage <- as.numeric(tData$Voltage)

# Extract Global Reactive Power as Numeric Data Type
tDataGlobalReactivePower <- as.numeric(tData$Global_reactive_power)

# Call PNG Graphics Device
png('plot4.png', width=504, height=504, bg='transparent')

# Set Plotting Grid
par(mfrow=c(2,2))

# Plot First Graph (1,1)
plot(tDataDateTime, tDataGlobalActivePower, type='l', ylab='Global Active Power', xlab='')

# Plot Second Graph (1,2)
plot(tDataDateTime, tDataVoltage, type='l', ylab='Voltage', xlab='datetime')

# Begin Plotting Third Graph (2,1)

# Extract Concatenated Time Variables
tDataDateTime <- strptime(paste(tData$Date, tData$Time, sep=' '), '%d/%m/%Y %H:%M:%S')

# Begin Base Plotting with the column Sub_metering_1
plot(tDataDateTime, tData$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')

# Add Lines for column Sub_metering_2
lines(tDataDateTime, tData$Sub_metering_2, type='l', col= 'red')

# Add Lines for column Sub_metering_3
lines(tDataDateTime, tData$Sub_metering_3, type='l', col= 'blue')

# Define Legend Vectors for concise code
pLegendText <- c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
pLegendColor <- c('black', 'red', 'blue')

# Add Legends for the Different Lines
legend(c('topright'), pLegendText, lty=1, lwd=1, col=pLegendColor, bty='n')

# End Plotting Third Graph (2,1)

# Plot Fourth Graph (2,2)
plot(tDataDateTime, tDataGlobalReactivePower, type='l', ylab='Global_reactive_power', xlab='datetime')

# Close Graphics Device
dev.off()