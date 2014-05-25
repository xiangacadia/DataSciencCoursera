## Q2
## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == 24510) 
## from 1999 to 2008? Use the base plotting system to make a plot answering this question.

## get index for Baltimore City
bal <- NEI$fips == 24510

## get emission by year in Baltimore City
emissionByYear <- aggregate(NEI$Emissions[bal], list(NEI$year[bal]), sum)

emissionByYear$x[1] - emissionByYear$x[4]

## plot data
png(filename="/Users/xiangjiang/Documents/git/Data Science at Coursera/5.Exploratory data analysis/plot2.png", width=480, height=480)

plot(emissionByYear$Group.1, emissionByYear$x, main="total emissions from PM2.5", xlab="year",
     ylab="emission", type = "l")

dev.off()

## As shown from the graph, total emissions from PM2.5 has fluctuated in Baltimore of United States from 1999 to 2008.
## The amout of PM2.5 in 2008 is smaller than that of 1999.