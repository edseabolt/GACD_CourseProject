# This script assumes the "UCI HAR Dataset" directory is located in your current working directory.

library(dplyr)

# Helper function that initializes and stores a variable in the global environment.
# When this function is invoked for a variable that does yet exist, it will evaluate
# the provided function and store the result in the global environment under the provided
# variable name. The primary purpose of this function was to aid in loading the messy
# data sets by caching their contents into the global environment and doing the necessary
# checks to insure their proper initializations while developing this script.
initVar <- function(variableName, FUN, ...) {
    ge <- globalenv()
    result <- NULL
    
    if (exists(variableName, ge)) {
        cat("Reusing result for", variableName, "\n")
        result <- get(variableName, envir = ge)
    } else {
        result <- FUN(...)
        assign(variableName, value = result, envir = ge)
    }
    
    result
}

# Loads all required messy data sets into memory.
loadFiles <- function() {
    cat("Loading messy files\n")
    
    loadFile <- function(fileName) {
        name <- sprintf("UCI HAR Dataset/%s", fileName)
        cat("Loading", fileName, "\n")
        tbl_df(read.table(name))
    }
    
    initVar("activityLabels", loadFile, "activity_labels.txt")
    initVar("features", loadFile, "features.txt")
    initVar("testX", loadFile, "test/X_test.txt")
    initVar("testY", loadFile, "test/y_test.txt")
    initVar("subjectTest", loadFile, "test/subject_test.txt")
    initVar("trainX", loadFile, "train/X_train.txt")
    initVar("trainY", loadFile, "train/y_train.txt")
    initVar("subjectTrain", loadFile, "train/subject_train.txt")
}

getFilteredFeatures <- function() {
    filter(features, grepl("mean", V2, ignore.case = TRUE) | grepl("std", V2, ignore.case = TRUE))
}

# Merges the training and the test sets to create one data set.
runStep1 <- function(Y1, Y2, X1, X2, subTest, subTrain) {
    cat("Running step1\n")
    
    # combine test/train y data row wise.
    combinedY <- rbind(Y1, Y2)
    
    # combine test/train X data row wise.
    combinedX <- rbind(X1, X2)
    
    # combine test/train subject data row wise.
    combinedSub <- rbind(subTest, subTrain)
    
    # combine test/train yX data column wise.
    mergedYX <- cbind(combinedSub, combinedY, combinedX)
    
    # rename columns.
    colnames(mergedYX)[1] <- "Subject"
    colnames(mergedYX)[2] <- "Y1"
    colnames(mergedYX)[3:ncol(mergedYX)] <- paste("V", seq(1, ncol(mergedYX) - 2), sep = "")
    
    # return the merged result.
    mergedYX
}

# Extracts only the measurements on the mean and standard deviation for each measurement.
runStep2 <- function(data, features) {
    cat("Running step2\n")
    
    # filter the mean and std column data out.
    filteredFeatures <- getFilteredFeatures()
    
    # column names that will comprise the filtered set.
    columnNames <- sapply(filteredFeatures$V1, FUN = function(n) {
        paste("V", n, sep = "")
    })
    
    # extract only the filtered set from the original data set.
    subset(data, select = c("Subject", "Y1", columnNames))
}

# Uses descriptive activity names to name the activities in the data set
runStep3 <- function(data, activityLabels) {
    cat("Running step3\n")
    
    # transform numeric activity identifiers to their character based equivalents.
    data$Y1 <- sapply(data$Y1, FUN = function(value) {
        activityLabels[activityLabels == value, ]$V2
    })
    
    data
}

# Appropriately labels the data set with descriptive variable names.
runStep4 <- function(result) {
    cat("Running step4\n")
    
    # create labeled variable names.
    names(result) <- sapply(names(result), FUN = function(colName) {
        if (colName == "Subject") {
            return(colName)
        } else if (colName == "Y1") {
            return("Activity")
        } else {
            # create column names in the form of Measurement<N>. the code book
            # will explain what the actual names mean and their corresponding
            # characteristics.
            colNumber <- as.numeric(substring(colName, 2))
            newColName <- paste("Measurement", as.character(colNumber), sep = "")
            return(newColName)
        }
    })
    
    result
}

# From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
runStep5 <- function(data) {
    cat("Running step5\n")
    
    # compute mean of each variable by subject/activity grouping.
    group_by(data, Subject, Activity) %>% summarise_each(funs(mean))
}

# Main method which executes all other functions.
main <- function() {
    loadFiles()
    
    # compute tidy dataset.
    result <- runStep1(testY, trainY, testX, trainX, subjectTest, subjectTrain) %>%
                runStep2(features) %>%
                runStep3(activityLabels) %>%
                runStep4 %>%
                runStep5
    
    cat("Writing tidy dataset\n")
    write.table(result, file = "tidy.txt", row.name = FALSE)
}

main()
