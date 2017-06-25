plot3 <- function(){
  library(dplyr)
  library(downloader)
  download("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", dest="dataset.zip", mode="wb") 
  unzip ("dataset.zip", exdir = "./")
  household_power <- read.table("./household_power_consumption.txt", header=TRUE, sep = ";")
  household_power$Date <- strptime(household_power$Date, "%d/%m/%Y")
  household_power$Date <- as.Date(household_power$Date)
  house_power.f <- filter(household_power, Date=="2007-02-01" | Date=="2007-02-02")
  house_power.f$Global_active_power <- as.numeric(house_power.f$Global_active_power)
  house_power.f$DateTime <- paste(house_power.f$Date,house_power.f$Time)
  house_power.f$DateTime <- as.POSIXct(house_power.f$DateTime)
  
  house_power.f$Sub_metering_1 <- as.numeric(house_power.f$Sub_metering_1)
  house_power.f$Sub_metering_2 <- as.numeric(paste(house_power.f$Sub_metering_2))
  house_power.f$Sub_metering_3 <- as.numeric(house_power.f$Sub_metering_3)
  
  png(file="plot3.png", height=480, width=480)
  with(house_power.f, plot(DateTime, Sub_metering_1, type="l", xlab = "", ylab = "Energy Submetering"), col= "black")
  with(house_power.f, lines(DateTime, Sub_metering_2, type="l", xlab = "", col="red"))
  with(house_power.f, lines(DateTime, Sub_metering_3, type="l", xlab = "", col="blue"))
  legend("topright", legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= c(1,1,1), lwd= c(2.5,2.5,2.5), col = c("black","red","blue"))


 dev.off()
  
  
}