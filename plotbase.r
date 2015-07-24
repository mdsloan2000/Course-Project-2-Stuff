#       plotbase is the prototype function on which all the Course Project 2 plots are based.
#       It loads the data file and prepares it for use.
#
#


plotbase <- function() {
#       Sources fileloader.r and refreshes data.
        source("fileloader.r")
        fileloader()

# Read the rds files "./Source_Classification_Code.rds" and "./summarySCC_PM25.rds" into local variables.
        SCC <- readRDS("./Source_Classification_Code.rds")
        NEI <- readRDS("./summarySCC_PM25.rds")

# plot commands go here.

        

# clean up files
        cleanup()
        
}