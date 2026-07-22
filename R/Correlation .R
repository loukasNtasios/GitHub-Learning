
#Ntasios Loukas 

###################
#  Correlation    #
###################

install.packages("carData")
library(carData)
states_data<-States

# Draw a scatter plot in R to visually check if there exists a relationship (in other words,
#if the attributes are correlated) between SATV (x-axis) and dollars (y-axis).
#Include the labels of both axes.

install.packages("ggplot2")
library(ggplot2)

ggplot(data = states_data, mapping = aes(x = SATV, y = dollars)) + geom_point()

# Using the same method as above, visually identify which one of the following pairs of 
#variables has the greatest correlation (either positive or negative):

#SATV and pay
ggplot(data = states_data, mapping = aes(x = SATV, y = pay)) + geom_point()

#SATM and dollars
ggplot(data = states_data, mapping = aes(x = SATM, y = dollars)) + geom_point()

#SATV and pop
ggplot(data = states_data, mapping = aes(x = SATV, y = pop)) + geom_point()

#SATM and pop
ggplot(data = states_data, mapping = aes(x = SATM, y = pop)) + geom_point()

# calculating in R the value of the 
#Spearman’s rank correlation coefficient for each of the pairs under consideration. Is 
#your selection in the previous question validated?

#SATV and pay
CorA <- cor.test(states_data$SATV, states_data$pay, method = c("spearman"))
CorA[4]

#SATM and dollars
CorB <- cor.test(states_data$SATM, states_data$dollars, method = c("spearman"))
CorB[4]

#SATV and pop
CorC <- cor.test(states_data$SATV, states_data$pop, method = c("spearman"))
CorC[4]

#SATM and pop
CorD <- cor.test(states_data$SATM, states_data$pop, method = c("spearman"))
CorD[4]