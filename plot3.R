# Supporting Resources:
# Data Camp Tutorial: https://www.datacamp.com/community/tutorials/r-data-import-tutorial
# Coursera Materials: https://www.coursera.org/learn/exploratory-data-analysis

# Load the data
txtData <- 'household_power_consumption.txt'
df <- read.table(txtData, header=TRUE, sep =';', stringsAsFactors=FALSE)

# Extract the target subset
tData <- (df[df$Date %in% c('1/2/2007','2/2/2007') ,])

# Call PNG Graphics Device
png('plot3.png', width=504, height=504, bg='transparent')

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
legend(c('topright'), pLegendText, lty=1, lwd=1, col=pLegendColor)

# Close Graphics Device
dev.off()