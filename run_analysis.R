run_analysis <- function(){
    # Here are the data for the project: 
    # https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
    
    # You should create one R script called run_analysis.R that does the following: 
    # - Merges the training and the test sets to create one data set.
    # - Extracts only the measurements on the mean and standard deviation for 
    #   each measurement. 
    # - Uses descriptive activity names to name the activities in the data set
    # - Appropriately labels the data set with descriptive variable names. 
    # - Creates a second, independent tidy data set with the average of each 
    #   variable for each activity and each subject. 
    
    # Load activity code map, train and test labels
    actNames <- read.table("Data/activity_labels.txt")
    names(actNames) = c("act.code","activity")
    featureList <- read.table("Data/features.txt")
    trainActCodes <- read.table("Data/train/y_train.txt",col.names="act.code")
    trainSubjects <- read.table("Data/train/subject_train.txt",col.names="subject")
    testActCodes <- read.table("Data/test/y_test.txt",col.names="act.code")
    testSubjects <- read.table("Data/test/subject_test.txt",col.names="subject")
        
    # idx of columns with mean() and std()
    relCols <- grep("mean\\(\\)|std\\(\\)",featureList[,2],value=TRUE)
    idx <-featureList[,2] %in% relCols
    dnames = featureList[,2]
    # appropriately rename labels 
    # - ending () replace with blanks
    # - ()- replace with .
    dnames = gsub("\\(\\)$","",gsub("-|\\(\\)-",".",dnames))
    colTypes <- rep("NULL",length(idx))
    colTypes[idx] <- "numeric"
    
    #load only 'mean' and 'std' columns of train and test data
    trainActivity <- merge(trainActCodes,actNames,sort=FALSE) #descriptive activity names
    activity <- trainActivity[,"activity"]   
    trainData <- read.table("Data/train/X_train.txt",col.names=dnames,
                            colClasses=colTypes)
    newTrainData <- cbind(trainSubjects,trainActCodes,activity,trainData)

    testActivity <- merge(testActCodes,actNames,sort=FALSE) #descriptive activity names
    activity <- testActivity[,"activity"]   
    testData <- read.table("Data/test/X_test.txt",col.names=dnames,
                            colClasses=colTypes)
    newTestData <- cbind(testSubjects,testActCodes,activity,testData)
    
    # merge train and test data
    newMergedData <- rbind(newTrainData,newTestData)
    
#     write.table(newTrainData,"newTrainData.csv",row.names=FALSE,sep=",")
#     write.table(newTestData,"newTestData.csv",row.names=FALSE,sep=",")
#     write.table(newMergedData,"newMergedData.csv",row.names=FALSE,sep=",")
    
    # get length of subject and activity codes
    lengthSubjects <- length(sort(unique(newMergedData$subject)))
    lengthActCodes <- length(sort(unique(newMergedData$act.code)))

    # copy merged data to create tidy output, remove activity name columnn to more easily calculate averages
    tidy <- newMergedData[,-3]

    # for each subject and activity, find mean.
    tidy <- by(tidy,list(tidy$subject,tidy$act.code),function(x) colMeans(x))

    # convert output of 'by' function to data frame
    for(i in 1:lengthSubjects){
        for(j in 1:lengthActCodes){
            if(i == 1 & j == 1){
                output <- data.frame(matrix(unlist(tidy[i,j]),nrow=1))
            }
            else{
                newRow <- data.frame(matrix(unlist(tidy[i,j]),nrow=1))
                output <- rbind(output,newRow)
            }
        }
    }
    
    # label Output columns
    tidynames <- c("subject","act.code",paste("avg",dnames[idx],sep="."))
    names(output) <- tidynames

    # add activity name column to output
    output <- merge(output,actNames,sort=FALSE)
    
    # re-order Output columns and re-sort
    output <- output[,c("subject","act.code","activity",names(output[,-c(1,2,length(output))]))]
    output <- output[order(output$subject,output$act.code),]

    # write Output to disk
#write.table(output,"output.csv",row.names=FALSE,sep=",")
    write.table(output,"output.txt",row.names=FALSE)
}