#Setting the Working Directory
setwd("C:/Users/User/Desktop/Coursera Data/Course 4/Week4")
#Reading the Data File in R
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#Extracting Baltimore City data
Data_Baltimore <- subset(NEI, fips == "24510")
#Aggregating the Emmissions Year-wise
Emmissions_Per_Year_Type_Baltimore <- aggregate(Emissions ~ year + type, Data_Baltimore, sum)


#Creating a png File to store the graph
png("plot3.png")
#Plotting the Graph
g <- ggplot(Emmissions_Per_Year_Type_Baltimore, aes(year, Emissions, color = type))
g <- g+
  geom_line()+
  xlab("Year") +
  ylab(expression("Total PM"[2.5]*" Emissions")) +
  ggtitle("Total Emissions per yer per type in Baltimore")
print (g)
dev.off()