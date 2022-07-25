library(topicmodels)
library(tidytext)
library(ggplot2)
library(dplyr)
library(tidyr)
library(widyr)
library(igraph)
library(ggraph)
library(forcats)

#topic model on all documents
chapters_dtm <- tokenized_words %>%
  cast_dtm(document, word, n)

chapters_lda <- LDA(chapters_dtm, k = 18, control = list(seed = 1234))

chapter_topics <- tidy(chapters_lda, matrix = "beta")

top_terms <- chapter_topics %>%
  group_by(topic) %>%
  slice_max(beta, n = 10) %>%
  ungroup() %>%
  arrange(topic, -beta)
# top_terms <- top_terms %>% rename( = 1, = 2, =3, = 4, =5, =6, =7, =8)

top_terms %>%
  mutate(term = reorder_within(term, beta, topic)) %>%
  ggplot(aes(beta, term, fill = factor(topic))) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~ topic, scales = "free") +
  scale_y_reordered() +
  theme(axis.text.x = element_text(angle=30, size = 8)) +
  scale_fill_manual(values = c("#232d4b","#2c4f6b","#0e879c","#60999a","#d1e0bf","#d9e12b",
                               "#e6ce3a","#e6a01d","#e57200", "orange", "#232d4b","#2c4f6b",
                               "#0e879c","#60999a", "#d1e0bf","#d9e12b","#e6ce3a","#e6a01d")) +
  labs(x = "Beta", y = "Term") +




#tf_idf on individual documents
desc_tf_idf <- tokenized_words%>% bind_tf_idf(word, document,n)


desc_tf_idf %>%
  arrange(-tf_idf)



desc_tf_idf%>%
  group_by(document) %>%
  slice_max(tf_idf, n = 8) %>%
  ungroup() %>%
  ggplot(aes(tf_idf, fct_reorder(word, tf_idf), fill = document)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~document, ncol = 2, scales = "free") +
  theme(axis.text.y = element_text(angle=15, size = 12), strip.text = element_text(size=13)) +
  labs(x = "TF-IDF", y = NULL) +
  scale_fill_manual(values = c("#232d4b","#2c4f6b","#0e879c","#60999a","#d1e0bf","#d9e12b","#e6ce3a","#e6a01d","#e57200", "orange"))

#+ theme(plot.title = element_text(size=22))



#cooccuarance
cooccurence %>%
  filter(n >=800) %>%
  graph_from_data_frame() %>%
  ggraph(layout = "fr") +
  geom_edge_link(aes(edge_alpha = n, edge_width = n), edge_colour = "cyan4") +
  geom_node_point(size = 2) +
  geom_node_text(aes(label = name), repel = TRUE,
                 point.padding = unit(0.2, "lines")) +
  theme_void()




#import color palette
col<- c("#232d4b","#2c4f6b","#0e879c","#60999a","#d1e0bf","#d9e12b","#e6ce3a","#e6a01d","#e57200", "#fdfdfd")



