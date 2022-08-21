
# get data ----------------------------------------------------------------
fileLink=url("https://github.com/profemagallanes-unmsm/FGV_Python_prepublish/raw/main/DataFiles/mergedData.RDS")
mergedData=readRDS(fileLink)


# categorical -table -------------------------------------------------------

library(summarytools)

freq(mergedData[, 9], 
     plain.ascii = FALSE,
     report.nas=FALSE)

# categorical -plot -------------------------------------------------------

tablePFI=as.data.frame(table(mergedData$PressFreedomIndex_or))
names(tablePFI)=c("var","count")

##
library(ggplot2)
base=ggplot(data=tablePFI,aes(x=var,y=count))
bar1=base + geom_bar(stat = 'identity')
bar1=bar1+labs(x="Press Freedom")

bar1

# numerical -table -------------------------------------------------------
library(kableExtra)
library(vtable)
st(mergedData[,c("DemocracyIndex","mili_pctGDP")])

# numerical -plot -------------------------------------------------------

base=ggplot(data=mergedData)
box = base + geom_boxplot(aes(y=mili_pctGDP)) 
box = box + labs(x="", y = "% of country GDP")
box=box + theme(axis.text.x = element_blank(),
                axis.ticks.x = element_blank())

box

# numerical -regression -------------------------------------------------------

h1=formula(mili_pctGDP~DemocracyIndex)
regre1=lm(h1,data=mergedData)

h2=formula(mili_pctGDP~DemocracyIndex + IndexofEconomicFreedom)
regre2=lm(h2,data=mergedData)

summary(regre1)

summary(regre1)