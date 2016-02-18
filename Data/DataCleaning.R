setwd("C:/Users/Phili/Downloads/Udacity - Data Visualization Project")
library(zoo)
library(plyr)

############ Initial Plot Data ###############

#Load Oil Prices
Monthly_Oil_Price <- read.csv("CHRIS-CME_CL1.csv")

#Fix Oil Price Date
Monthly_Oil_Price$Date <- as.Date(Monthly_Oil_Price$Date)

#generate data for initial plotting
Plot_Oil <- data.frame(Date = Monthly_Oil_Price$Date, Price = Monthly_Oil_Price$Settle)
#export csv for initial plot
write.csv(Plot_Oil,"Initial_Plot_Oil.csv",row.names = FALSE)


#Load Consumer Prices Index (CPI)
Bigmac_Price <- read.csv("BigMacPrice.csv")


#Load Gold Prices
Monthly_Gold_Price <- read.csv("CHRIS-CME_GC1.csv")
#Fix Gold Prices Date
Monthly_Gold_Price$Date <- as.Date(Monthly_Gold_Price$Date)

Plot_Gold <- data.frame(Date = Monthly_Gold_Price$Date, Price = Monthly_Gold_Price$Settle)
#export csv for initial plot
write.csv(Plot_Gold,"Initial_Plot_Gold.csv",row.names = FALSE)

############## Processing The Data for Final Plot ###########

#Convert The Year of Bigmac Data to Integer (for subsetting)
Bigmac_Price$Year <- as.integer(Bigmac_Price$Year)

#Convert The Year of Oil Data to Integer (for subsetting)
year_oil <- as.integer(format(as.yearmon(Plot_Oil$Date, "%Y"), "%Y"))
#Combine the Year Column Into Oil Plot DF
Plot_Oil <- cbind(Plot_Oil, year_oil)
names(Plot_Oil)[3] <- "Year"
names(Plot_Oil)[2] <- "OilPrice"

#Subset for the year that we have the bigmac price data
Subsetted_Plot_Oil <- subset(Plot_Oil, Plot_Oil$Year >= min(Bigmac_Price$Year))
#Join Method
Bigmac_perBBL <- join(Subsetted_Plot_Oil, Bigmac_Price, by="Year")
Bigmac_perBBL$Bigmac_BBL <- Bigmac_perBBL$OilPrice/Bigmac_perBBL$BigMacPrice 
Bigmac_Oil <- data.frame(Date = Bigmac_perBBL$Date, BigmacPerBBL = Bigmac_perBBL$Bigmac_BBL)

#Subset where we have the gold data
Plot_Gold_Oil_Data <- subset(Plot_Gold, Plot_Gold$Date >= min(Plot_Oil$Date) & Plot_Gold$Date <= max(Plot_Oil$Date))
names(Plot_Gold_Oil_Data)[2] <- "GoldPrice"
Plot_Gold_Oil_Data <- cbind(Plot_Gold_Oil_Data, Plot_Oil$OilPrice)
names(Plot_Gold_Oil_Data)[3] <- "OilPrice"

Plot_Gold_Oil_Data$OzGold_PerBBL <- Plot_Gold_Oil_Data$GoldPrice/Plot_Gold_Oil_Data$OilPrice
Gold_Oil <- data.frame(Date=Plot_Gold_Oil_Data$Date, BBLperOzGold = Plot_Gold_Oil_Data$OzGold_PerBBL)

write.csv(Bigmac_Oil, "Bigmac_Oil_Data.csv", row.names=FALSE)

write.csv(Gold_Oil, "Gold_Oil_Data.csv", row.names=FALSE)

############################ Plot Sketching ###################################

#Plot Sketching for BigMac
plot(Bigmac_Oil$Date, Bigmac_Oil$BigmacPerBBL)
lines(Bigmac_Oil$Date, Bigmac_Oil$BigmacPerBBL)

#Plot Sketching for Gold
Plot(Gold_Oil$Date, Gold_Oil$BBLperOzGold)
lines(Gold_Oil$Date, Gold_Oil$BBLperOzGold)

