setwd("C:/Users/fried/Desktop")


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


data <- NEI[NEI$fips == "24510",]
data <- aggregate(Emissions ~ year, data, sum)


png("plot2.png",width = 680, height = 480)
barplot(height=data$Emissions, col = 'wheat', xlab = "Year", ylab = "Total PM2.5 Emission in Baltimore City", main = "Variation in PM2.5 Emission in Baltimore City over the years")

dev.off()


