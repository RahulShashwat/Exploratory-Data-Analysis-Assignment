#Setting the Working Directory
setwd("C:/Users/User/Desktop/Coursera Data/Course 4/Week4")
#Reading the Data File in R
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#Aggregating the Emmissions Year-wise
Tot_Emmissions_Per_year <- with(NEI, tapply(Emissions,year,sum))

#Creating a png File to store the graph
png("plot1.png")
#Plotting the Graph
barplot(Tot_Emmissions_Per_year, xlab = "Year", ylab = "Total PM2.5 Emission", 
        main = "Total PM2.5 Emission per year")

dev.off()