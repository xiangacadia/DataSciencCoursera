## Question 3
## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
## which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
## Which have seen increases in emissions from 1999–2008? 
## Use the ggplot2 plotting system to make a plot answer this question.

library(ggplot2)

## get index for Baltimore City
bal <- NEI$fips == 24510

## get emission by year by type in Baltimore City
emissionByYear <- aggregate(NEI$Emissions[bal], list(NEI$type[bal], NEI$year[bal]), sum)

## plot data
png(filename="/Users/xiangjiang/Documents/git/Data Science at Coursera/5.Exploratory data analysis/plot3.png", width=480, height=480)

qplot(emissionByYear$Group.2, emissionByYear$x, color = emissionByYear$Group.1, geom="line", main="total emissions from PM2.5 by type", xlab="year", ylab="emission")

dev.off()

## As shown from the graph, 
## NONPOINT, NON-ROAD and ON-ROAD has decreased,
## POINT has increased.