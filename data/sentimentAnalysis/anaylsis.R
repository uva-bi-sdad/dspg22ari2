library(topicmodels)
library(tidytext)
library(ggplot2)
library(dplyr)
library(tidyr)
library(widyr)
library(igraph)
library(ggraph)
library(forcats)
library(syuzhet)
tfidf_words <-pull(sentiment_words, word)
sentimentWords <- get_nrc_sentiment(tfidf_words)
saveRDS(sentimentWords, "sentimentWords.rds")
fullCombine <-cbind(sentiment_words$document, sentimentWords)
# sentimentFrame <- cbind(sentiment_words$document, strtoi(sentimentWords$negative), strtoi(sentimentWords$positive))
names(fullCombine)[names(fullCombine)=="strtoi(sentiment_words$document)"]<- "document"
# names(sentimentFrame)[names(sentimentFrame)=="strtoi(sentimentWords$positive)"]<- "positive"
sentimentList = list('1987', '1987', '2005', '2005', '2007', '2007', '2010', '2010', '2014', '2014', '2019', '2019', '2021', '2021' )
sentimentSplit <-split(fullCombine, f = sentiment_words$document)
sentimentLabels = c('year','anger','anticiaption','disgust','fear','joy','sad','surprise','trust','negative','positive')
saveRDS(sentimentSplit, "sentimentSplit.rds")
angerVec <-NULL
anticipationVec <-NULL
disgustVec <- NULL
negativeVec<-NULL
positiveVec <- NULL
fearVec <- NULL
joyVec <- NULL
sadVec <- NULL
surpriseVec <- NULL
trustVec <- NULL
yearVec <- NULL
for (file in sentimentSplit){
  year<-file$`sentiment_words$document`
  anger<-sum(file$anger == 1)
  anticipation <- sum(file$anticipation == 1)
  disgust <- sum(file$disgust == 1)
  fear <- sum(file$fear == 1)
  joy <- sum(file$joy == 1)
  sad <- sum(file$sadness == 1)
  surprise <- sum(file$surprise == 1)
  trust <- sum(file$trust == 1)
  negative <- sum(file$negative == 1)
  positive <- sum(file$positive == 1)

  angerVec<-angerVec %>% append(anger)
  anticipationVec <- anticipationVec %>% append(anticipation)
  disgustVec <- disgustVec %>% append(disgust)
  fearVec <- fearVec %>% append(fear)
  joyVec <- joyVec %>% append(joy)
  sadVec <- sadVec %>% append(sad)
  supriseVec <- surpriseVec %>% append(surprise)
  trustVec <- trustVec %>% append(trust)
  negativeVec <- negativeVec %>% append(negative)
  positiveVec <- positiveVec %>% append(positive)
  yearVec <- yearVec %>% append(year)
}
finalSentimentFrame <- data.frame(rbind(c(yearVec),c(sentimentList),c(angerVec), c(anticipationVec),c(disgustVec), c(fearVec),c(joyVec), c(sadVec),c(surpriseVec),c(trustVec),c(negativeVec), c(positiveVec)))
finalSentimentFrame<-cbind(sentimentLabels,finalSentimentFrame)
saveRDS(finalSentimentFrame, "finalSentimentFrame.rds")
# finalSentimentFrame <- subset(finalSentimentFrame, select = -c(positive,positive.1 , positive.2, positive.3, positive.4,positive.5,positive.6))
finalSentimentFrame <- t(finalSentimentFrame)
saveRDS(finalSentimentFrame, "finalSentimentFrame.rds")
