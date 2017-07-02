#Setting the Working Directory
setwd("C:/Users/User/Desktop/Coursera Data/Course 4/Week4")
#Reading the Data File in R
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subsetting SCC with coal values
coalMatches  <- grepl("coal", SCC$Short.Name, ignore.case=TRUE)
subsetSCC <- SCC[coalMatches, ]

# merging dataframes
merge_NEI_SCC <- merge(NEI, subsetSCC, by="SCC")

# summing emission data per year
totalEmissions_coal <- with(merge_NEI_SCC, tapply(Emissions,year,sum))

#Creating a png File to store the graph
png("plot4.png")
# plotting
barplot(totalEmissions_coal, xlab = "Year", ylab = "Total Emission (ton)", 
        main = "Total Emission from coal sources")


dev.off()