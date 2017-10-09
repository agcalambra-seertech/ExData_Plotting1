# Supporting Resources:
# Data Camp Tutorial: https://www.datacamp.com/community/tutorials/r-data-import-tutorial
# Coursera Materials: https://www.coursera.org/learn/exploratory-data-analysis
# R Graphics in PNG: https://www.stat.auckland.ac.nz/~paul/Talks/gridSVG/slide4.html

# Load the data
txtData <- 'household_power_consumption.txt'
df <- read.table(txtData, header=TRUE, sep =';', stringsAsFactors=FALSE)

# Extract the target subset
tData <- as.numeric(df[df$Date %in% c('1/2/2007','2/2/2007') ,]$Global_active_power)

# Call PNG Graphics Device
png('plot1.png', width=504, height=504, bg='transparent')

# Build Histogram Separately
hist(tData, main='Global Active Power', col='red', ylab='Frequency', xlab='Global Active Power (kilowatts)')

# Close Graphics Device
dev.off()