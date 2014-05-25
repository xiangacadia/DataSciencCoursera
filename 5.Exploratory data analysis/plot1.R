## Question 1
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from 
## all sources for each of the years 1999, 2002, 2005, and 2008.

## get emission by year
emissionByYear <- aggregate(NEI$Emissions, list(NEI$year), sum)

## plot data
png(filename="/Users/xiangjiang/Documents/git/Data Science at Coursera/5.Exploratory data analysis/plot1.png", width=480, height=480)

plot(emissionByYear$Group.1, emissionByYear$x, main="total emissions from PM2.5", xlab="year",
     ylab="emission", type = "l")

dev.off()

## As shown from the graph, total emissions from PM2.5 has decreased in the United States from 1999 to 2008.