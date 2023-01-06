library(Dict); library(topicmodels);library(tidytext);library(ggplot2);library(dplyr);library(tidyr);library(widyr);library(igraph);library(ggraph);library(forcats);library(syuzhet); library(cowplot)
tfidf_words <-pull(sentiment_words, word)
sentimentWords <- get_nrc_sentiment(tfidf_words)
#saveRDS(sentimentWords, "sentimentWords.rds")
fullCombine <-cbind(sentiment_words$document, sentiment_words$word, sentimentWords)
names(fullCombine)[names(fullCombine)=="strtoi(sentiment_words$document)"]<- "document"

  sentimentList = list( '1998.10','2005.10','2005.12','2007.11','2007.12','2010.02','2014.12','2017.06','2019.04')
  maleCodedWords = c('agressive','analyze','analytical','challenge', 'champion', 'competent','compete','competitive','courage','courageous',
                     'decision','decisive','dominate','driven','fearless','indivdual','leader','leadership','objective','outspoken','principle','strong','strength')
  femaleCodedWords = c('collaborate', 'collaborative','compassion', 'compassionate','connect','connection','dependable',
                       'enthusiastic','feel','feeling','honest','interpersonal','loyal','loyalty','responsible',
                       'sensitive', 'share','support', 'supportive','together','understand','understanding')
  femaleProunoun = c('she', 'her', 'hers', 'herself', 'ms', 'miss', 'mrs')
  malePronoun = c('him', 'he', 'his', 'male', 'himself','mr','sir')
  neutralProunoun = c('they', 'them', 'their','themselves','you','your','our','we','ours','everyone','people')
  femaleNouns =c('female','woman', 'women',' girl','lady','wife','mom','mother','daugther','businesswoman','chairwoman','mistress')
  maleNouns = c('man','men','boy','serviceman','guardsman','husband','manpower','mankind','gentleman','congressman','chairman','policman','dad','father','brother','son','businessman','foreman','layman','bachelor','master')
  neutralNouns = c('parent','sibling','child','kid','server','humanity','chairperson','legislator')
  singleNouns = c('i', 'me', 'my', 'mine', 'you', 'myself', 'yours', 'yourself', 'your')
  pluralNouns = c('we', 'us', 'our', 'ours', 'ourselves')
  testFrame <- NULL; angerVec <-NULL; anticipationVec <-NULL; disgustVec <- NULL; negativeVec<-NULL; positiveVec <- NULL; fearVec <- NULL; joyVec <- NULL; sadVec <- NULL; surpriseVec <- NULL; trustVec <- NULL; yearVec <- NULL; testFrame <- NULL; femalePronoutVec <- NULL; malePronounVec <- NULL; neutralPronounVec <- NULL; femaleCodeVerb <- NULL; maleCodeVerb <- NULL; femaleNounVec <- NULL; maleNounVec <- NULL; neutralNounVec <- NULL; singleNounVec <- NULL; pluralNounVec <- NULL

sentimentSplit <-split(fullCombine, f = sentiment_words$document)
sentimentLabels = c('word','year','anger','anticiaption','disgust','fear','joy','sad','surprise','trust','negative','positive', 'female', 'male','neutral', 'single', 'plural')
#saveRDS(sentimentSplit, "sentimentSplit.rds")
indivWords<-NULL
for (file in sentimentSplit){
  malecount<- 0; femalecount <-0; neutralcount <-0; femaleCodedCount <- 0; maleCodedCount <- 0; femaleNCOunt <- 0; maleNCount <-0; neutralNCount <- 0; singleNCount <- 0; pluralNCount <- 0;
  count <- nrow(file)
  year<-file$`sentiment_words$document`
  anger<-sum(file$anger == 1) / count
  anger <- round(anger, 5)
  anticipation <- (sum(file$anticipation == 1) / count)
  anticipation <- round(anticipation, 5)
  disgust <-  (sum(file$disgust == 1)  / count)
  disgust <- round (disgust , 5)
  fear <- ( sum(file$fear == 1)  / count)
  fear <- round(fear, 5)
  joy <- ( sum(file$joy == 1)  / count)
  joy <- round(joy, 5)
  sad <- (sum(file$sadness == 1)  / count)
  sad <- round (sad, 5)
  surprise <- (sum(file$surprise == 1)  / count)
  surprise <- round(surprise, 5)
  trust <- (sum(file$trust == 1)  / count)
  trust <- round (trust , 5)
  negative <- (sum(file$negative == 1)  / count)
  negative <- round (negative, 5)
  positive <- (sum(file$positive == 1)  / count)
  positive <- round (positive, 5)
  for (row in 1:nrow(file)){
    curWord <- file[row, "sentiment_words$word"]

    # print(file$`sentiment_words$word`)
    if (curWord %in% femaleNouns){
      femaleNCOunt <- femaleNCOunt +1
    }
    if (curWord %in% maleNouns){
      maleNCount <- maleNCount + 1
    }
    if (curWord %in% neutralNouns){
      neutralNCount <- neutralNCount + 1
    }
    if(curWord %in% malePronoun){
      malecount <- malecount + 1
    }
    if(curWord %in% femaleProunoun){
      femalecount <- femalecount + 1
    }
    if (curWord %in% neutralProunoun){
      neutralcount<-neutralcount + 1
    }
    if (curWord %in% maleCodedWords){
      maleCodedCount <- maleCodedCount + 1

    }
    if (curWord %in% femaleCodedWords){
      femaleCodedCount <- femaleCodedCount + 1
    }
    if (curWord %in% singleNouns){
      singleNCount <- singleNCount + 1
    }
    if (curWord %in% pluralNouns){
      pluralNCount <- pluralNCount + 1
    }
  }
  femaleNounVec <- femaleNounVec %>% append((femaleNCOunt / count) * 100)
  maleNounVec <- maleNounVec %>% append ((maleNCount / count) * 100)
  neutralNounVec <- neutralNounVec %>% append((neutralNCount / count) * 100)
  femaleCodeVerb <- femaleCodeVerb %>% append ((femaleCodedCount / count) * 100)
  maleCodeVerb <- maleCodeVerb %>% append ((maleCodedCount / count) * 100)
  malePronounVec <- malePronounVec %>% append ((malecount / count) * 100)
  femalePronoutVec <- femalePronoutVec %>% append ((femalecount / count) * 100)
  neutralPronounVec <- neutralPronounVec%>% append ((neutralcount / count) * 100)
  singleNounVec <- singleNounVec%>% append ((singleNCount / count) * 100)
  pluralNounVec <- pluralNounVec%>% append ((pluralNCount / count) * 100)
  angerVec<-angerVec %>% append(anger * 100)
  anticipationVec <- anticipationVec %>% append(anticipation * 100)
  disgustVec <- disgustVec %>% append(disgust * 100)
  fearVec <- fearVec %>% append(fear * 100)
  joyVec <- joyVec %>% append(joy * 100)
  sadVec <- sadVec %>% append(sad * 100)
  supriseVec <- surpriseVec %>% append(surprise * 100)
  trustVec <- trustVec %>% append(trust * 100)
  negativeVec <- negativeVec %>% append(negative * 100)
  positiveVec <- positiveVec %>% append(positive * 100)
  yearVec <- yearVec %>% append(year)
}


testFrame <- data.frame(cbind(unlist(sentimentList), angerVec[-c(10:12)], anticipationVec[-c(10:12)], disgustVec[-c(10:12)], fearVec[-c(10:12)], joyVec[-c(10:12)], sadVec[-c(10:12)], surpriseVec[-c(10:12)], trustVec[-c(10:12)], negativeVec[-c(10:12)], positiveVec[-c(10:12)], femalePronoutVec[-c(10:12)], malePronounVec[-c(10:12)], neutralPronounVec[-c(10:12)]), singleNounVec[-c(10:12)], pluralNounVec[-c(10:12)])
#testFrame <- data.frame(cbind(angerVec, anticipationVec, disgustVec, fearVec, joyVec, sadVec, surpriseVec, trustVec, negativeVec, positiveVec, femalePronoutVec, malePronounVec, neutralPronounVec,femaleCodeVerb,maleCodeVerb, femaleNounVec, maleNounVec, neutralNounVec))
rowNames <- testFrame[,-1]
rownames(testFrame)<- testFrame[,1]
testFrame$sentimentList<- NULL
#saveRDS(testFrame, "testFrame.rds")
newFrame <- testFrame %>%rownames_to_column() %>%
  gather(colname, value, -rowname)
ggplot(newFrame, aes(x = rowname, y = colname, fill = value)) +
  geom_tile()
newFrame2 <- tibble:: rownames_to_column(testFrame, "years")
#newFrame2 <- newFrame2[-c(1,8),]
newFrame2 <-  mutate_all(newFrame2, function(x) as.numeric(as.character(x)))
newFrame2$years <- as.numeric(newFrame2$years)
newFrame2$angerVec<- as.numeric(newFrame2$angerVec)

angplot<- ggplot(newFrame2,aes(x=years, y =angerVec)) + geom_point()
antplot <-ggplot(newFrame2, aes(x= years, y = anticipationVec)) + geom_point()
displot <- ggplot(newFrame2, aes(x=years, y = disgustVec)) + geom_point()
fearplot <- ggplot(newFrame2, aes(x=years, y = fearVec)) + geom_point()
joyplot <- ggplot(newFrame2, aes(x=years, y = joyVec)) + geom_point()
sadplot <- ggplot(newFrame2, aes(x=years, y = sadVec)) + geom_point()
trustplot <- ggplot(newFrame2, aes(x= years, y = trustVec)) + geom_point()
sentimentPlot <-plot_grid(angplot, antplot, displot, fearplot, joyplot, sadplot, trustplot)
sentimentPlot
saveRDS(sentimetPlot, "sentimentPlot.RDS")

negativeplot <- ggplot(newFrame2, aes(x = years, y = negativeVec)) + geom_point()
positiveplot <- ggplot(newFrame2, aes(x = years, y = postitiveVec)) + geom_point()
posNegPlot <- plot_grid(negativeplot, positiveplot)
posNegPlot

femalepronounplot <- ggplot(newFrame2, aes(x = years, y= femalePronoutVec)) + geom_point()
malepronounplot <- ggplot(newFrame2, aes(x = years, y = malePronounVec)) + geom_point()
neutralpronountplot <- ggplot(newFrame2, aes( x= years, y = neutralPronounVec)) + geom_point()
pronounPlot <- plot_grid(femalepronounplot, malepronounplot, neutralpronountplot)
pronounPlot

femalecodeplot <- ggplot(newFrame2, aes(x= years, y = femaleCodeVerb)) + geom_point()
malecodeplot <- ggplot(newFrame2, aes(x = years, y = maleCodeVerb)) + geom_point()
codedPlot <- plot_grid(femalecodeplot, malecodeplot)
codedPlot

femaleNounPlot <- ggplot(newFrame2, aes (x =years, y = femaleNounVec)) + geom_point()
maleNounPlot <- ggplot (newFrame2, aes (x = years, y = maleNounVec)) + geom_point()
neutralNounPlot <- ggplot( newFrame, aes( x= years, y = neutralNounVec)) + geom_point()
nounPlot <- plot_grid(femaleNounPlot, maleNounPlot, neutralNounPlot)
nounPlot


# https://www.nato.int/nato_static_fl2014/assets/pictures/images_mfu/2021/5/pdf/210514-GIL-Manual_en.pdf
# https://writingcenter.unc.edu/tips-and-tools/gender-inclusive-language/
# https://grammar.yourdictionary.com/style-and-usage/30-everyday-gender-neutral-terms-to-use.html
# https://gender-decoder.katmatfield.com/about
