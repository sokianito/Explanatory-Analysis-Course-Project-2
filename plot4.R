library(ggplot2)


## read the files
getwd()
setwd("C:/Users/fried/Desktop")



NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

dataset <- merge(NEI,SCC)


matches <- grepl("coal", dataset$Short.Name, ignore.case = TRUE)
newdata <- dataset[matches,]

aggr <- aggregate(Emissions ~ year, newdata, sum)



png("plot4.png", width=640, height=480)
f <- ggplot(aggr, aes(factor(year), Emissions))

f <- f + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(f)
dev.off()
