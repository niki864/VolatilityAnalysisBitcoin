library("TTR")
#Load our 6hr data values to mainDataset
mainDataset = read.csv(file = "6HrDayCount.csv")
#Read the top 6 entries
head(mainDataset)
#Display number of entries in dataset
nrow(mainDataset)
#Display Colnames in Dataset
colnames(mainDataset)
#Base Statistics
#
#Mean
mean(mainDataset$Close)
#Median
median(mainDataset$Close)
#Variance
var(mainDataset$Close)
#Standard Deviation
sd(mainDataset$Close)
#Standard Scores
score <- scale(mainDataset$Close)

#Moving Averages
#
#Load Simple Moving Average for 1 week --> 4 values a day and 7 days a week = 28 values a week
sma28 <- SMA(mainDataset[c('Close')],n=28)
#Display the table with SMA-28 values
head(sma28,n=50)
#Load Exponential Moving Averages for 1 week
ema28 <- EMA(mainDataset[c('Close')],n=28)
#
#
#BollingerBand Analysis
#
#BollingerBand Initialisation
bb28 = BBands(mainDataset[c('Close')], n=28, sd = 2.0)
#New data frame to hold all our charts
dataWithBB = data.frame(mainDataset,bb28)
head(dataWithBB, n=30)
#Plot graph for closing prices to act as basis. Divide by 4 hack to display days 
plot(mainDataset$Timestamp,mainDataset$Close,xlab = "Days Elapsed", ylab = "Price", type = "l")
title("Base Graph With Price History", sub = NULL)
#Graph on log scale for Price
plot(mainDataset$Timestamp/4,mainDataset$Close,xlab = "Days Elapsed", ylab = "Price (Log)", type = "l", log ="y")
title("Base Graph With Price History (Log)", sub = NULL)
#Plot data into graph1 for first 6 months
plot(mainDataset$Timestamp,mainDataset$Close,xlab = "6 Hour Blocks Elapsed", ylab = "Price", type = "l")
title("Bollinger Band Graph 1",sub=NULL)
lines(dataWithBB$Close, col='blue')
lines(dataWithBB$up, col='green')
lines(dataWithBB$dn, col='red')
lines(dataWithBB$mavg, col='purple')
#
#
#Volatiltiy Analysis
#
#
#Volatiltiy As A Factor of Range from upper and lower Bollinger Bands
plot(dataWithBB$Timestamp/4,dataWithBB$pctB,xlab = "Days Elapsed", ylab = "Percentage Change", type="l")
#Outlier Analysis by smoothing using a log function
plot(dataWithBB$Timestamp/4,dataWithBB$pctB,xlab = "Days Elapsed", ylab = "Log of Percent Change", type="l", log = "y")
#Clearly we are missing out on data lesser than 0, hence, we construct a volatility index from absolute values of percent change
Vindex = data.frame(dataWithBB$pctB)
#Change name of column from pctB to Percent Change
names(Vindex) <- c("PercentChange")
Vindex$PercentChange <- abs((Vindex$PercentChange*100-100))
allData = data.frame(dataWithBB,Vindex)
#Plot graph of Volatility Index
plot(dataWithBB$Timestamp/4, Vindex$PercentChange, xlab = "Days Elapsed", ylab = "Absolute value (log Index) ", type="l", log = "y")
#Write back to original table
write.table(allData,file="6HrDayCount.csv",na="",sep =",",row.names=FALSE)
Vindex2 = Vindex$PercentChange[complete.cases(Vindex$PercentChange)]
plot(allData$Timestamp[complete.cases(allData$PercentChange)]/4, 1/(0.75*Vindex2), xlab = "Number of Days", ylab = "Volatility Magnitude", type="l", col="blue")

