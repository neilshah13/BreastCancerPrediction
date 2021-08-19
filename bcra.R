library(BCRA)

id <- 1
curr_age <- as.integer(readline(prompt="Enter your current age: "))
curr_age <- scan("stdin", integer(), n=1)
# base projection is 5 years
proj_age <- curr_age + 5
# Singapore average life expectancy of women is 85.7.
# BCRA is known to underestimate risk and thus we increase the age to 90.

max_age <- 90
N_Biop <- as.integer(readline(prompt="The number of biopsies, If unknown enter 99: "))
N_Biop <- scan("stdin", integer(), n=1)
HypPlas <- as.integer(readline(prompt="Did biopsy display atypical hyperplasia? 0 = no, 1 = yes, 99 = Unknown, (if no biopsies done, please enter 99) : "))
HypPlas <- scan("stdin", integer(), n=1)
AgeMen <- as.integer(readline(prompt="Age at first menstruation, less than or equal to initial age, If unknown enter 99: "))
AgeMen <- scan("stdin", integer(), n=1)
Age1st <- as.integer(readline(prompt="Age at first live birth, greater or equal to age at menarchy and less than or equal to initial age, 98=nulliparous, 99=unk: "))
Age1st <- scan("stdin", integer(), n=1)
N_rels <- as.integer(readline(prompt="The number of 1st degree relatives with BrCa gene, If unknown enter 99:: "))
N_rels <- scan("stdin", integer(), n=1)
# We assume this is being used in a Singaporean context
race <- 11
x <- data.frame("ID"=id,
                "T1"=curr_age,
                "T2"= proj_age,
                "N_Biop"=N_Biop,
                "HypPlas"=HypPlas,
                "AgeMen"=AgeMen,
                "Age1st"=Age1st,
                "N_Rels"=N_rels,
                "Race"=race)
### For 5 year risk projection ###
#print('5 year risk projection')
abs_risk <- absolute.risk(x)
print(paste("Absolute risk in percentage of Breast Cancer in the next 5 years is",abs_risk))

### For lifetime risk projection ###
x$T2=max_age
#print('Lifetime risk projection')
print(paste("Absolute risk in percentage of Breast Cancer in lifetime is", absolute.risk(x)))
#relative.risk(x)
#risk.summary(x)

#### Further Information on Race ####
# 1=Wh White 1983-87 SEER rates (rates used in NCI BCRAT)
# 2=AA African-American
# 3=HU Hispanic-American (US born) 1995-04
# 4=NA Other (Native American and unknown race)
# 5=HF Hispanic-American (Foreign born) 1995-04
# 6=Ch Chinese-American
# 7=Ja Japanese-American
# 8=Fi Filipino-American
# 9=Hw Hawaiian-American
# 10=oP Other Pacific Islander
# 11=oA Other Asian