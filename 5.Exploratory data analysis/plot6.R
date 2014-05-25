## Question 6
## Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle 
## sources in Los Angeles County, California (fips == 06037). 
## Which city has seen greater changes over time in motor vehicle emissions?

library(ggplot2)
library(reshape2)

## get motor index for SCC
motorIndex <- SCC$SCC[grep("Motor", SCC$Short.Name)]

## get index in NEI for motor vehicles
motor <- which(NEI$SCC %in% motorIndex)

## get index for Baltimore City
bal <- which(NEI$fips == "24510")

## get index for Log Angeles
la <- which(NEI$fips == "06037")

## get index of motor vehicles for Baltimore City
index_bal <- intersect(motor, bal)

## get index of motor vehicles for LA City
index_la <- intersect(motor, la)

## get emission by year from motor vehicles
emissionByYear_Bal <- aggregate(NEI$Emissions[index_bal], list(NEI$year[index_bal]), sum)
emissionByYear_LA <- aggregate(NEI$Emissions[index_la], list(NEI$year[index_la]), sum)

## plot data
png(filename="/Users/xiangjiang/Documents/git/Data Science at Coursera/5.Exploratory data analysis/plot6.png", width=480, height=480)

plot(emissionByYear_Bal$Group.1, emissionByYear_Bal$x, main="PM2.5 emission by year from motor vehicles in Baltimore City", xlab="year",
     ylab="emission", type = "l",col="red")
par(new=TRUE)
plot(emissionByYear_LA$Group.1, emissionByYear_LA$x,col="green",type = "l",xlab="", ylab="")

df = data.frame(emissionByYear_Bal, emissionByYear_LA)

emissionByYear_Bal <- cbind(emissionByYear_Bal, c("Bal","Bal","Bal","Bal"))
emissionByYear_LA <- cbind(emissionByYear_LA, c("LA","LA","LA","LA"))
colnames(emissionByYear_Bal) <- c("year", "PM2.5", "city")
colnames(emissionByYear_LA) <- c("year", "PM2.5", "city")

r <- rbind(emissionByYear_Bal,emissionByYear_LA)

ggplot(r, aes(year, PM2.5,colour=r$city)) + geom_line()

dev.off()

## As shown from the graph, Log Angeles has greater changes over time in motor vehicle emissions.