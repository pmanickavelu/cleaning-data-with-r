# Cleaning the Samsung Galaxy accelerometer and gyroscope data.

## Steps Involved
* combine the trainig and test data. to form ```SubSetDS```
* wirting to ```SubSetDS``` to **SubSetDS.txt**
* create subsets of ```SubSetDS``` using all the permutations on ```activity``` and ```subject```
* calculating the mean of the columns for each of the datasets in ```SubSetDS``` and stroing it to ```avgSubset```
* wirting to ```avgSubset``` to **avgSubset.txt**

## Helper Functions
* ```getCombinedDS```: accepts a character as  input which is the file name with out the postfix test|train and joins these files into one data.frame and returns it.
* ```getMean```: accepts the splitup data.frame, and calculates the colMean for the relevent columns 

## Forming ```SubSetDS``` 
* combine the X_train and X_test using ```getCombinedDS``` (```fullDS```)
* combine y_train and y_test using ```getCombinedDS```. convert it to factor using the activity_labels(```activity```)
* combine subject_train and subject_test using ```getCombinedDS```. conver to to factor(```subject```)
* combine ```activity```, ```subject``` and relevent mean and std columns form ```fullDS``` to form ```SubSetDS```

## Calculating the mean of each column for **subject** and **activity** to create ```avgSubset```
* used ```split(SubSetDS, SubSetDS[,c('activity','subject')])``` to create a list of data.frames with each on the permutations of ```activity``` and ```subject```
* pieped in that list to ```getMean``` using *sapply* to get the mean of each of the relevent columns.
* as the put put is a matrix, with interchaged columns and rows. we need to reform the matrix  into data.frame and change the rows into columns.

## Writeing to file.
```
write.table(SubSetDS, file = "SubSetDS.txt", append = FALSE, quote = F, sep = " ",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = TRUE, qmethod = c("escape", "double"),
            fileEncoding = "")
```
***OR***
```
write.table(avgSubset, file = "avgSubset.txt", append = FALSE, quote = F, sep = " ",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = TRUE, qmethod = c("escape", "double"),
            fileEncoding = "")
```


