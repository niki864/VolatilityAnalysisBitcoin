library("TTR")
#Load our 6hr data values to mainDataset
mainDataset = read.csv(file = "6HrCharts.csv")
#Read the top 6 entries
head(mainDataset)
#Display number of entries in dataset
nrow(mainDataset)
#Display Colnames in Dataset
colnames(mainDataset)
#Load Simple Moving Average for 