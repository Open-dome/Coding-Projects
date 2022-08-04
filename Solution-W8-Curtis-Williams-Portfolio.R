##BEGIN
##Read in the MIS470housingtesting(460x25).csv file into an R testing data frame.
Sys.time()
Sys.Date()
MIS470housingtesting_460x25_ <- read_csv("C:/Users/curti/Downloads/MIS470/MIS470housingtesting(460x25).csv")
testingdf <- data.frame(MIS470housingtesting_460x25_)
testingdf
##Calculate the summary statistics of minimum, maximum, mean, median, and standard deviation for the sales price variable of the testing data set.
Sys.Date()
Sys.time()
min(testingdf$SalePrice)
max(testingdf$SalePrice)
mean(testingdf$SalePrice)
median(testingdf$SalePrice)
sd(testingdf$SalePrice)
##Plot a histogram for the distribution of the sales price variable of the testing data set.
Sys.Date()
Sys.time()
hist(testingdf$SalePrice,  freq = TRUE, xaxt="n", labels = TRUE, main = "Histogram of (testing) Housing Sale Price", xlab = "Sale Price",)
h <- hist(testingdf$SalePrice, plot = FALSE)
dens <- h$density     
axis(1, at=pretty(testingdf$SalePrice), labels = format(pretty(testingdf$SalePrice), big.mark = "," , scientific = FALSE),
     las=1)
##Combine the two data sets (training and testing) into a single data set.
Sys.Date()
Sys.time()
MIS470HousingTraining_1000x25_ <- read_csv("C:/Users/curti/Downloads/MIS470/MIS470HousingTraining(1000x25).csv")
trainingdf <- data.frame(MIS470HousingTraining_1000x25_)
trainingdf
testandtraindf <- rbind(testingdf, trainingdf)
testandtraindf
summary(testandtraindf)
##Create a histogram of sale prices for the combined data set.
Sys.Date()
Sys.time()
hist(testandtraindf$SalePrice,  freq = TRUE, xaxt="n", labels = TRUE, main = "Histogram of (testing and training) Housing Sale Price", xlab = "Sale Price",)
tandt <- hist(testandtraindf$SalePrice, plot = FALSE)
dens <- tandt$density     
axis(1, at=pretty(testandtraindf$SalePrice), labels = format(pretty(testandtraindf$SalePrice), big.mark = "," , scientific = FALSE),
     las=1)
##Using only the training data set, fit a linear regression model using all the explanatory variables and SalePrice as the response variable.
Sys.Date()
Sys.time()
training.regression <- lm(SalePrice~., data=trainingdf)
summary(training.regression)
##Remove all the rows with missing values (NA) from the testing data set.
Sys.Date()
Sys.time()
testingdf <- testingdf[complete.cases(testingdf), ] 
print(testingdf)
View(testingdf)
##Using only the first 20 rows from testing data set, predict the sale price.
##Using the first 20 rolls of variable "OverallQual" because it was  - 3, 5, 8, 7, 5, 4, 7, 5, 6, 5, 6, 8, 7, 7, 4, 7, 5, 7, 5, 5
Sys.Date()
Sys.time()
cor(testingdf$SalePrice, testingdf$OverallQual)
fit1 <- lm(SalePrice ~ OverallQual, data=testingdf)
fit1
predict(fit1, data.frame(OverallQual <- c(3, 5, 8, 7, 5, 4, 7, 5, 6, 5, 6, 8, 7, 7, 4, 7, 5, 7, 5, 5)))
print('END!!')
