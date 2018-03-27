library(ggplot2)


## read the files
getwd()
setwd("C:/Users/fried/Desktop")



NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


data <- NEI[NEI$fips == "24510",]

aggr <- aggregate(Emissions ~ year + type, data, sum )

png("plot3.png", width = 680, height = 480)

f <- ggplot(aggr, aes(year,Emissions, col = type))
f <- f + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*"Emissions"))+
  ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
print(f)
dev.off()       
