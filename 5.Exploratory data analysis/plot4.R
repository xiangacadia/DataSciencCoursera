## Question 4
## Across the United States, how have emissions from coal combustion-related sources changed 
## from 1999–2008?

## get coal index for SCC
coalIndex <- SCC$SCC[grep("Coal", SCC$Short.Name)]

## get index in NEI for coal
coal <- which(NEI$SCC %in% coalIndex)

## get emission by year from coal combustion-related sources
emissionByYear <- aggregate(NEI$Emissions[coal], list(NEI$year[coal]), sum)

## plot data
png(filename="/Users/xiangjiang/Documents/git/Data Science at Coursera/5.Exploratory data analysis/plot4.png", width=480, height=480)

plot(emissionByYear$Group.1, emissionByYear$x, main="PM2.5 emission by year from coal combustion-related sources", xlab="year",
     ylab="emission", type = "l")

dev.off()

## As shown from the graph, total emissions from PM2.5 by year from coal combustion-related sources has decreased in the United States from 1999 to 2008.