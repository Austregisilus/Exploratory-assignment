NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

library(dplyr)

NEI <- tibble::as_tibble(NEI)
SCC <- tibble::as_tibble(SCC)

data <- merge(NEI, SCC, by = "SCC")
sum_all <- (with(data, tapply(Emissions, year, sum, na.rm = TRUE)))

plot_data <- sum_all/100000

png("plot1.png", width = 480, height = 480, units = "px")
barplot(plot_data, col = "blue", xlab = "Year", ylab = "Total Emissions in '00000'", main = "Total PM2.5 Emissions for 1999, 2002, 2005 and 2008")
dev.off()
