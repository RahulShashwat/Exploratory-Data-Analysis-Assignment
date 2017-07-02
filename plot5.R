#Setting the Working Directory
setwd("C:/Users/User/Desktop/Coursera Data/Course 4/Week4")
#Reading the Data File in R
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#Extracting Baltimore City data
Data_Baltimore <- subset(NEI, fips == "24510")
# subsetting SCC with Motor Vehichles
is_vehicle  <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
data_motor_vehicle <- SCC[is_vehicle, ]

# merging dataframes
merge_NEI_SCC <- merge(Data_Baltimore, data_motor_vehicle, by="SCC")

# summing emission data per year
totalEmissions_motor <- with(merge_NEI_SCC, tapply(Emissions,year,sum))

#Creating a png File to store the graph
png("plot5.png")
# plotting
barplot(totalEmissions_motor, xlab = "Year", ylab = "Total Emission", 
        main = "Total Emission from Motor Vehicles of Baltimore")
dev.off()