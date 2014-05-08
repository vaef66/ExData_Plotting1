# Question 1: download data 

setwd("D:\\mimis\\DA\\DS3-CollectData-C");getwd()  # or: setwd("D:/mimis/DA/DS3-CollectData-C")
# setwd("./2.Quizzes"); getwd()  # up one level: setwd("../")

# create dir if not exists
if(!file.exists("2.Quizzes")) {
  dir.create("2.Quizzes")
}

# download file (csv file)
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", 
              destfile = "./2.Quizzes/housingIdaho2006-Q1.csv")
list.files("./2.Quizzes") # list.files("./")
dateDownloaded = date() 

# read csv file into data frame
housingData = read.table("./2.Quizzes/housingIdaho2006-Q1.csv", sep = ",", header = TRUE)
# or (sep and header set automatically):
housingData = read.csv("./2.Quizzes/housingIdaho2006-Q1.csv")
str(housingData)

# num of houses with value > 1.000.000 (see pg 6 of codebook)
length(subset(housingData$VAL, housingData$VAL == 24)) # 24 stands for 1.000.000+ house value
# or: length(subset(housingData, housingData$VAL == 24)$VAL) 
# length(housingData$VAL)


# Question 3: loading excel files - can't load
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", 
              destfile = "./2.Quizzes/files/NGAP-Q3.xlsx")
download.file(url = "http://www.gsa.gov/dg/pbs/DATA.gov_NGAP.xlsx", destfile = "./2.Quizzes/files/NGAP-Q3.xlsx")
list.files("./2.Quizzes/files") # list.files("./")   
library(xlsx)  # install package first
NGAP = read.xlsx("./2.Quizzes/NGAP-Q3.xlsx", sheetIndex = 1, header = TRUE,
                 colIndex = 7:15, rowIndex = 18:23)
sum(NGAP$Zip*NGAP$Ext,na.rm=T) 


Question 4: loading XML data


# Question 5: manipulating laRGE files
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", 
              destfile = "./2.Quizzes/housingIdaho2006-Q5.csv")
list.files("./2.Quizzes") # list.files("./")



package ‘rJava’ successfully unpacked and MD5 sums checked
package ‘xlsxjars’ successfully unpacked and MD5 sums checked
package ‘xlsx’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\vaef\AppData\Local\Temp\Rtmp8UXwYl\downloaded_packages
