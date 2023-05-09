insurance_data <- read.csv("insurance.csv", na ="")
str(insurance_data)

#convert the categorical variables sex , smoker, region to factor.

insurance_data$sex_data <- factor(insurance_data$sex, labels = c("female","male"))
insurance_data

insurance_data$Smoker_data <- factor(insurance_data$smoker, labels = c("no","yes"))
insurance_data

insurance_data$region_data <- factor(insurance_data$region, labels = c("southwest","southeast","northwest","northeast"))
insurance_data
#alternative
insurance_data$region_data <- factor(insurance_data$region)
insurance_data

str(insurance_data)
#replacing the existing columns.
insurance_data$sex <- insurance_data$sex_data
insurance_data$smoker <- insurance_data$Smoker_data
insurance_data$region <- insurance_data$region_data
insurance_data

#balance of the categorical variablesd 

table(insurance_data$sex)

table(insurance_data$smoker)

table(insurance_data$region)

#initial investigation of the data
install.packages("psych")
library(psych)

pairs.panels(insurance_data,
             smooth = FALSE,
             density = TRUE,
             method = "spearman",
             pch = 21,
             cor = TRUE,
             factor = TRUE)


set.seed(1)
# formula = dependent ~ independent, independent 
# . means everything
attach(insurance_data)
model <- lm(formula = charges ~ . , data = insurance_data)
model

# formula = dependent ~ independent, independent 
# . means everything
attach(insurance_data)
model <- lm(formula = charges ~ 
              age +
              sex +
              bmi +
              children +
              smoker +
              region,
              data = insurance_data)
model
summary(model)


