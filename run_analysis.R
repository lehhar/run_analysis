run_analysis <- function(){
        X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")    # reading the training data set
        X_test  <- read.table("./UCI HAR Dataset/test/X_test.txt")      # reading the test data set
        X <- rbind(X_train, X_test)                                     # merging training and test set
        y_train  <- read.table("./UCI HAR Dataset/train/y_train.txt")   # reading activity labels for training set
        y_test  <- read.table("./UCI HAR Dataset/test/y_test.txt")      # reading activity labels for test set
        y <- rbind(y_train, y_test)                                     # merging activity labeles of training and test set
        X$activity <- y                                                 # adds the activity labels of the training set in an extra column
        features  <- read.table("./UCI HAR Dataset/features.txt")       # column names of X
        colnames(X) <- features[,2]                                     # name the columns with the feature names
        len <- nrow(features)
        colnames(X)[len] <- "activity"
        fhelp1 <- vector()
        for (i in 1:nrow(features)){                                    # search for 'mean()' in the column names and remove it
                fhelp1[i] <- sub("mean\\(\\)","",features[i,2])
        }
        fhelp2 <- vector()
        for (i in 1:length(fhelp1)){                                    # search for 'std()' in the column names and remove it
                fhelp2[i] <- sub("std\\(\\)","",fhelp1[i])
        }
        fhelp3 <- vector()
        for(i in 1:length(fhelp2)){                                     # fhelp3 is a vector consisting the information if a column of features consists of either 'mean()' or 'std()' in case the value is FALSE.
                fhelp3[i] <- (fhelp2[i] == features[i,2])
        }
        nhelp1 <- vector()
        j <- 1
        for(i in 1:length(fhelp3)){                                     # nhelp1 is a vector consisting of the columns of X we are interested in
                if(fhelp3[i] == FALSE){
                        nhelp1[j] <- i
                        j <- j+1
                }
        }
        X_select <- X[,c(nhelp1, (len+1))]                              # select only the columns of X fulfilling above requirement and write them in X_select
        X_mean <- aggregate(X_select[,1:66], X_select[,67], mean)       # aggregates the mean for each activity label
        names(X_mean)[names(X_mean) == "V1"] <- "activity"              # renames the column name of activity
        activity_name  <- read.table("./UCI HAR Dataset/activity_labels.txt")   # reading the names of the activity labels
        X_mean$activity <- as.character(X_mean$activity)
        activity_name[,2] <- as.character(activity_name[,2])
        for (i in 1:nrow(X_mean)){                                      # renames the activities with their labels
                for (j in 1:nrow(activity_name)){
                        if(X_mean$activity[i] == activity_name[j,1]){
                                X_mean$activity[i] <- activity_name[j,2]
                       }
                }
        }
        write.table(X_mean,file = "X_mean.txt",row.name=FALSE)          # writes the result in a text file
        X_mean                                                          # prints the result
}
