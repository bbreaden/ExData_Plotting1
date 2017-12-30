## Plot2 (Global Active Power ~ Weekdays) for Electric Power Consumption
Plot2 <- function(){
        
        ## Read txt data (for only those 2 days = 2880 minutes)
        dats <- read.table("household_power_consumption.txt", 
                           skip=grep("31/1/2007;23:59:00", 
                                     readLines("household_power_consumption.txt")),
                           nrows=((2*24*60)+1), 
                           sep=";"
        )
        
        ## Add observation number in column 10
        dats$days <- c(1:2881)
        
        ## Open PNG graphics device
        png(filename = "Plot2.png")
        
        ## Draw Plot
        plot(dats$days,dats[,3], type="l",ylab="Global Active Power (kilowatts)",xlab="",xaxt="n")
        axis(1,at=c(0,(24*60)+1,(2*24*60)+1),labels=c("Thu","Fri","Sat"))
        
        ## Close device
        dev.off()
}
