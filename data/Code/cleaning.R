library(tm)
library(stringr)
library(tidytext)
library(tidyverse)
library(SnowballC)
library(widyr)
library(ggplot2)
library(igraph)
library(ggraph)
library(stringi)
library(pacman)
library(textstem)
library(qdapRegex)

setwd("~/github/dspg22ari2/data/txt_files")

#importing documents, removing analysis.R, cleaning.R and paragraph_cleaning.R
files <- list.files("~/git/dspg22ari2/data/txt_files")
files <- files[!grepl("R$", files)]
files <- files[!grepl("RDS$", files)]
names <- NULL
cleaned <- NULL
# my_stop_words <- bind_rows(stop_words, tibble(word = c("bolc","tmts","cohen","hambrick","ancona","ruth","ross","johnson","rodriguez","ibid","adrp","also","bunnell","cajina","rc","ccc","ile","ar","finkelstein",as.character(1:12)), lexicon = rep("custom", 30)))

for(file in files){
  # nothing after readLines, reads it in as paragraphs
  doc01 <-paste(readLines(file))
  #cleaning document
  doc01 <- gsub(pattern="\\W" , replace = " ", doc01)%>% gsub(pattern = "\\d", replacement = " ", doc01)
  doc01<-tolower(doc01)
  doc01<- lemmatize_strings(doc01)
  doc01 <- rm_nchar_words(doc01, "1,3")
  # doc01 <- gsub('\\b\\w{1,3}\\b','',doc01)
  doc01 <- stripWhitespace(doc01)
  doc01 <- stringi::stri_remove_empty(doc01) # remove blank paragraphs
  # doc01 <- doc01 %>% anti_join(my_stop_words)
  doc01<- removeWords(doc01, c(stopwords("english"),"bolc","tmts","cohen","hambrick",
                               "ancona","ruth","ross","johnson","rodriguez","ibid","adrp","also","bunnell",
                               "cajina","rc","ccc","ile","ar","finkelstein","capl","brown","christiansen",
                               "fema","kingston","mcpherson","opms","hqda","arng","wocs","capi","opmg",
                               "much", "will", "grinston", "however", "rater", "find", "make", "table")) # adding capital T to the stopwords
  cleaned <- cleaned %>% append(doc01) # object for cleaned paragraph text
  names <- names %>% append(rep(file, length(doc01))) # object for the document name each paragraph belongs to
}

text_df <- tibble(paragraph = c(seq(1:length(cleaned))), text = cleaned, document = names)
tokenized_paragraphs <- text_df %>% unnest_tokens(word, text) %>% count(word, paragraph, sort = TRUE)
tokenized_words <- text_df %>% unnest_tokens(word,text) %>% count(word,document, sort = TRUE)
cooccurence <- tokenized_paragraphs %>% pairwise_count(word, paragraph, wt = n, sort = TRUE, upper = FALSE)

