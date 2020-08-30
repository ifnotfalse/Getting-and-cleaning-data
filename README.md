Getting and Cleaning Data Course Project
================
Colin
2020/8/29

### Data reading

You can read the data with the following codes:

``` r
data <- read.table("./data/tidy_dataset.txt", header = TRUE) #the file url should be modified accordingly if the txt file is saved in a different directory
```

### The repository includes the following files:

  - README.md  
  - run\_analysis.R: the R script for generating the dataset  
  - CodeBook.md: Shows information about the variables used in the
    dataset

### Original dataset

The original dataset and its accompanied README document and Codebook
are available from [the cloudfront
page](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
