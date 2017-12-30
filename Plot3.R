## Plot3 (Energy Sub-Metering ~ Weekdays, by submetering Number)
Plot3 <- function(){
        
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
        png(filename = "Plot3.png")
        
        ## Draw Plot
        plot(dats$days,dats[,7], 
             type="l",ylab="Energy sub metering",xlab="",xaxt="n",col="black")
        lines(dats$days,dats[,8],col="red")
        lines(dats$days,dats[,9],col="blue")
        axis(1,at=c(0,(24*60)+1,(2*24*60)+1),labels=c("Thu","Fri","Sat"))
        legend("topright",
               legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
               col=c("black","red","blue"), lty=1, cex=0.7)

        ## Close device
        dev.off()
}
