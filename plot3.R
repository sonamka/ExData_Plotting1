hhenergy <- read.table("householdpc.txt", header=TRUE, sep=";", dec =";")
hhenergy2 <- read.table("householdpc.txt", header=TRUE, sep=";", na.strings = "?", nrows= 2075259, stringsAsFactors=FALSE)
hhenergy2$DateTime <- paste(hhenergy2$Date, hhenergy2$Time)
hhenergy2$DateTime <- as.Date(hhenergy2$DateTime, format = "%d/%m/%Y %H: %M: %S")
View(hhenergy2)
library(dplyr)
subset_hhe <- filter(hhenergy2, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date ("2007-02-02 00:00:00"))
subset_hhe$Date <- as.Date(subset_hhe$Date, format="%d/%m/%Y")
subset_hhe$Time <- strptime(subset_hhe$Time, format="%H:%M:%S")
subset_hhe[1:1440,"Time"] <- format(subset_hhe[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subset_hhe[1441:2880,"Time"] <- format(subset_hhe[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
plot(subset_hhe$Time,subset_hhe$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subset_hhe,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subset_hhe,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subset_hhe,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), fill =1, ncol=2, cex=.3)
title(main="Energy sub-metering")
png("plot3.png", width=480, height=480)