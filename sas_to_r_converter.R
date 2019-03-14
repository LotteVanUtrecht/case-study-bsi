#install.packages("sas7bdat")
library("sas7bdat")
bsitotal<-read.sas7bdat("bsitotal.sas7bdat", debug=TRUE)
bsitotal
write.csv2(bsitotal,"bsitotal.csv")

