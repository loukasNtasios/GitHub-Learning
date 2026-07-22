# Ntasios Loukas

#################################################
# Linear Regression and Neural Network Training #
#################################################

#given data frame ds
ds <- data.frame( x = c(rep(5,12), rep(6,8), rep(3,5), rep(4,14), rep(2,12), rep(1,3)), 
                  y = c(rep(700,12), rep(750,8), rep(600,5),  rep(650,14), rep(400,12), rep(350,3)))

#calculate b 

b <- (sum(ds$x) * sum(ds$x * ds$y) - sum(ds$x) * sum(ds$y)) / ( sum(ds$x)* sum(ds$x^2) - sum(ds$x)^2 )

#calculate A

A  <- (sum(ds$y) - b * sum(ds$x)) / sum(ds$x)
sol <- solve(A,b) 
print(round(sol,3))

print(A, 3)
print(b, 3)

#for given X values 7,10,12,15
X_values <- c(7, 10, 12, 15)

#predict Y values
predicted_Y <- A + b * X_values
print(predicted_Y, 3)


calc_output <- function(x, w, b) {

  return( max(0, sum(x * w) + b))
}

# Given input, weight, and bias
w <- c(0.75, 0.75)
x <- c(0.1, 0.1)
b <- 0.5

result1 <- calc_output(x, w, b)
print(result1, 3)


# Given input, weight, and bias
w <- c(0.25, 0.25)
x <- c(1, 1)
b <- 1.25

result2 <- calc_output(x, w, b)
print(result2, 3)


#update_w function
update_w <- function(x, w, b, delta, a) {
  
  w <- w + a * delta * x
  b <- b + a * delta
  
  return(c(w, b))
}

# Given parameters
x <- c(0.1, 0.9)
w <- c(0.7, 0.3)
b <- 1
delta <- -1
a <- 0.1

# Update weights using the update_w function
updated_params <- update_w(x, w, b, delta, a)
print(updated_params, 3)

# Given parameters
x <- c(0.8, 0.2)
w <- c(0.1, 1.1)
b <- 0.5
delta <- 2
a <- 0.1

# Update weights using the update_w function
updated_params_2 <- update_w(x, w, b, delta, a)
print(updated_params_2, 3)

#d

x <- cbind(c(0,1,0,1), c(0,0,1,1)) 

y <- c(0,0,0,1) 

w <- c(0.5, 0.5, 0.5, 0.5) 

a <- 0.1 



for (i in 1:1000){ 
  
  for (j in 1:4){ 
    
    output <- calc_output(x[j, ], w, b )
   
    delta <- y[j] - output 
    
    w <- update_w(x[j, ], w ,b , delta, a)
    
  } 
  
} 


