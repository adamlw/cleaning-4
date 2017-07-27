load_data <- function(){
  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)
  
  activity_labels <<- read.table(unz(temp,"UCI HAR Dataset/activity_labels.txt"))
  features <<- read.table(unz(temp,"UCI HAR Dataset/features.txt"))

  subject_train <<- read.table(unz(temp,"UCI HAR Dataset/train/subject_train.txt"))
  x_train <<- read.table(unz(temp,"UCI HAR Dataset/train/X_train.txt"))
  y_train <<- read.table(unz(temp,"UCI HAR Dataset/train/y_train.txt"))
  
  subject_test <<- read.table(unz(temp,"UCI HAR Dataset/test/subject_test.txt"))
  x_test <<- read.table(unz(temp,"UCI HAR Dataset/test/X_test.txt"))
  y_test <<- read.table(unz(temp,"UCI HAR Dataset/test/y_test.txt"))
  
  unlink(temp)
}

merge_test_train <- function(){
    test_and_train <<- rbind(x_train, x_test)  
}

extract_mean_deviation <- function(){
  subset(features, (grepl("mean", features$V2) | grepl("std", features$V2)) 
                 & !grepl("Freq", features$V2))    
}


load_data()
merge_test_train()