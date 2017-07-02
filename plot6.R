#Setting the Working Directory
setwd("C:/Users/User/Desktop/Coursera Data/Course 4/Week4")
#Reading the Data File in R
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#Extracting Baltimore City data
Data_Baltimore <- subset(NEI, fips == "24510")
#Extracting Los Angeles County data
Data_Los_Angeles <- subset(NEI, fips == "06037")


# subsetting SCC with Motor Vehichles
is_vehicle  <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
Data_Motor_Vehicle <- SCC[is_vehicle, ]

# merging datasets, adding city variable
Data_Balt_MV <- merge(Data_Baltimore, Data_Motor_Vehicle, by="SCC")
Data_Balt_MV$city <- "Baltimore City"
Data_LA_MV <- merge(Data_Los_Angeles, Data_Motor_Vehicle, by="SCC")
Data_LA_MV$city <- "Los Angeles County"
Final_Data <- rbind(Data_Balt_MV, Data_LA_MV)

# summing emission data per year per type
Agg_Data <- aggregate(Emissions ~ year + city, Final_Data, sum)

library(ggplot2)

#Creating a png File to store the graph
png("plot6.png", width=1040, height=480)

# plotting
g <- ggplot(Agg_Data, aes(year, Emissions, color = city))
g <- g + geom_line() +
  xlab("Year") +
  ylab(expression("Total PM"[2.5]*" Emissions")) +
  ggtitle("Total Emissions from Motor Vehicles in Baltimore and Los Angeles")
print(g)
dev.off()