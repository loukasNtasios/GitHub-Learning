
### Ntasios Loukas ###

#read data
productivity_data <- read.csv("C:/Users/ntasi/Desktop/DAMA/DAMA/DAMA 51/Quiz 2/productivity_data.csv", sep=";")
View(productivity_data)


# Conduct in R, a paired t-test to check both hypotheses 
#Report the p values and draw a conclusion on whether we can accept or not the null hypothesis at a significance level of a=0.05


# Paired t-test for Change in Productivity
change_test <- t.test(productivity_data$Before, productivity_data$After, paired = TRUE)
cat("Paired t-test for Change in Productivity:\n")
cat("p-value:", change_test$p.value, "\n")
cat("Conclusion:", ifelse(change_test$p.value < 0.05, "Reject the null hypothesis", "Fail to reject the null hypothesis"), "\n\n")

# Paired t-test for Improvement of Productivity
improvement_test <- t.test(productivity_data$Before, productivity_data$After, paired = TRUE, alternative = "greater")
cat("Paired t-test for Improvement of Productivity:\n")
cat("p-value:", improvement_test$p.value, "\n")
cat("Conclusion:", ifelse(improvement_test$p.value < 0.05, "Reject the null hypothesis", "Fail to reject the null hypothesis"), "\n")

#create the table 
satisfaction_table <- matrix(c(35, 23, 41, 16), nrow = 2, byrow = TRUE)

#calculate chi square
chi_square_result <- chisq.test(satisfaction_table)
chisq.test(satisfaction_table)

#compare value and made the conclusion
p_value <- chi_square_result$p.value
conclusion <- ifelse(p_value < 0.05, "Reject the null hypothesis", "Fail to reject the null hypothesis")

cat("p-value =", p_value, "\n")
cat("Conclusion:", conclusion, "\n")



