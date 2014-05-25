## Q1
data <- read.csv("/Users/xiangjiang/Downloads/getdata-data-ss06hid.csv")
logic <- (data$AGS==6 & data$ACR==3)
which(logic)

## Q2
library(jpeg)
img <- readJPEG("/Users/xiangjiang/Downloads/getdata-jeff.jpg", native=TRUE)
summary(img)
quantile(img, c(0.3,0.8))

## Q3
gdp <- read.table("/Users/xiangjiang/Downloads/getdata-data-GDP.csv",sep = ",",skip = 5,blank.lines.skip = TRUE,skipNul = TRUE)
edu <- read.csv("/Users/xiangjiang/Downloads/getdata-data-EDSTATS_Country.csv")
mergeData = merge(gdp, edu, by.x="V1",by.y="CountryCode", by="V5")
unique_gdp <- unique(gdp$V1)
unique_edu <- unique(edu$CountryCode)
length(intersect(unique_edu,unique_gdp))
## sort by gdp
mergeData$V5 <- as.numeric(gsub(",", "",mergeData$V5))
newdata <- mergeData[order(mergeData$V5, decreasing = TRUE),] 
mean(newdata$V5[newdata$Income.Group=="High income: OECD"])
