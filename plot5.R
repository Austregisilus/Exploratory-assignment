NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")


library(dplyr)
SCC <- SCC %>% select (SCC, Data.Category, Short.Name) %>% filter (grepl("[Vv]ehicle", Short.Name))
data <- merge(NEI, SCC, by = "SCC")

baltimore <- data %>% select(fips, Emissions, year) %>% filter(fips == 24510)

sum_baltimore <- with(baltimore, tapply(Emissions, year, sum, na.rm = T))

png("plot5.png", width = 480, height = 480, units = "px")
barplot(sum_baltimore, col = "blue", xlab = "Year", ylab = "Total Emissions", main = "Total PM2.5 Emissions from Motor Vehicles in Baltimore City")
dev.off()
