# Ntasios Loukas 

########################
# PCA-Based Regression #
########################

install.packages("AppliedPredictiveModeling")
install.packages("Metrics")
library(AppliedPredictiveModeling)
install.packages("caret")
library(caret)
library(Metrics)


# load the abalone dataset 

data(abalone) 

# exclude the Type and Rings variables and save the dataframe in the df_data variable 


df_data <- subset(abalone, select = -c(Type,Rings))

# keep the Rings variable to y 

 
y <- abalone$Rings


ranking <- filterVarImp(df_data, y, nonpara = FALSE)

# sort the variables by decreasing importance 

ranking$varNames <- rownames(ranking) 


ranked_vars <- ranking[order(- ranking$Overall),]
ranked_vars$varNames 
round(ranked_vars$Overall, 3) 

x_rank <- data.frame(abalone$ShellWeight, abalone$Diameter)
x_rank <- data.frame(scale(x_rank))

model_rank <- lm(y ~ ., data = as.data.frame(cbind(x_rank, y)))
predictions <- predict(model_rank, newdata = as.data.frame(x_rank))

round(mse <- mean((y - predictions)^2), 3)

newdf_data <- data.frame(scale(df_data))
pca_result <- prcomp(newdf_data)
variance_proportion <- pca_result$sdev^2 / sum(pca_result$sdev^2)
round(variance_proportion, 3)

percentage_variance_explained <- sum(variance_proportion[1:2]) * 100
round(percentage_variance_explained, 3)

x_PCA <- pca_result$x
x_PCA2 <- data.frame(PC1 = pca_result$x[, 1], PC2 = pca_result$x[, 2])

x_PCA2$age <- y    

model_PCA <- lm(age ~ PC1 + PC2, data = x_PCA2)

round(mse_PCA <- mse(predict(model_PCA), x_PCA2$age), 3)