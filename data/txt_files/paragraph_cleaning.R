#importing libraries
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

#importing documents, removing analysis.R, cleaning.R and paragraph_cleaning.R
files <- list.files("~/git/dspg22ari2/data/txt_files")
files <- files[!grepl("R$", files)]
names <- NULL
cleaned <- NULL
for(file in files){
  # nothing after readLines, reads it in as paragraphs
  doc01 <-paste(readLines(file))
  #cleaning document
  doc01 <- gsub(pattern="\\W" , replace = " ", doc01)%>% gsub(patter = "\\d", replacement = " ", doc01)
  doc01<- removeWords(doc01, c(stopwords("english"),"will","can","on","table","da","other","only", "the", "other", "others", "The")) # adding capital T to the stopwords
  doc01 <- gsub(pattern = "\\b[A-z]\\b{1-3}", replace= " ", doc01)
  doc01 <- stripWhitespace(doc01)
  doc01 <- stringi::stri_remove_empty(doc01) # remove blank paragraphs
  cleaned <- cleaned %>% append(doc01) # object for cleaned paragraph text
  names <- names %>% append(rep(file, length(doc01))) # object for the document name each paragraph belongs to
}

text_df <- tibble(paragraph = c(seq(1:length(cleaned))), text = cleaned, document = names)
tokenized_paragraphs <- text_df %>% unnest_tokens(word, text) %>% mutate(stem = wordStem(word)) %>% count(stem, paragraph, sort = TRUE)
cooccurence <- tokenized_paragraphs %>% pairwise_count(stem, paragraph, wt = n, sort = TRUE, upper = FALSE)

cooccurence %>%
  filter(n >=350) %>%
  graph_from_data_frame() %>%
  ggraph(layout = "fr") +
  geom_edge_link(aes(edge_alpha = n, edge_width = n), edge_colour = "cyan4") +
  geom_node_point(size = 5) +
  geom_node_text(aes(label = name), repel = TRUE,
                 point.padding = unit(0.2, "lines")) +
  theme_void()
