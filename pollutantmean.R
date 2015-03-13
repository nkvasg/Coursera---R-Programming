pollutantmean <- function(directory, pollutant, id = 1:332) {
  
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Returns the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    
mean_vector <- c()

files <- (Sys.glob("specdata//*.csv"))[id];

for (file in files) {
	data <- read.csv(file, sep = ",")
	pollutant_data <- data[!is.na(data[, pollutant]), pollutant]
	mean_vector <- c(mean_vector, pollutant_data)
}

return(mean(mean_vector))

}

# Test code
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)
