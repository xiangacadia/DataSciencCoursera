# Q1
data <- read.csv("/Users/xiangjiang/Downloads/getdata-data-ss06hid.csv")
names(data)[123]
strsplit(names(data)[123], "wgtp")

# Q2
data <- read.csv("/Users/xiangjiang/Downloads/getdata-data-GDP.csv", header = FALSE)
data$V5 <- gsub(",", "",data$V5)
data$V5 <- as.numeric(data$V5)
mean(data$V5)

grep("^United",data$V4)

# Q3
edu <- read.csv("/Users/xiangjiang/Downloads/getdata-data-EDSTATS_Country.csv")
mergeData = merge(data, edu, by.x="V1",by.y="CountryCode", by="V5")
length(grep("end: June", mergeData$Special.Notes))
mergeData$Special.Notes[grep("end: June", mergeData$Special.Notes)]

# Q4
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 
length(grep("2012", sampleTimes))
readTime <- as.Date(sampleTimes)
length(intersect(grep("Monday",weekdays(readTime)), grep("2012", sampleTimes)))
