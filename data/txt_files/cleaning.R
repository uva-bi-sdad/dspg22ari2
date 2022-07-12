library(tm)
library(stringr)
library(tidytext)
library(tidyverse)

#importing first document
doc1 <-paste(readLines("DedooseDoc_AR_623-23.docx_2022_7_7_1258.txt"), collapse = " ")
#cleaning document

doc1 <- gsub(pattern="\\W" , replace = " ", doc1)
doc1 <- gsub(patter = "\\d", replacement = " ", doc1)
doc1 <- tolower(doc1)
doc1 <- removeWords(doc1, stopwords())
doc1 <- gsub(pattern = "\\b[A-z]\\b{1-3}", replace= " ", doc1)
doc1 <- stripWhitespace(doc1)
#doc1 <- str_split(doc1, pattern = "\\s+")


text_df <- tibble(document = "AR623", text = c(doc1))
text_df %>% unnest_tokens(word, text) %>% count(document, word, sort = TRUE)


