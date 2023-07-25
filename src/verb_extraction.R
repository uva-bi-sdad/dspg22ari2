#install.packages("udpipe")
library(udpipe)
library(pdftools)
library(tidyr)
library(dplyr)

ud_model <- udpipe_download_model(language = "english")

text <- pdf_text("https://www.jcs.mil/Portals/36/Documents/Doctrine/training/ujtl_tasks.pdf?ver=xPwVK3BUygIUkK-4gjBY4w%3d%3d")

pg_one <- text

ud_model <- udpipe_load_model(ud_model$file_model)
x <- udpipe_annotate(ud_model, x = pg_one)
x <- as.data.frame(x)

verbs <- x %>% filter(upos == "VERB") %>% group_by(lemma) %>% summarise(count = n()) %>% arrange(-count)

#%>% write.csv("./data/verbs.csv", row.names = FALSE)

# START HERE!
verbs <- readr::read_csv("./data/verbs.csv")

# NEXT: Cooccurence for most frequently occurring verbs (verb phrases)

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

#setwd("~/github/dspg22ari2/data/pam600-3")

#importing documents, removing analysis.R, cleaning.R and paragraph_cleaning.R
#files <- list.files("~/git/dspg22ari2/data/pam600-3")
#files <- files[!grepl("R$", files)]
#files <- files[!grepl("RDS$", files)]
names <- NULL
cleaned <- NULL
# my_stop_words <- bind_rows(stop_words, tibble(word = c("bolc","tmts","cohen","hambrick","ancona","ruth","ross","johnson","rodriguez","ibid","adrp","also","bunnell","cajina","rc","ccc","ile","ar","finkelstein",as.character(1:12)), lexicon = rep("custom", 30)))


  # nothing after readLines, reads it in as paragraphs
  doc01 <-paste(text)
  #cleaning document
  doc01 <- gsub(pattern="\\W" , replace = " ", doc01)%>% gsub(pattern = "\\d", replacement = " ", doc01)
  doc01<-tolower(doc01)
  doc01<- lemmatize_strings(doc01)
  #doc01 <- rm_nchar_words(doc01, "1,3")
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

text_df <- tibble(paragraph = c(seq(1:length(cleaned))), text = cleaned, document = 1)
tokenized_paragraphs <- text_df %>% unnest_tokens(word, text) %>% count(word, paragraph, sort = TRUE)
tokenized_words <- text_df %>% unnest_tokens(word,text) %>% count(word,document, sort = TRUE)
cooccurence <- tokenized_paragraphs %>% pairwise_count(word, paragraph, wt = n, sort = TRUE, upper = FALSE)

verb_phrases <- verbs %>% left_join(cooccurence, by = c("lemma" = "item1")) %>% rename(verb_count = count, cooccurence_count = n)

top_verb_phrases <- verb_phrases %>% group_by(lemma) %>% top_n(n = 5)

# NEXT: Sys.time for more and more pages of the manual

files <- list.files(path = "./BERT_Analysis/GAT")
files <- files[grepl("^GAT", files)]
names <- NULL
cleaned <- NULL

for (file in files){
  doc01 <-paste(readLines(paste0("./BERT_Analysis/GAT/", file)))
  cleaned <- cleaned %>% append(doc01) # object for cleaned paragraph text
  names <- names %>% append(rep(file, length(doc01))) # object for the document name each paragraph belongs to
}

text_df <- tibble(paragraph = c(seq(1:length(cleaned))), text = cleaned, document = names)
tokenized_paragraphs <- text_df %>% unnest_tokens(word, text) %>% count(word, paragraph, sort = TRUE)
tokenized_words <- text_df %>% unnest_tokens(word,text) %>% count(word,document, sort = TRUE)

verb_gat <- tokenized_words %>% group_by(document) %>% mutate(total_words = n()) %>% left_join(verbs, by = c("word" = "lemma")) %>% filter(!is.na(count)) %>%
  group_by(document) %>%
  mutate(verb_count = n(),
         verb_sum = sum(count)/total_words) %>% distinct(document, verb_count, verb_sum)
