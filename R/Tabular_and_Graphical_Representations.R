
#Ntasios Loukas 

##########################################
# Tabular and Graphical Representations #
##########################################

install.packages("carData")
library(carData)
salaries_data<-Salaries


# Inspect the dataset (using the str function) and print its first six rows

str(salaries_data)
head(salaries_data)

# Create a contingency table, using R, with absolute frequencies for the attributes rank 
#and sex. (Your table should also include the sum of each row/column)

Cons_Table <- table(salaries_data$rank, salaries_data$sex)
addmargins(Cons_Table)

# Create a mosaic plot for the contingency table of the previous question. Do not include 
#the totals of each column/row and use different colours in order to make it easy to 
#identify attribute values

mosaicplot(Cons_Table, main = "Constigency Table",xlab = "Rank", ylab = "Sex", col=c("pink", "cyan"))

#Create a histogram with absolute frequencies for the attribute salary using at least 
#seven bins.

hist(salaries_data$salary, main = "histogram salay", breaks = 10)