## Question 5
## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

## get motor index for SCC
motorIndex <- SCC$SCC[grep("Motor", SCC$Short.Name)]

## get index in NEI for motor vehicles
motor <- which(NEI$SCC %in% motorIndex)


## get index for Baltimore City
bal <- which(NEI$fips == 24510)

index <- intersect(motor, bal)

## get emission by year from motor vehicles
emissionByYear <- aggregate(NEI$Emissions[index], list(NEI$year[index]), sum)

## plot data
png(filename="/Users/xiangjiang/Documents/git/Data Science at Coursera/5.Exploratory data analysis/plot5.png", width=480, height=480)

plot(emissionByYear$Group.1, emissionByYear$x, main="PM2.5 emission by year from motor vehicles in Baltimore City", xlab="year",
     ylab="emission", type = "l")

dev.off()

## As shown from the graph, PM2.5 emission by year from motor vehicles in Baltimore City has decreased from 1999 to 2008.