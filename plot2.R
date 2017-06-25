plot2 <- function(){
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
  
  

  png(file="plot2.png", height=480, width=480)
  with(house_power.f, plot(DateTime, Global_active_power, type="l", xlab = "", ylab = "Global Active Power"))
  pl
  dev.off()
  
  
}