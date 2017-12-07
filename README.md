# Volatility Analysis of Bitcoins

An technical analysis of bitcoin price history over a period of one year done in the R language utilising the TTR package.

## Packages Required

TTR, downloadable from CRAN

### Prerequisites

R and R Studio

## Base Dataset Description

Dataset is an hourly time series data set with 8 Variables (Timestamp, Open, High, Low, Close, Volume (BTC), Volume (Currency), Weighted Price)
Data gathered is averaged across six hour time interval between sampling, i.e. 0000-0600 hrs, 0600-1200 hrs, 1200-1800 hrs to 1800-2400 hrs.

Base descriptive stats are provided.

Source: *bitcoincharts.com*

## Data Analysis Description

We first generate Bollinger Bands with a SMA of 28 samples ( 28/4 - Weekly Moving Average equivalent) and obtain pctB values. 
pctB is the percentage of Bitcoin price to the range between the up and lower band. 

Using pctB we can scale it to an index measure by taking the absolute value and converting it into percentage points on scale 100.

The final graph is generated on the basis of only Vindex. 


## Summary

Spikes in graph correlate to significant days in which volatility has exceeded moving average by a large margin. 
Will be coming up with more volatility measurements in the coming weeks. 

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* IE 6200 Course @Northeastern University : Prof. Dehghani 
