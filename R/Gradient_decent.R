# Ntasios Loukas

####################
# Gradient decent  #
####################

install.packages("AppliedPredictiveModeling")
library(AppliedPredictiveModeling)

# load the “abalone” dataset  
data(abalone)

n <- nrow(abalone) 
X <- as.matrix(cbind(1, abalone[, 2:8]))

colnames(X)<-NULL 

y <- abalone$Rings

theta <- rep(0, 8)

mse_cost <- function(X, y, theta){ 
  n <- length(y) 
  #calculate the mse cost 
  
  s <- sum((X %*% theta - y)^2) / n
  return(s) 
} 

# test the cost function 

X0 <- cbind(rep(1,10), rep(1,10) ) 

y0 <- 5*rep(1,10) 

theta0 <- rep(1, 2)

mse_cost_value <- mse_cost(X0, y0, theta0)
print(mse_cost_value)

gradientDescent <- function(X, y, theta, learning_rate, num_iter){ 
  nrOfObj <- length(y) 
  #define a vector of zeros for storing the losses at each iteration 
  l_loss <- rep(0, num_iter)
  for( i in 1:num_iter){ 
    #calculate the gradient at X, y, using the current theta parameters 
    gradient <- (1 / nrOfObj) * t(X) %*% (X %*% theta - y)
    
    #calculate the update of the parameters theta and store it in theta 
    theta <- theta - learning_rate * gradient
    
    #calculate the loss at the I iteration and store it at the “l_loss” vector.    
    l_loss[i] <- mse_cost(X, y, theta) 
    
  } 
  
  # for returning 2 objects in R we need to pack them in a list 
  res <-list(theta, l_loss) 
  return(res) 
  
} 

theta_initial <- rep(0, 8)

learning_rate <- 0.1
num_iter <- 150

gradient_descent_result <- gradientDescent(X, y, theta_initial, learning_rate, num_iter)
final_theta <- gradient_descent_result[[1]]
loss_values <- gradient_descent_result[[2]]

cat("Calculated Parameters after 150 steps of Gradient Descent:\n")
round(final_theta , 3)


plot(1:num_iter, loss_values, type = "l", xlab = "Iterations", ylab = "MSE Loss", main = "Convergence Plot of Gradient Descent")
