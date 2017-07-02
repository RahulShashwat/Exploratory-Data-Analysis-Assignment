#Setting the Working Directory
setwd("C:/Users/User/Desktop/Coursera Data/Course 4/Week4")
#Reading the Data File in R
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#Extracting Baltimore City data
Data_Baltimore <- subset(NEI, fips == "24510")
#Aggregating the Emmissions Year-wise
Emmissions_Per_year_Baltimore <- with(Data_Baltimore, tapply(Emissions,year,sum))

library(ggplot2)

#Creating a png File to store the graph
png("plot2.png")
#Plotting the Graph
barplot(Emmissions_Per_year_Baltimore, xlab = "Year", ylab = "PM2.5 Emission", 
        main = "Total PM2.5 Emission per year for Baltimore City")

dev.off()