# Ntasios Loukas

########################
# Entropy calculations #
########################

#Function eye_attr_entropy

eye_attr_entropy_calc <- function(x, attr, subsetParam){ 
   subs <- subset(x,x[attr] == subsetParam) 
  s <- nrow(subs) 
  s1 <- sum(subs$Class == 'A') 
  s2 <- sum(subs$Class == 'B') 
  y <- c(s1/s, s2/s) 
  if (s1==0 || s2==0) 
    return (0) 
  else 
    return (-sum(y * log2(y)))  
}


# calculate for Age and Young
result_1 <- eye_attr_entropy_calc(eyes,'Age','Young')
print(result_1, 3)

result_2 <- eye_attr_entropy_calc(eyes,'Age','Middle-aged')
print(result_2, 3)

result_3 <- eye_attr_entropy_calc(eyes,'Vision','Myopia')
print(result_3, 3)

result_4 <- eye_attr_entropy_calc(eyes,'Astigmatism','Yes')
print(result_4, 3)

result_5 <- eye_attr_entropy_calc(eyes,'Astigmatism','No')
print(result_5, 3)

result_6 <- eye_attr_entropy_calc(eyes,'UseOfGlasses','Often')
print(result_6, 3)

result_7 <- eye_attr_entropy_calc(eyes,'UseOfGlasses','Rare')
print(result_7, 3)



#funcrion that calculate the entropy of the dataset


entropy_before <- function(data) {
  total_instances <- nrow(data)
  
  # Count the number of instances for each class
  class_counts <- table(data$Class)
  
  # Calculate the probability of each class
  class_probabilities <- class_counts / total_instances
  
  # Remove any probabilities equal to 0 to avoid NaN values in entropy calculation
  class_probabilities <- class_probabilities[class_probabilities > 0]
  
  # Calculate entropy
  entropy <- -sum(class_probabilities * log2(class_probabilities))
  
  return(entropy)
}

#calculate original entropy
entropy_before <- entropy_before(eyes)
print(entropy_before)

#calculate information gain for the Age

info_gain_age <- entropy_before -
  (eye_attr_entropy_calc(eyes, "Age", "Young") +
     eye_attr_entropy_calc(eyes, "Age", "Middle-aged") +
     eye_attr_entropy_calc(eyes, "Age", "Elderly"))


print(info_gain_age ,3)

#calculate information gain for the Vision

info_gain_vision <- entropy_before -
  (eye_attr_entropy_calc(eyes, "Vision", "Myopia") +
     eye_attr_entropy_calc(eyes, "Vision", "Farsightedness"))

print(info_gain_vision , 3)

#calculate information gain for the Astigmatism

info_gain_astigmatism <- entropy_before -
  (eye_attr_entropy_calc(eyes, "Astigmatism", "Yes") +
     eye_attr_entropy_calc(eyes, "Astigmatism", "No"))

print(info_gain_astigmatism , 3)

info_gain_glasses <- entropy_before -
  (eye_attr_entropy_calc(eyes, "UseOfGlasses", "Often") +
     eye_attr_entropy_calc(eyes, "UseOfGlasses", "Rare"))

print(info_gain_glasses , 3)



install.packages("caret")
install.packages("rpart.plot")
library(caret)
library(rpart.plot)



eye_data <- read.csv('C:\\Users\\ntasi\\Desktop\\DAMA\\DAMA 51\\Quiz5\\eyes.csv', stringsAsFactors = TRUE)
colnames(eye_data)[5] <- "output"

# Create decision tree using rpart function

dt <- rpart(output ~ Age + Vision + Astigmatism + UseOfGlasses ,data = eye_data , parms=list(split='information'), control = rpart.control(minsplit = 1))
# Plot the decision tree
rpart.plot(dt, type=4, extra=1)

prediction1 <- data.frame(Age="Young", Vision="Myopia", Astigmatism="No", UseOfGlasses="Often")

predict(dt,newdata=prediction1,type="class")

prediction2 <- data.frame(Age="Elderly", Vision="Myopia", Astigmatism="Yes", UseOfGlasses="Often")
predict(dt,newdata=prediction2,type="class")