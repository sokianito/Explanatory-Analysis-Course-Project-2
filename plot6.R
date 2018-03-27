library(ggplot2)
getwd()
setwd("C:/Users/fried/Desktop")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

data <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

aggr <- aggregate(Emissions ~ year + fips, data, sum)
aggr$fips[aggr$fips=="24510"] <- "Baltimore, MD"
aggr$fips[aggr$fips=="06037"] <- "Los Angeles, CA"

png("plot6.png", width=1040, height=480)
f <- ggplot(aggr, aes(factor(year), Emissions))
f <- f + facet_grid(. ~ fips)
f <- f + geom_bar(stat="identity")  +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City, MD (fips = "24510") vs Los Angeles, CA (fips = "06037")  1999-2008')
print(f)
dev.off()
