## Data Visualization: How Cheap is the Oil Price
by: Philip Thomas -- P6-Make Effective Data Visualization Project

### Summary
On this project, I choose to work with my own dataset. I am fascinated by the recent movements in oil prices, and if you read from the media, the experts opinion are divided of whether the oil price is cheap or not. To do this project, I grab the data from [Quandl.com](https://www.quandl.com/) to get the historical oil prices and gold prices in monthly basis, and I also use my own collection of Big Mac Price Index, taken from The Economists magazine from 1986 to (January) 2016. 

### Design

#### Final Design Objective
My final goal is to visualize two graphs: 
 
- how much barrel of oil that we could buy with an ounce of gold. 
- how much Big Mac that we could buy with a barrel of oil. 

#### Data Processing (in R)
After I got the Monthly West Texas Intermediate (WTI) Oil and Gold data from [Quandl.com](https://www.quandl.com/), I then clean the data a little bit. Here's What I done: 

- The data for Oil Price and Gold Price originally have different dates, where the gold has longer history. I subset the gold price so that it only covers where there is oil price.
- The economists originally issues the bigmac data as a yearly data. However some of the years have two BigMac price, in January and in June. I average these two out to get the yearly BigMac Data. As I use WTI as my base for oil price, I use BigMac prices in the USA as my base, 
- From there, I assume that the Oil Price is fluctuating over the year, and the bigmac price is constant for that year. Similar to how we calculate the [P/E ratio](http://www.investopedia.com/terms/p/price-earningsratio.asp) in stocks. 

After I got the dataframe right, I then calculate the desired variable and export the csv from R. You can follow my R code in processing the data [here]()

#### Plot Sketching
I made a rough plot using base graphic in R. The objective is to communicate the Bigmac per bbl of oil as shown in chart below.
![BigMac per BBL of Oil](https://raw.githubusercontent.com/PhilipThomas99/Data-Visualization-Udacity/master/images/BigMacPerBBL.png)


However, I also would like to compare the price of gold to the price of oil. We know that gold is considered as standard currency. so I want to see that historically, how many bbl per oz of gold we can buy. It is shown in chart below.
![BBL of Oil per Oz of Gold](https://raw.githubusercontent.com/PhilipThomas99/Data-Visualization-Udacity/master/images/BBLPerGold.png)

#### Initial Version of Visualization (dimple.js)

The Initial Version of the charts is as follow. 

![Oil Price](https://raw.githubusercontent.com/PhilipThomas99/Data-Visualization-Udacity/master/images/OilPrice_Initial.PNG)
![BigMacs per BBL of Oil](https://raw.githubusercontent.com/PhilipThomas99/Data-Visualization-Udacity/master/images/BigMac_Oil_Initial.PNG)
![BBLs per Oz of Gold](https://raw.githubusercontent.com/PhilipThomas99/Data-Visualization-Udacity/master/images/Gold_Oil_Initial.PNG)


### Feedback

I interviewed 3 of my lab mates in person, and asked for their feedback on the my charts. I explained the background information and give them some ideas what I want to convey from the chart.  Summary of their comments are listed below:

#### Interview #1

> I noticed that there is a lot of volatility for the oil price. 2008 is the peak price and it seems that now we are returning to pre 2005 level.
> 
> Wow, I didn't realize the chart is interactive which makes it easier to compare historical data. Additional title for each chart, to determine which one is which would be nice though.
> 
> I think the main takeaway is that given the inflation, oil price is currently cheap. I don't know whether it's good or bad for the economy

#### Interview #2

> I really like the charts! it was interactive and informative. However, a different color for each chart would be nice. When I think about BigMac, I think the right color would be yellow, as you want to communicate number of BigMacs. Barrels of Oil that you got from Gold chart would be green then, because Oil is Green.
> 
> I liked that there were data points on the top of the area chart. I could see how this would be a little bit non-informative if it was only area chart.
> 
> I think the charts are really good. I got the point that you are trying to communicate. Well done! and please teach me how to use dimple js!

#### Interview #3

> The chart is nice, but it's a little bit to follow which one is which. Yes, I agree there should be additional title for each chart.
> 
> The x and y axis needs to be more consistent. Rather than saying Price, I'd say Oil Price.
> 
> The charts are informative and clean, It's interesting how cheap the oil is today when we see the charts.

#### Final Version of Visualization (dimple.js)

### Resources

Here are the following resources I use in making this project: 

- [dimple.js documentation](http://dimplejs.org/)
- [Udacity Data Visualization Lecture](https://www.udacity.com/course/viewer#!/c-ud507-nd)
- [Question in stackoverflow about chart title](http://stackoverflow.com/questions/25416063/title-for-charts-and-axes-in-dimple-js-charts)
- [Big Mac Index](http://www.economist.com/content/big-mac-index)
