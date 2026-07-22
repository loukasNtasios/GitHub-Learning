# Ntasios Loukas

#####################
# Apriori Algorithm #
#####################



install.packages("arules")
install.packages('arulesViz')
library(arules)
library('arulesViz')

#load dataset

visits <- read.transactions("c:\\Users\\Loukas\\Desktop\\DAMA\\DAMA 51\\Quiz4\\countries.csv", format="basket", header=FALSE, sep=",", rm.duplicates=FALSE)

# a) Inspect the dataset and provide the information requested in the following table

summary(visits)

# Run the Apriori algorithm for a minimum support threshold of 0.2, a minimum 
#confidence threshold of 0.8, and a minimum of 2 items involved in a rule. Fill in the 
#information in the following table. Then, inspect the rules identified and fill in the 
#missing information denoted with a question mark in the next table. In case a rule does 
#not exist, write “N/A” in place of the question mark.

apriori_result <- apriori(visits, parameter = list(support = 0.2, confidence = 0.8, minlen = 2))

#inspect results of apriori arlgorithm
inspect(sort(apriori_result, by = "lift"))

#  Run the Apriori algorithm for a minimum confidence threshold of 0.8, a minimum of 2 
#items involved in a rule, and for values of the minimum support threshold ranging from 
#0.125 up to 0.25 with a step of 0.025. How does the number of association rules 
#change in relation to the minimum support threshold value? Explain

#create the loop set min value for support threshold 0.125
start <- 0.125

#set max value for support threshold 0.25
end <- 0.25

#set the step
step <- 0.025

#set support value 
min_value <- seq(start, end, by = step)

#store values for rules
num_rules <- numeric(length(min_value))

for (i in seq_along(min_value)){
  value <- min_value[i]
  apriori_result_2 <- apriori(visits, parameter = list(support = value, confidence = 0.8, minlen = 2))
  num_rules[i] <- length(apriori_result_2)
}

#plot the results
plot(min_value, num_rules, type = "b", xlab = "Minimum Support Threshold", ylab = "Number of Association Rules", main = "Number of Association Rules vs. Minimum Support Threshold")


# Run Apriori algorithm with specified parameters
rules <- apriori(visits, parameter = list(support = 0.2, confidence = 0.8, minlen = 2))

# Filter rules where Cyprus is the antecedent
cyprus_rules <- subset(rules, lhs %in% "Cyprus")

#inspect results
inspect(sort(cyprus_rules, by = "lift"))





