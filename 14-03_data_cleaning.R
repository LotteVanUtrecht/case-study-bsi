bsitotal <- read.csv2("bsitotal.csv")

#convert some categorial variables to factors
bsitotal[,"pid"] <- as.factor(bsitotal[,"pid"])
bsitotal[,"parent"] <- as.factor(bsitotal[,"parent"])

#convert some logical values to booleans
bsitotal[,"treatment"] <- as.logical(bsitotal[,"treatment"])
bsitotal[,"parent_marijuana"] <- as.logical(bsitotal[,"parent_marijuana"])
bsitotal[,"parent_alcohol"] <- as.logical(bsitotal[,"parent_alcohol"])

for (i in 1:12267){
  if (bsitotal[i,"parent_died"]==""){
    bsitotal[i,"parent_died"] <- NA
  }
  if (bsitotal[i,"drug_status"]==""){
    bsitotal[i,"drug_status"] <- NA
  }
  if (bsitotal[i,"season"]==""){
    bsitotal[i,"season"] <- NA
  }
}
bsitotal[,"parent_died"] <- as.logical(as.numeric(bsitotal[,"parent_died"])-2) 
#the -2 is necessary because the trues were factor #3, while the falses were factor #2


summary(bsitotal$study_month)
hist(bsitotal$true_month)
summary(bsitotal$season)


summary(bsitotal$gender) #note that the NA's are all missing data, we know everyones gender

summary(bsitotal$age_at_baseline)
summary(bsitotal$age)

summary(bsitotal$parent_alcohol)
summary(bsitotal$parent_marijuana)
summary(bsitotal$parent_died)

summary(bsitotal$drug_status)

plot(density(bsitotal$bsi_gsi,na.rm=T))
hist(bsitotal$bsi_gsi,na.rm=T)
summary(bsitotal$bsi_gsi)

write.csv2(bsitotal,"bsitotal_14-03.csv")
