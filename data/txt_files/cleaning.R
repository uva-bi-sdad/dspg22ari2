#importing libraries
library(tm)
library(stringr)
library(tidytext)
library(tidyverse)
library(SnowballC)

#importing documents
doc01 <-paste(readLines("DedooseDoc_AR_623-23.docx_2022_7_7_1258.txt"), collapse = " ")
doc02 <-paste(readLines("DedooseDoc_army_leadership_and_the_profession.docx_2022_7_7_1257.txt"), collapse = " ")
doc03 <-paste(readLines("DedooseDoc_Building_cohesive_teams.docx_2022_7_7_1247.txt"), collapse = " ")
doc04 <-paste(readLines("DedooseDoc_FM_6-22_leader_development.docx_2022_7_7_1255.txt"), collapse = " ")
doc05 <-paste(readLines("DedooseDoc_leaders_guide_to_team_building.docx_2022_7_7_1257.txt"), collapse = " ")
doc06 <-paste(readLines("DedooseDoc_PAM 600-3_merged_docx.docx_2022_7_7_1258.txt"), collapse = " ")
doc07 <-paste(readLines("DedooseDoc_PAM 623-3_merged.docx_2022_7_7_1246.txt"), collapse = " ")
doc08 <-paste(readLines("DedooseDoc_soldiers_guide.docx_2022_7_7_1246.txt"), collapse = " ")
doc09 <-paste(readLines("DedooseDoc_the_importance_of_individual_members_to_team_success_2022_7_7_1258.txt"), collapse = " ")
doc10 <-paste(readLines("DedooseDoc_what_makes_teams_work_final.docx_2022_7_7_1247.txt"), collapse = " ")

##doc01
doc01 <- gsub(pattern="\\W" , replace = " ", doc01)%>% gsub(patter = "\\d", replacement = " ", doc01)
doc01<- removeWords(doc01, c(stopwords("english"),"will","can","on","table","da","other","only"))
doc01 <- gsub(pattern = "\\b[A-z]\\b{1-3}", replace= " ", doc01)
doc01 <- stripWhitespace(doc01)
doc011 <- tibble(document = c(1), text = doc01)
doc011 <- doc011 %>% unnest_tokens(word,text)
saveRDS(doc011, file="doc01.RDS")

##document02
doc02 <- gsub(pattern="\\W" , replace = " ", doc02) %>% gsub(patter = "\\d", replacement = " ", doc02)
doc02 <- removeWords(doc02, c(stopwords("english"),"will","can","on","table","da","other","only"))
doc02 <- gsub(pattern = "\\b[A-z]\\b{1-3}", replace= " ", doc02)
doc02 <- stripWhitespace(doc02)
doc021 <- tibble(document = c(1), text = doc02)
doc012<- doc021 %>% unnest_tokens(word,text)
saveRDS(doc021, file="doc02.RDS")

#document3
doc03 <- gsub(pattern="\\W" , replace = " ", doc03) %>% gsub(patter = "\\d", replacement = " ", doc03)
doc03 <- removeWords(doc03, c(stopwords("english"),"will","can","on","table","da","other","only"))
doc03 <- gsub(pattern = "\\b[A-z]\\b{1-3}", replace= " ", doc03)
doc03 <- stripWhitespace(doc03)
doc031 <- tibble(document = c(1), text = doc03)
doc031 <- doc031 %>% unnest_tokens(word,text)
saveRDS(doc031, file="doc03.RDS")

#document4
doc04 <- gsub(pattern="\\W" , replace = " ", doc04) %>% gsub(patter = "\\d", replacement = " ", doc04)
doc04 <- removeWords(doc04, c(stopwords("english"),"will","can","on","table","da","other","only"))
doc04 <- gsub(pattern = "\\b[A-z]\\b{1-3}", replace= " ", doc04)
doc04 <- stripWhitespace(doc04)
doc041 <- tibble(document = c(1), text = doc04)
doc041 <- doc041 %>% unnest_tokens(word,text)
saveRDS(doc041, file="doc04.RDS")

#document5
doc05 <- gsub(pattern="\\W" , replace = " ", doc05) %>% gsub(patter = "\\d", replacement = " ", doc05)
doc05 <- removeWords(doc05, c(stopwords("english"),"will","can","on","table","da","other","only"))
doc05 <- gsub(pattern = "\\b[A-z]\\b{1-3}", replace= " ", doc05)
doc05 <- stripWhitespace(doc05)
doc051 <- tibble(document = c(1), text = doc05)
doc051 <- doc051 %>% unnest_tokens(word,text)
saveRDS(doc051, file="doc05.RDS")

#document6
doc06 <- gsub(pattern="\\W" , replace = " ", doc06) %>% gsub(patter = "\\d", replacement = " ", doc06)
doc06 <- removeWords(doc06, c(stopwords("english"),"will","can","on","table","da","other","only"))
doc06 <- gsub(pattern = "\\b[A-z]\\b{1-3}", replace= " ", doc06)
doc06 <- stripWhitespace(doc06)
doc061 <- tibble(document = c(1), text = doc06)
doc061 <- doc061 %>% unnest_tokens(word,text)
saveRDS(doc061, file="doc06.RDS")

#document7
doc07 <- gsub(pattern="\\W" , replace = " ", doc07) %>% gsub(patter = "\\d", replacement = " ", doc07)
doc07 <- removeWords(doc07, c(stopwords("english"),"will","can","on","table","da","other","only"))
doc07 <- gsub(pattern = "\\b[A-z]\\b{1-3}", replace= " ", doc07)
doc07 <- stripWhitespace(doc07)
doc071 <- tibble(document = c(1), text = doc07)
doc071 <- doc071 %>% unnest_tokens(word,text)
saveRDS(doc071, file="doc07.RDS")

#document8
doc08 <- gsub(pattern="\\W" , replace = " ", doc08) %>% gsub(patter = "\\d", replacement = " ", doc08)
doc08 <- removeWords(doc08, c(stopwords("english"),"will","can","on","table","da","other","only"))
doc08 <- gsub(pattern = "\\b[A-z]\\b{1-3}", replace= " ", doc08)
doc08 <- stripWhitespace(doc08)
doc081 <- tibble(document = c(1), text = doc08)
doc081 <- doc081 %>% unnest_tokens(word,text)
saveRDS(doc081, file="doc08.RDS")

#document9
doc09 <- gsub(pattern="\\W" , replace = " ", doc09) %>% gsub(patter = "\\d", replacement = " ", doc09)
doc09 <- removeWords(doc09, c(stopwords("english"),"will","can","on","table","da","other","only"))
doc09 <- gsub(pattern = "\\b[A-z]\\b{1-3}", replace= " ", doc09)
doc09 <- stripWhitespace(doc09)
doc091 <- tibble(document = c(1), text = doc09)
doc091 <- doc091 %>% unnest_tokens(word,text)
saveRDS(doc091, file="doc09.RDS")

#document10
doc10 <- gsub(pattern="\\W" , replace = " ", doc10) %>% gsub(patter = "\\d", replacement = " ", doc10)
doc10 <- removeWords(doc10, c(stopwords("english"),"will","can","on","table","da","other","only"))
doc10 <- gsub(pattern = "\\b[A-z]\\b{1-3}", replace= " ", doc10)
doc10 <- stripWhitespace(doc10)
doc101 <- tibble(document = c(1), text = doc10)
doc101 <- doc101 %>% unnest_tokens(word,text)
saveRDS(doc101, file="doc10.RDS")

#creates a dataframe with all the documents and counts the frequency of stemwords
fulldocs <- tibble(document = c(seq(1:10)), text = c(doc01, doc02, doc03, doc04, doc05, doc06, doc07, doc08, doc09, doc10))
tokenized_docs <- fulldocs %>% unnest_tokens(word,text)
doc_stem_counts <- tokenized_docs %>% mutate(stem = wordStem(word)) %>% count(document,stem,sort = TRUE)
word_freq_totals <- fulldocs %>% unnest_tokens(word, text) %>% count(word, sort = TRUE)
word_freq_docs <- tokenized_docs %>% mutate(stem = wordStem(word)) %>% count(document,stem,sort = TRUE)

#saves all the documents in a dataframe and the total word frequencies in all documents
saveRDS(word_freq_totals,file = "word_freq_totals.RDS")
saveRDS(fulldocs, file="fulldocs.RDS")
saveRDS(tokenized_docs, file="tokenized_docs.RDS")
saveRDS(word_freq_docs, file = "word_freq_docs.RDS")
saveRDS(doc_stem_counts, file = "doc_stem_counts.RDS")

