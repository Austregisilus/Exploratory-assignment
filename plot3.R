NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

data <- merge(NEI, SCC, by = "SCC")

library(dplyr)
baltimore <- data %>% select(fips, Emissions, year, type) %>% filter(fips == 24510)

library(ggplot2)
g <- ggplot(baltimore, aes(factor(year), Emissions, fill = type))
g + geom_bar(stat = "identity") + facet_wrap(.~type, nrow = 2, ncol = 2) + labs(title = "Baltimore city PM2.5 emissions based by Type and Year", y = "Year", x = "Total Emissions")
ggsave("plot3.png")
