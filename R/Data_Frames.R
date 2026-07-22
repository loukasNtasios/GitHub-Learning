
#Ntasios Loukas 

################
# Data Frames  #
################

install.packages("carData")
library(carData)
salaries_data<-Salaries

# Identify the number of professors (of all ranks) that work on Discipline A

df4A <- data.frame(salaries_data$rank,salaries_data$discipline)

apantisi_4A <- subset(df4A, salaries_data.discipline == "A")

nrow(apantisi_4A)

# Identify the number of male and female professors (of all ranks) that have a salary of more 
#than 150000$.

df4B <- data.frame(salaries_data$sex,salaries_data$salary)

max <- subset(df4B, salaries_data.salary >150000 )

table(max$salaries_data.sex)

# Calculate, in R, the average years of service for professors of all ranks. Calculate the 
#average years of service for Associate Professors.

df4C <- data.frame(salaries_data$rank, salaries_data$yrs.service)
professors <-subset(df4C, salaries_data.rank == "Prof")
result1 <- mean(professors$salaries_data.yrs.service)
result1

Assprof <-subset(df4C, salaries_data.rank == "AssocProf")
result2 <- mean(Assprof$salaries_data.yrs.service)
result2

# Create a new ordinal attribute called career_stage which may take the values early,
#mid and late that correspond to the following intervals (-1, 10], (10, 25], and (25, 60], 
#respectively. Calculate the number of professors thar are at an early stage of their career.

df4D <- data.frame(salaries_data$rank, salaries_data$yrs.service)
prof <- subset(df4D, salaries_data.rank == "Prof")
prof$career_stage <-cut(prof$salaries_data.yrs.service, breaks =c(-1, 10, 25,61),labels =  c("early", "mid", "late"), right = FALSE)

table(prof$career_stage)

# Print out the data of the 3 professors, which have the most years of service, after first 
#ordering the data frame in decreasing order based on the attribute yrs.service. 

prof_years_decres <- prof[order(prof$salaries_data.yrs.service,decreasing=TRUE),]
View(prof_years_decres)
head(prof_years_decres, 3)