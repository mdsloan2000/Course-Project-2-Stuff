fileloader <- function() {
        if (file.exists("./Source_Classification_Code.rds") || file.exists("./summarySCC_PM25.rds")) {
                print("Files Exist ... Running Cleanup")
                cleanup()
        } else {
                print("Files Do Not Exist ... Extracting Only") 
        }
        unzip("./exdata-data-NEI_data.zip")
        return (TRUE)
}

cleanup <- function() {
        if (file.exists("./Source_Classification_Code.rds")) { file.remove("./Source_Classification_Code.rds")}
        if (file.exists("./summarySCC_PM25.rds")) { file.remove("./summarySCC_PM25.rds")}
}