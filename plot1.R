plot1 <- function(){
  library(dplyr)
  library(downloader)
  download("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", dest="dataset.zip", mode="wb") 
  unzip ("dataset.zip", exdir = "./")
  household_power <- read.table("./household_power_consumption.txt", header=TRUE, sep = ";")
  household_power$Date <- strptime(household_power$Date, "%d/%m/%Y")
  household_power$Date <- as.Date(household_power$Date)
  house_power.f <- filter(household_power, Date=="2007-02-01" | Date=="2007-02-02")
  house_power.f$Global_active_power <- as.numeric(house_power.f$Global_active_power)
  png(file="plot1.png", height=480, width=480)
  hist(house_power.f$Global_active_power,xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
  dev.off()
  
}