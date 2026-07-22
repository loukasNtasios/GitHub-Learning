
### Ntasios Loukas  ###

#  Using R, create a ROC curve based on the TPR and FPR data provided below

#create the dataset
TPR <- c(0, 0.2, 0.4, 0.4, 0.6, 0.6, 1.0, 1.0)
FPR <- c(0, 0, 0, 0.2, 0.2, 0.6, 0.6, 1.0)

install.packages("pROC")
library(pROC)

# ROC curve
plot(FPR, TPR, type = "b", main = "ROC Curve", xlab = "False Positive Rate (FPR)", ylab = "True Positive Rate (TPR)")

#c Select a threshold of 0.65 for classification. Predictions above this threshold are classified as 1, and below as 0.
#Using R, construct the confusion matrix and include the results in the box below

# Create the dataset
predicted_probabilities <- c(0.9, 0.8, 0.7, 0.6, 0.55, 0.54, 0.53, 0.52, 0.51, 0.5)
actual_class <- c(1, 1, 0, 1, 0, 0, 1, 1, 0, 0)
data <- data.frame(predicted_probabilities, actual_class)

#set the threshold
threshold <- c(0.65)

for (threshold in threshold) {
  # Classify the predictions based on the threshold
  data$predicted_class <- ifelse(data$predicted_probabilities >= threshold, 1, 0)}

# Calculate the TP, FN, FP, TN
TP <- sum(data$predicted_class == 1 & data$actual_class == 1)
FN <- sum(data$predicted_class == 0 & data$actual_class == 1)
FP <- sum(data$predicted_class == 1 & data$actual_class == 0)
TN <- sum(data$predicted_class == 0 & data$actual_class == 0)
cat("TP", TP, "\n")
cat("FN", FN, "\n")
cat("FP", FP, "\n")
cat("TN", TN, "\n")



