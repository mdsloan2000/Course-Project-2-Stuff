#       plotbase is the prototype function on which all the Course Project 2 plots are based.
#       It loads the data file and prepares it for use.
#
#


plot5 <- function() {

# attach the ggplot2 library
        library("plyr", lib.loc="~/R/win-library/3.2")
        library("ggplot2", lib.loc="~/R/win-library/3.2")
        
        
# Read the rds files "./Source_Classification_Code.rds" and "./summarySCC_PM25.rds" into local variables.
        SCC <- readRDS("./Source_Classification_Code.rds")
        NEI <- readRDS("./summarySCC_PM25.rds")
        

# Build the Data Set
        SCC_codes <- as.character(SCC$SCC[grep ("Onroad", as.character(SCC$Data.Category))]) # builds list of Onroad codes.
        NEI <- subset(NEI, fips == "24510")  #Subsets the Baltimore Data
        NEI <- NEI[NEI$SCC %in% SCC_codes,] #subsets the data based on the Onroad List.
        NEI <- ddply(NEI, .(year), summarize, Emissions = (sum(Emissions)))

# plot commands go here.
        p <- qplot(as.character(year), Emissions, data=NEI) + geom_bar(stat = "Identity") 
        p <- p + ylab("Fuel Emissions From Motor Vehices (Baltimore City") + xlab ("Emissions per Year")
        print(p)
        png(file = "./plot5.png", width = 585, height = 529, pointsize = 9)
        print(p)
        dev.off()
        
}