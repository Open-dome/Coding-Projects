##LOAD EIA DATASET / READ INTO DATAFRAME
library(readxl)
updated_EIA_dataset <- read_excel("C:/Users/curti/Downloads/updated EIA dataset.xlsx", 
                                  col_types = c("text", "numeric", "numeric", 
                                                "numeric", "numeric", "numeric"))
Sys.time()
Sys.Date()
View(updated_EIA_dataset)
df <- data.frame(updated_EIA_dataset)
df
##Remove all the rows with missing values (NA) from the testing data set.
Sys.time()
Sys.Date()
EIA_df <- df[complete.cases(df), ] 
EIA_df
##Tests
Sys.time()
Sys.Date()
summary(EIA_df)
## Plot Residential vs Commercial Electric Sales.
Sys.time()
Sys.Date()
plot(EIA_df$...2 ~ EIA_df$...3, data=EIA_df, main= "Residential vs Commercial Sales", 
     col.main="Red", col.lab="Red")
##Correlation test of variables Residential vs Commercial.
Sys.time()
Sys.Date()
cor.test(EIA_df$...2, EIA_df$...3)
##fit a linear regression model using all the explanatory variables and Residential variable as the response variable.
Sys.time()
Sys.Date()
EIA.regression <- lm(EIA_df$...2~., data=EIA_df)
summary(EIA.regression)
##using the first 3 rows Predict Residential sales (consuption) of electricity 
Sys.time()
Sys.Date()
fit1 <- lm(EIA_df$...2 ~ EIA_df$...3, data=EIA_df)
summary (fit1)
##Using coefficients and intercepts, predict residential electric consumption (First 4 rows). 
Sys.time()
Sys.Date()
a <- -58103.091 + (1.656 * 109812)
a
b <- -58103.091 + (1.656 * 103015)
b
c <- -58103.091 + (1.656 * 104110)
c
d <- -58103.091 + (1.656 * 91406)
d
print ('END!!')

