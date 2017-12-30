## Plot1 (Global Active Power) for Electric Power Consumption
Plot1 <- function(){

## Read txt data (for only those 2 days = 2880 minutes)
dats <- read.table("household_power_consumption.txt", 
                   skip=grep("31/1/2007;23:59:00", 
                             readLines("household_power_consumption.txt")),
                   nrows=(2*24*60), 
                   sep=";"
                   )

## Set column names
colnames(dats) <- c("Date","Time","Global_Active_Power", "Global_Reactive_Power",
                    "Voltage","Global_Intensity","Sub-Metering_1", "Sub-Metering_2", 
                    "Sub-Metering 3")

## Open PNG graphics device
png(filename = "Plot1.png")

## Draw Plot
hist(dats$Global_Active_Power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     col="red"
   )

## Close device
dev.off()

}
