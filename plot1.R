hhenergy <- read.table("householdpc.txt", header=TRUE, sep=";", dec =";")
gpa <- subset(hhenergy, hhenergy$Date=="1/2/2007" | hhenergy$Date=="2/2/2007")
hist(as.numeric(as.character(gpa$Global_active_power)), col="red", main ="Global Active Power", xlab = "Global Active Power (kilowatts)")
png("plot1.png", width=480, height=480)