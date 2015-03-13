complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases



files <- (Sys.glob("specdata//*.csv"))
    
nobs <- c()
    
    for (i in id) {
        data <- read.csv(files[i], sep = ",")
        complete_data <- data[complete.cases(data),]
        nobs <- c(nobs, nrow(complete_data))
    }
    
    return(data.frame(id = id, nobs = nobs))
}

# Test code
complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
