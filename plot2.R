NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

library(dplyr)

NEI <- tibble::as_tibble(NEI)
SCC <- tibble::as_tibble(SCC)
data <- merge(NEI, SCC, by = "SCC")

baltimore <- data %>% select(fips, Emissions, year) %>% filter(fips == 24510)

sum_baltimore <- with(baltimore, tapply(Emissions, year, sum, na.rm = T))
plot_data <- sum_baltimore/100

png("plot2.png", width = 480, height = 480, units = "px")
barplot(plot_data, col = "red", xlab = "Year", ylab = "Total Emissions in '00'", main = "Total PM2.5 Emissions for Baltimore in 1999, 2002, 2005 and 2008")
dev.off()
