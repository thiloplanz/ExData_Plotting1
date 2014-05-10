plot1 <- function(
    dataArchiveFile = 'household_power_consumption.zip',
    dataFile = 'household_power_consumption.txt'
    ){
  
  # extract the zip file if necessary
  if (!file.exists(dataFile)){
    if (!file.exists(dataArchiveFile)){
      stop('input archive file ', dataArchiveFile, ' not found')
    }
    unzip(dataArchiveFile)
  }
  
  # load the data
  data <- read.csv(dataFile, sep=';',
                   #  in this dataset missing values are coded as ?.
                   na.strings = c('?'),
                   # we only need Global Active Power here
                   colClasses = c('character', 'character', 'numeric', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL')
                   )
  
  # We will only be using data from the dates 2007-02-01 and 2007-02-02
  data <- data[data$Date %in% c('2/2/2007', '1/2/2007'),]

  # Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
  png('plot1.png', 480, 480)
  
  hist(data$Global_active_power,
       main = 'Global Active Power',
       xlab = 'Global Active Power (kilowatts)',
       col = 'red'
       )
  
  dev.off()
}

plot1()