NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

library(dplyr)
SCC <- SCC %>% select (SCC, Data.Category, Short.Name) %>% filter (grepl("[Cc]oal", Short.Name))
data <- merge(SCC, NEI, by = "SCC")

library(ggplot2)

g <- ggplot(data, aes(factor(year), Emissions/100000))
g + geom_bar(stat = "identity") + labs(title = "PM2.5 Emissions from coal combustion", y = "Emissions in '00000'", x = "Year")
ggsave("plot4.png")
