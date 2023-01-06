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

#UVA color palette
col<- c("#232d4b","#2c4f6b","#0e879c","#60999a","#d1e0bf","#d9e12b","#e6ce3a","#e6a01d","#e57200", "#fdfdfd")


####################################################################################################
# topic model on all documents --------
n_chapters_dtm <- tokenized_words %>% dplyr::filter(!(str_detect(document, ".rds"))) %>%
  cast_dtm(document, word, n)

n_chapters_lda <- LDA(n_chapters_dtm, k = 18, control = list(seed = 1234))

n_chapter_topics <- tidy(n_chapters_lda, matrix = "beta")

n_top_terms <- n_chapter_topics %>%
  group_by(topic) %>%
  slice_max(beta, n = 10) %>%
  ungroup() %>%
  arrange(topic, -beta)

n_top_terms_rename <- n_top_terms %>% rename(Beta = beta, Term = term) %>%
  mutate(Topic = ifelse(topic == 1, "Team Buliding",
                                   ifelse(topic == 2, "Family Support",
                                    ifelse(topic == 3, "Adaptability",
                                      ifelse(topic == 4, "Team Orientation",
                                        ifelse(topic == 5, "Leader Development",
                                          ifelse(topic == 6, "Qualities of a Leader (1)",
                                            ifelse(topic == 7, "Responsibility",
                                              ifelse(topic == 8, "Team Success (1)",
                                                ifelse(topic == 9, "Team Success (2)",
                                                  ifelse(topic == 10, "Influence",
                                                    ifelse(topic == 11, "Qualities of a Leader (2)",
                                                      ifelse(topic == 12, "Communication",
                                                        ifelse(topic == 13, "Integrity",
                                                          ifelse(topic == 14, "Intellectual Efficiency",
                                                           ifelse(topic == 15, "Commitment to Serve",
                                                            ifelse(topic == 16, "Shared Vision (1)",
                                                              ifelse(topic == 17, "Negative Qualities","Shared Vision (2)")
                                                                )))))))))))))))))


n_top_terms_rename %>%
  mutate(term = reorder_within(Term, Beta, Topic)) %>%
  ggplot(aes(Beta, Term, fill = factor(Topic))) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~ Topic, scales = "free") +
  scale_y_reordered() +
  theme(axis.text.x = element_text(angle = 25, size = 10),
        axis.text.y = element_text(size = 12),
        strip.text = element_text(size = 10)) +
  scale_fill_manual(values = c("#232d4b","#2c4f6b","#0e879c","#60999a","#d1e0bf","#d9e12b",
                               "#e6ce3a","#e6a01d","#e57200", "orange", "#232d4b","#2c4f6b",
                               "#0e879c","#60999a", "#d1e0bf","#d9e12b","#e6ce3a","#e6a01d"))

ggsave("/home/seh6fy/git/dspg22ari2/data/Code/new_topic_model.png",
       width = 15,
       height = 12)

####################################################################################################
# tf_idf on individual documents--------

n_desc_tf_idf <- tokenized_words %>% dplyr::filter(!(str_detect(document, ".rds"))) %>% bind_tf_idf(word, document,n)

n_desc_tf_idf %>%
  arrange(-tf_idf)

n_tf_idf<- n_desc_tf_idf%>%
  group_by(document) %>%
  slice_max(tf_idf, n = 13) %>%
  ungroup() %>%
  ggplot(aes(tf_idf, fct_reorder(word, tf_idf), fill = document)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~document, ncol = 2, scales = "free") +
  theme(axis.text.y = element_text(angle=15, size = 12), strip.text = element_text(size=13)) +
  labs(x = "TF-IDF", y = NULL) +
  scale_fill_manual(values = c("#232d4b","#2c4f6b","#0e879c","#60999a","#d1e0bf","#d9e12b","#e6ce3a","#e6a01d","#e57200", "orange"))

ggsave("/home/seh6fy/git/dspg22ari2/data/Code/dates_tf_idf.png",
       width = 15,
       height = 12)
##########################
#sentiment analysis ----
tfidf_words <-pull(n_desc_tf_idf, word)
sentimentWords <- get_nrc_sentiment(tfidf_words)
sentimentFrame <- cbind(n_desc_tf_idf, strtoi(sentimentWords$negative), strtoi(sentimentWords$positive))
sentimentFrame[sentimentFrame == 0]<- NA
names(sentimentFrame)[names(sentimentFrame)=="strtoi(sentimentWords$negative)"]<- "negative"
names(sentimentFrame)[names(sentimentFrame)=="strtoi(sentimentWords$positive)"]<- "positive"
sentimentNames = list('2014', '2014', '2015', '2015', '2007', '2007', '2015', '2015', '2019', '2019', '2021', '2021', '2019', '2019', '2019', '2019', '2016', '2016', '2015', '2015', '2019', '2019', '2019', '2019', '2015', '2015', '1996', '1996' )
sentimentSplit <-split(sentimentFrame, f = sentimentFrame$document)
negativeVec<-NULL
positiveVec <- NULL
for (file in sentimentSplit){
  document <-file%>%count(document)
  positive<- file%>%count(positive)
  negative <- file%>%count(negative)
  negativeVec<- negativeVec%>% append(negative)
  positiveVec<- positiveVec %>% append(positive)
}
finalSentimentFrame <- data.frame(rbind(c(sentimentNames),c(positiveVec),c(negativeVec)))
finalSentimentFrame <- subset(finalSentimentFrame, select = -c(positive,positive.1 , positive.2, positive.3, positive.4,positive.5,positive.6,positive.7,positive.8,positive.9,positive.10,positive.11,positive.12,positive.13))
finalSentimentFrame <- t(finalSentimentFrame)
# names(finalSentimentFrame)[names(finalSentimentFrame) =="1"]<-"year"
# names(finalSentimentFrame)[names(finalSentimentFrame) =="2"]<-"positive"
# names(finalSentimentFrame)[names(finalSentimentFrame) =="3"]<-"negative"
# sortedSentimentFrame <- finalSentimentFrame[order(finalSentimentFrame$c2)]
colorif <- sentimentFrame$`sentimentWords$negative`
sentimentPlot<- sentimentFrame%>%
  group_by(document) %>%
  slice_max(tf_idf, n = 13) %>%
  ungroup() %>%
  ggplot(aes(tf_idf, fct_reorder(word, tf_idf), fill = document)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~document, ncol = 2, scales = "free") +
  theme(axis.text.y = element_text(angle=15, size = 12), strip.text = element_text(size=13)) +
  labs(x = "TF-IDF", y = NULL)


####################################################################################################
#cooccuarance ----------

new_cooccurence %>%
  filter(n >=300) %>%
  graph_from_data_frame() %>%
  ggraph(layout = "fr") +
  geom_edge_link(aes(edge_alpha = n, edge_width = n), edge_colour = "cyan4") +
  geom_node_point(size = 2) +
  geom_node_text(aes(label = name), repel = TRUE,
                 point.padding = unit(0.2, "lines")) +
  theme_void()

ggsave("/home/jme6bk/github/dspg22ari2/src/web/www/co-occurence.png",
       width = 15,
       height = 11)



