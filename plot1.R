getwd()
setwd("C:/Users/fried/Desktop")

## read the data sets 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")



data <- NEI[,c(4,6)]
data <- split(data, data$year)
data <- lapply(data, sum)
data <- as.numeric(data)
years <- c('1999', '2002', '2005', '2008')
mat <- matrix(rep(0,4),nrow = 1, ncol = 4)
mat[1,] <- data
colnames(mat) <- years


png( "plot1.png",width = 680, height = 480)
barplot(mat, col = 'wheat', xlab = "Year", ylab = "Total PM2.5 Emission", main = "Variation in PM2.5 Emission in US over the years")

dev.off()


