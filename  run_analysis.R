# Function to combine the test and training data sets
getCombinedDS <- function(dsFileName){
    # read training data for the key
    train_data <- read.table(paste("Dataset/train/", dsFileName, "_train.txt",sep = ""))
    # read testing data for the key
    test_data <- read.table(paste("Dataset/test/", dsFileName , "_test.txt", sep = ""))
    # merge the training and testing data for the key
    rbind(train_data, test_data)
}
# get the full data set
fullDS <- getCombinedDS("X")
# read the activity labels
activityLabel <- read.table("Dataset/activity_labels.txt")
# clear the label of underscore.
activityLabel[[2]] <- tolower(sub("_","", activityLabel[[2]]))
# read the full activity data
activity <- getCombinedDS("y")
# convert activity to factor and give it activity labels
activity <- factor(activity$V1, activityLabel[[1]], labels = activityLabel[[2]])
# get the combined subject
subject <- getCombinedDS("subject")
# conver the subject to factor
subject <- factor(subject$V1)
# create the sub set dataset with mean and std.
SubSetDS <- data.frame(activity = activity,
                       subject = subject,
                       XtBodyAccMean = fullDS[[1]], 
                       YtBodyAccMean = fullDS[[2]], 
                       ZtBodyAccMean = fullDS[[3]], 
                       XtBodyAccStd = fullDS[[4]], 
                       YtBodyAccStd = fullDS[[5]], 
                       ZtBodyAccStd = fullDS[[6]], 
                       XtGravityAccMean = fullDS[[41]], 
                       YtGravityAccMean = fullDS[[42]], 
                       ZtGravityAccMean = fullDS[[43]], 
                       XtGravityAccStd = fullDS[[44]], 
                       YtGravityAccStd = fullDS[[45]], 
                       ZtGravityAccStd = fullDS[[46]], 
                       XtBodyAccJerkMean = fullDS[[81]], 
                       YtBodyAccJerkMean = fullDS[[82]], 
                       ZtBodyAccJerkMean = fullDS[[83]], 
                       XtBodyAccJerkStd = fullDS[[84]], 
                       YtBodyAccJerkStd = fullDS[[85]], 
                       ZtBodyAccJerkStd = fullDS[[86]], 
                       XtBodyGyroMean = fullDS[[121]], 
                       YtBodyGyroMean = fullDS[[122]], 
                       ZtBodyGyroMean = fullDS[[123]], 
                       XtBodyGyroStd = fullDS[[124]], 
                       YtBodyGyroStd = fullDS[[125]], 
                       ZtBodyGyroStd = fullDS[[126]], 
                       XtBodyGyroJerkMean = fullDS[[161]], 
                       YtBodyGyroJerkMean = fullDS[[162]], 
                       ZtBodyGyroJerkMean = fullDS[[163]], 
                       XtBodyGyroJerkStd = fullDS[[164]], 
                       YtBodyGyroJerkStd = fullDS[[165]], 
                       ZtBodyGyroJerkStd = fullDS[[166]], 
                       tBodyAccMagMean = fullDS[[201]], 
                       tBodyAccMagStd = fullDS[[202]], 
                       tGravityAccMagMean = fullDS[[214]], 
                       tGravityAccMagStd = fullDS[[215]], 
                       tBodyAccJerkMagMean = fullDS[[227]], 
                       tBodyAccJerkMagStd = fullDS[[228]], 
                       tBodyGyroMagMean = fullDS[[240]], 
                       tBodyGyroMagStd = fullDS[[241]], 
                       tBodyGyroJerkMagMean = fullDS[[253]], 
                       tBodyGyroJerkMagStd = fullDS[[254]], 
                       XfBodyAccMean = fullDS[[266]], 
                       YfBodyAccMean = fullDS[[267]], 
                       ZfBodyAccMean = fullDS[[268]], 
                       XfBodyAccStd = fullDS[[269]], 
                       YfBodyAccStd = fullDS[[270]], 
                       ZfBodyAccStd = fullDS[[271]], 
                       XfBodyAccmeanMreq = fullDS[[294]], 
                       YfBodyAccmeanMreq = fullDS[[295]], 
                       ZfBodyAccmeanMreq = fullDS[[296]], 
                       XfBodyAccJerkMean = fullDS[[345]], 
                       YfBodyAccJerkMean = fullDS[[346]], 
                       ZfBodyAccJerkMean = fullDS[[347]], 
                       XfBodyAccJerkStd = fullDS[[348]], 
                       YfBodyAccJerkStd = fullDS[[349]], 
                       ZfBodyAccJerkStd = fullDS[[350]], 
                       XfBodyAccJerkmeanMreq = fullDS[[373]], 
                       YfBodyAccJerkmeanMreq = fullDS[[374]], 
                       ZfBodyAccJerkmeanMreq = fullDS[[375]], 
                       XfBodyGyroMean = fullDS[[424]], 
                       YfBodyGyroMean = fullDS[[425]], 
                       ZfBodyGyroMean = fullDS[[426]], 
                       XfBodyGyroStd = fullDS[[427]], 
                       YfBodyGyroStd = fullDS[[428]], 
                       ZfBodyGyroStd = fullDS[[429]], 
                       XfBodyGyromeanMreq = fullDS[[452]], 
                       YfBodyGyromeanMreq = fullDS[[453]], 
                       ZfBodyGyromeanMreq = fullDS[[454]], 
                       fBodyAccMagMean = fullDS[[503]], 
                       fBodyAccMagStd = fullDS[[504]], 
                       fBodyAccMagMeanFreq = fullDS[[513]], 
                       fBodyBodyAccJerkMagMean = fullDS[[516]], 
                       fBodyBodyAccJerkMagStd = fullDS[[517]], 
                       fBodyBodyAccJerkMagMeanFreq = fullDS[[526]], 
                       fBodyBodyGyroMagMean = fullDS[[529]], 
                       fBodyBodyGyroMagStd = fullDS[[530]], 
                       fBodyBodyGyroMagMeanFreq = fullDS[[539]], 
                       fBodyBodyGyroJerkMagMean = fullDS[[542]], 
                       fBodyBodyGyroJerkMagStd = fullDS[[543]], 
                       fBodyBodyGyroJerkMagMeanFreq = fullDS[[552]])
# write the sub set to file.
write.table(SubSetDS, file = "SubSetDS.txt", append = FALSE, quote = F, sep = " ",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = TRUE, qmethod = c("escape", "double"),
            fileEncoding = "")

# avgSubset <- NULL
# col_names <- names(SubSetDS)
# for (activity_key in levels(SubSetDS$activity)) {
#     for (subject_key in levels(SubSetDS$subject)) {
#         ASDS <- SubSetDS[(SubSetDS$activity == activity_key & SubSetDS$subject == subject_key),]
#         tempDS <- data.frame(activity = activity_key, subject = subject_key)
#         for(i in 3:length(ASDS)){
#             tempDS[[col_names[i]]] = mean(ASDS[[col_names[i]]])
#         }
#         if(is.null(avgSubset)){
#             avgSubset = tempDS
#         }else{
#             avgSubset <- rbind(avgSubset, tempDS)
#         }
#     }
# }
getMean<- function(ASDS){
    tempDS <- numeric()
    for(i in 3:length(ASDS)){
        tempDS[col_names[i]] = mean(ASDS[[col_names[i]]])
    }
    tempDS
}
p_ds <- split(SubSetDS, SubSetDS[,c('activity','subject')])  %>% sapply(getMean)
act <- character()
subj <- character()
for(act_sub in strsplit(colnames(p_ds),"\\.")){
    act <- c(act, act_sub[1])
    subj <- c(subj, act_sub[2])
}
avgSubset <- data.frame(activity = factor(act), subject = factor(subj))
sub_sets <- rownames(p_ds)

for(i in 1:length(sub_sets)){
    avgSubset[[sub_sets[i]]] = p_ds[i,]
}

# write the Avg sub set to file.
write.table(avgSubset, file = "avgSubset.txt", append = FALSE, quote = F, sep = " ",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = TRUE, qmethod = c("escape", "double"),
            fileEncoding = "")
