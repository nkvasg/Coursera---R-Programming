corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations

correlation <- c()

files <- (Sys.glob("specdata//*.csv"))
    
for (file in files) {
	data <- read.csv(file, sep=",")
	complete_data <- data[complete.cases(data),]
	if (nrow(complete_data) > threshold) {
		correlation <- c(correlation, cor(complete_data$sulfate, complete_data$nitrate))
	}
}

return(correlation)

}

# Test code
#cr <- corr("specdata", 150)
cr <- corr("specdata", 400)
#cr <- corr("specdata", 5000)
head(cr)
summary(cr)
length(cr)
