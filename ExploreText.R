# read the file -----------------------------------------------------------

location="https://github.com/profemagallanes-unmsm/FGV_Python_prepublish/raw/main/DataFiles/rebelData.csv"
wordData=read.csv(location)


# prepare data frame ------------------------------------------------------

library(tidyr)

wordDataNames=separate_rows(wordData,StateName)
stateCounts=as.data.frame(table(wordDataNames$StateName))
names(stateCounts)=c("state","aCount")


# plot word cloud ---------------------------------------------------------

library(ggwordcloud)

set.seed(123)
base = ggplot(stateCounts, aes(label = state,
                               size= aCount,
                               color = aCount))
cloudRebel= base + geom_text_wordcloud() + theme_minimal()

cloudRebel= cloudRebel+scale_color_gradient(low = "orange",
                                            high = "red") 

cloudRebel
