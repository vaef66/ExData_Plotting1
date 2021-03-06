# 1. Read data file into data-frame (only the subset that contains the lines of interest)
# identical form all plots
#?read.table

# read first few rows to get information about the dataset
initial = read.table("household_power_consumption.txt", 
                     header = TRUE, sep = ";", na.strings = "?", nrows = 100)

# set the class of each column, "NULL" if col is skipped
classes = sapply(initial, class)
classes[1:2] = "character" # ensure that first 2 cols (date/time) are "character"
# debug only: check initial structure and content
#str(initial); classes

# read only rows needed - as header (1st row) is skipped explicitly name columns (names function)
colNames = names(initial)
# colNames # debug only
house_pc = read.table("household_power_consumption.txt", 
                      sep = ";", na.strings = "?", skip = 66637, nrows = 69517 - 66638 + 1,
                      col.names = colNames, colClasses = classes)
#str(house_pc) # debug only
# convert first two character columns containing date/time data to R date and time objects
house_pc$Time = as.POSIXct(x = paste(house_pc$Date,house_pc$Time), 
                           format = "%d/%m/%Y%H:%M:%S")
house_pc$Date = as.Date(x = house_pc$Date, format = "%d/%m/%Y")

# test only: check structure and content of resulted data-frame
#str(house_pc) 
#house_pc[1:100,]


### 2. Plotting: create plot directly on device 
#?plot
#?png
#?par
#?legend
#?lines

# create plot directly on device (open - close png device)
png(filename = "plot1.png", width = 480, height = 480,
    bg = "white")  # altered: bg = "transparent" to bg = "white" (default, ommit)
with(house_pc, 
     hist(Global_active_power, col="red", main = "Global Active Power",
          xlab = "Global Active Power (kilowatts)"))
dev.off() 