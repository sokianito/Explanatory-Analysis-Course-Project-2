library(ggplot2)
getwd()
setwd("C:/Users/fried/Desktop")



NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

data <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD",]

aggr <- aggregate(Emissions ~ year, data, sum)

png("plot5.png", width=840, height=480)
f <- ggplot(aggr, aes(factor(year), Emissions))
f <- f + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, Maryland (fips = "24510") from 1999 to 2008')




print(f)
dev.off()
