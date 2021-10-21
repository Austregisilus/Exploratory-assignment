NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")


library(dplyr)
SCC <- SCC %>% select (SCC, Data.Category, Short.Name) %>% filter (grepl("[Vv]ehicle", Short.Name))
data <- merge(NEI, SCC, by = "SCC")

data <- data %>% select(fips, Emissions, year) %>% filter(fips == "24510" | fips == "06037")

data$fips <- gsub("24510", "Baltimore", data$fips)
data$fips <- gsub("06037", "Los Angeles", data$fips)

library(ggplot2)
ggplot(data, aes(x=factor(year), y=Emissions, fill = fips)) + geom_bar(stat="identity") + facet_grid(.~fips)
ggsave("plot6.png")
