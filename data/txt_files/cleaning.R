library(tm)
library(stringr)
library(tidytext)
library(tidyverse)



#importing first document
doc01 <-paste(readLines("DedooseDoc_AR_623-23.docx_2022_7_7_1258.txt"), collapse = " ")
#cleaning document

doc01 <- gsub(pattern="\\W" , replace = " ", doc01)
doc01 <- gsub(patter = "\\d", replacement = " ", doc01)
doc01 <- tolower(doc01)
doc01 <- removeWords(doc01, stopwords())
doc01 <- gsub(pattern = "\\b[A-z]\\b{1-3}", replace= " ", doc01)
doc01 <- stripWhitespace(doc01)
#doc1 <- str_split(doc1, pattern = "\\s+")


text_df <- tibble(document = "AR623", text = c(doc01))
text_df %>% unnest_tokens(word, text) %>% count(document, word, sort = TRUE)
#document02
doc02 <-paste(readLines("DedooseDoc_army_leadership_and_the_profession.docx_2022_7_7_1257.txt"), collapse = " ")

doc02 <- gsub(pattern="\\W" , replace = " ", doc02)
doc02 <- gsub(patter = "\\d", replacement = " ", doc02)
doc02 <- tolower(doc02)
doc02 <- removeWords(doc02, stopwords())
doc02 <- gsub(pattern = "\\b[A-z]\\b{1-3}", replace= " ", doc02)
doc02 <- stripWhitespace(doc02)

text_df <- tibble(document = "Army Leadership", text = c(doc02))
text_df %>% unnest_tokens(word, text) %>% count(document, word, sort = TRUE)

#document3
doc03 <-paste(readLines("DedooseDoc_Building_cohesive_teams.docx_2022_7_7_1247.txt"), collapse = " ")

doc03 <- gsub(pattern="\\W" , replace = " ", doc03)
doc03 <- gsub(patter = "\\d", replacement = " ", doc03)
doc03 <- tolower(doc03)
doc03 <- removeWords(doc03, stopwords())
doc03 <- gsub(pattern = "\\b[A-z]\\b{1-3}", replace= " ", doc03)
doc03 <- stripWhitespace(doc03)

text_df <- tibble(document = "Building Cohesive Teams", text = c(doc03))
text_df %>% unnest_tokens(word, text) %>% count(document, word, sort = TRUE)
#document4
doc04 <-paste(readLines("DedooseDoc_FM_6-22_leader_development.docx_2022_7_7_1255.txt"), collapse = " ")

doc04 <- gsub(pattern="\\W" , replace = " ", doc04)
doc04 <- gsub(patter = "\\d", replacement = " ", doc04)
doc04 <- tolower(doc04)
doc04 <- removeWords(doc04, stopwords())
doc04 <- gsub(pattern = "\\b[A-z]\\b{1-3}", replace= " ", doc04)
doc04 <- stripWhitespace(doc04)

text_df <- tibble(document = "FM6_22", text = c(doc04))
text_df %>% unnest_tokens(word, text) %>% count(document, word, sort = TRUE)
#document5
doc05 <-paste(readLines("DedooseDoc_leaders_guide_to_team_building.docx_2022_7_7_1257.txt"), collapse = " ")

doc05 <- gsub(pattern="\\W" , replace = " ", doc05)
doc05 <- gsub(patter = "\\d", replacement = " ", doc05)
doc05 <- tolower(doc05)
doc05 <- removeWords(doc05, stopwords())
doc05 <- gsub(pattern = "\\b[A-z]\\b{1-3}", replace= " ", doc05)
doc05 <- stripWhitespace(doc05)

text_df <- tibble(document = "Leaders Guide", text = c(doc05))
text_df %>% unnest_tokens(word, text) %>% count(document, word, sort = TRUE)
#document6
doc06 <-paste(readLines("DedooseDoc_PAM 600-3_merged_docx.docx_2022_7_7_1258.txt"), collapse = " ")

doc06 <- gsub(pattern="\\W" , replace = " ", doc06)
doc06 <- gsub(patter = "\\d", replacement = " ", doc06)
doc06 <- tolower(doc06)
doc06 <- removeWords(doc06, stopwords())
doc06 <- gsub(pattern = "\\b[A-z]\\b{1-3}", replace= " ", doc06)
doc06 <- stripWhitespace(doc06)

text_df <- tibble(document = "PAM600_3", text = c(doc06))
text_df %>% unnest_tokens(word, text) %>% count(document, word, sort = TRUE)
#document7
doc07 <-paste(readLines("DedooseDoc_PAM 623-3_merged.docx_2022_7_7_1246.txt"), collapse = " ")

doc07 <- gsub(pattern="\\W" , replace = " ", doc07)
doc07 <- gsub(patter = "\\d", replacement = " ", doc07)
doc07 <- tolower(doc07)
doc07 <- removeWords(doc07, stopwords())
doc07 <- gsub(pattern = "\\b[A-z]\\b{1-3}", replace= " ", doc07)
doc07 <- stripWhitespace(doc07)

text_df <- tibble(document = "PAM623_3", text = c(doc07))
text_df %>% unnest_tokens(word, text) %>% count(document, word, sort = TRUE)
#document8
doc08 <-paste(readLines("DedooseDoc_soldiers_guide.docx_2022_7_7_1246.txt"), collapse = " ")

doc08 <- gsub(pattern="\\W" , replace = " ", doc08)
doc08 <- gsub(patter = "\\d", replacement = " ", doc08)
doc08 <- tolower(doc08)
doc08 <- removeWords(doc08, stopwords())
doc08 <- gsub(pattern = "\\b[A-z]\\b{1-3}", replace= " ", doc08)
doc08 <- stripWhitespace(doc08)

text_df <- tibble(document = "Soldiers Guide", text = c(doc08))
text_df %>% unnest_tokens(word, text) %>% count(document, word, sort = TRUE)
#document9
doc09 <-paste(readLines("DedooseDoc_the_importance_of_individual_members_to_team_success_2022_7_7_1258.txt"), collapse = " ")

doc09 <- gsub(pattern="\\W" , replace = " ", doc09)
doc09 <- gsub(patter = "\\d", replacement = " ", doc09)
doc09 <- tolower(doc09)
doc09 <- removeWords(doc09, stopwords())
doc09 <- gsub(pattern = "\\b[A-z]\\b{1-3}", replace= " ", doc09)
doc09 <- stripWhitespace(doc09)

text_df <- tibble(document = "Importance of Individual Members", text = c(doc09))
text_df %>% unnest_tokens(word, text) %>% count(document, word, sort = TRUE)
#document10
doc10 <-paste(readLines("DedooseDoc_what_makes_teams_work_final.docx_2022_7_7_1247.txt"), collapse = " ")

doc10 <- gsub(pattern="\\W" , replace = " ", doc10)
doc10 <- gsub(patter = "\\d", replacement = " ", doc10)
doc10 <- tolower(doc10)
doc10 <- removeWords(doc10, stopwords())
doc10 <- gsub(pattern = "\\b[A-z]\\b{1-3}", replace= " ", doc10)
doc10 <- stripWhitespace(doc09)

text_df <- tibble(document = "What Makes Teams Work", text = c(doc10))
text_df %>% unnest_tokens(word, text) %>% count(document, word, sort = TRUE)
