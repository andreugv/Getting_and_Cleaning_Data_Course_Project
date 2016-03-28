run_analysis <- function (UCIHARpath){
        packages <- c("dplyr")
        if (length(setdiff(packages, rownames(installed.packages()))) > 0) {
                install.packages(setdiff(packages, rownames(installed.packages())))  
        }
        library(dplyr)
        ## Checks and installs missing packages, then loads.

        setwd(UCIHARpath) ## sets WD to "UCHIHARpath" provided by user.

        features <- read.table("features.txt")  ## Reads file with ColNames
        features2 <- features [, 2] ## Gets the actual ColNames
        
        trainA <- read.table("train/y_train.txt", col.names = "Activity")
        testA <- read.table("test/y_test.txt", col.names = "Activity")
        ## trainA and testA are the activity codes for RowNames
        trainA$Activity <- lapply(trainA$Activity, switch, "1" = "Walk", 
                                  "2" = "Walk_Upstairs", "3" = "Walk_Downstairs",
                                  "4" = "Sit", "5" = "Stand", "6" = "Lay")
        testA$Activity <- lapply(testA$Activity, switch, "1" = "Walk", 
                                 "2" = "Walk_Upstairs", "3" = "Walk_Downstairs",
                                 "4" = "Sit", "5" = "Stand", "6" = "Lay")
        ##trainA and testA are converted to text labels depending on activity #.
        
        trainSbj <- read.table("train/subject_train.txt", col.names = "Subject")
        testSbj <- read.table("test/subject_test.txt", col.names = "Subject")
        ## trainSbj and testSbj contain the subject code.
        
        train <- read.table("train/X_Train.txt", header = F, sep = "", 
                            col.names = features2)
        ## create train table with Features ColNames
        
        test <- read.table("test/X_Test.txt", header = F, sep = "", 
                           col.names = features2)
        ## create test table with Features ColNames
        
        train2 <- data.frame(trainSbj, trainA, train)
        test2 <- data.frame(testSbj, testA, test)
        ## Subject and Activity columns are added to first columns in DFs
        
        
        merged <- merge(train2, test2, all = T, sort = F)
        ## merges both DF, takes "train2" first, and appends 
        ## "test2" rows at the bottom.
        
        extract <- merged[grep("Subject|Activity|mean()|std()", colnames(merged))]
        ## extract contains a DF with only ColNames with string = mean() or 
        ##std(), and first column Activity.
        
        extract$Activity <- as.factor(unlist(extract$Activity))
        ## To "flatten" extract DF.

        grouped <- group_by(extract, Subject, Activity)
        ## Groups 1st DF by subject and then by activity.
        
        grouped_mean <- summarise_each(grouped, funs(mean))
        ## Applies mean to all, non-grouped columns resulting in final DF.
        
        colnames(grouped_mean)[3:81] <- paste("Mean", 
                                        colnames(grouped_mean)[3:81], sep = "_")
        ## Adds "_Mean" to relable grouped_mean for the last transformation. 
        
        write.table(grouped_mean, "grouped_mean.txt", row.names = FALSE)
        ## Writes a .txt file containing final DF.
        
}