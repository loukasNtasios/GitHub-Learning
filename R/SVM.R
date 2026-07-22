#Ntasios Loukas


########
# SVM  #
########

# Iris dataset

library(dplyr) 

data("iris") 

iris <- iris %>% mutate(Class = case_when(Species =='setosa' ~ 1,Species!= 'setosa' ~ -1)) 

ds <- iris[,c(3,4,6)] 

w = c(1,1) 

C <- 1 

r <- 0.1 



calc_J <- function (ds, w, C){ 
  
  #calculate the max 
  
  tmp <- 1 - (w[1]*ds$Petal.Length+w[2]*ds$Petal.Width)*ds$Class 
  
  mMax <- pmax(tmp, 0, na.rm = TRUE) 

  return( sum(mMax) + (C *0.5 * sum(w^2) ) )
  
} 



#calculate the J to fill in the missing values
# w = [0.1 , 0.1] and c= 1
w = c(0.1,0.1) 
C <- 1 

result22 <- calc_J(ds,  w, C)
print(result22)

#calculate the J to fill in the missing values
# w = [0.1 , 0.1] and c= 0.5

w = c(0.1,0.1) 

C <- 0.5

result23 <- calc_J(ds, w, C)
print(result23)

#calculate the J to fill in the missing values
# w = [0.5 , 0.5] and c= 1

w = c(0.5 , 0.5) 

C <- 1

result24 <- calc_J(ds,  w, C)
print(result24)

#calculate the J to fill in the missing values
# w = [0.5 , 0.5] and c= 0.5

w = c(0.5 , 0.5) 

C <- 0.5

result25 <- calc_J(ds,  w, C)
print(result25)

#calculate the J to fill in the missing values
# w = [1 , 1] and c= 1

w = c(1 , 1) 

C <- 1

result26 <- calc_J(ds,  w, C)
print(result26)


#calculate the J to fill in the missing values
# w = [1 , 1] and c= 0.5

w = c(1 , 1) 

C <- 0.5

result27 <- calc_J(ds,  w, C)
print(result27)


#C

calc_DJ <- function (ds, w, C){ 
  
  #calculate the max 
  
  tmp <- 1-(w[1]*ds$Petal.Length+w[2]*ds$Petal.Width)*ds$Class 
  
  mMax <- pmax(tmp, 0, na.rm = TRUE) 
  
  #find values which are 0 
  
  indices <-t(which(mMax!=0, arr.ind = TRUE)) 
  
  d1 <- w[1] + C * sum(-ds$Class[indices] * ds$Petal.Length[indices])
  
  d2 <- w[2] + C * sum(-ds$Class[indices] * ds$Petal.Width[indices])
  
  return (c(d1,d2)) 
  
} 

#calculate the DJ to fill in the missing values
# w = [0.5 , 0.5] and c= 1

w = c(0.5 , 0.5) 

C <- 1

result31 <- calc_DJ(ds, w, C)
print(result31)

#calculate the DJ to fill in the missing values
# w = [1 , 1] and c= 0.5

w = c(1 , 1) 

C <- 0.5

result32 <- calc_DJ(ds, w, C)
print(result32)



#c

# Initializations

w <- c(1, 1) 
C <- 1  
learning_rate <- 0.1  
iterations <- 5  




# Iterative optimization
for (i in 1:iterations) {
  # Calculate objective function value
  J <- calc_J(ds, w, C)
  
  # Calculate gradient
  gradient <- calc_DJ(ds, w, C)
  
  # Update weights
  w <- w - learning_rate * gradient
  
  # Print values for this iteration
  cat("Iteration", i, ":\n")
  cat("J(w):", J, "\n")
  cat("Gradient:", gradient, "\n")
  cat("w:", w, "\n\n")
}

w = c(1,1) # Initialize vector w, so as to avoid continuing from previous experiments 
C <- 1
set.seed(2024) 

for( i in 1:5 ){ 
  
  indices <- round(runif(50, min=1, max=nrow(ds)),0) 
  
              J <- calc_J (ds[indices, ], w, C) 
               
               DJ <- calc_DJ(ds[indices, ], w, C) 
               
               w <- w - r * DJ 
               
               cat('iteration = ', i, '\n') 
               
               cat('J = ', round(J,3), '\n') 
               
               cat('dJ = ', round(DJ,3), '\n') 
               
               cat('w = ', round(w,3), '\n\n') 
               
} 
