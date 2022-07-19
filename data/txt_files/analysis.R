library(topicmodels)
# data("AssociatedPress")
# ap_lda <- LDA(AssociatedPress, k = 2, control = list(seed = 1234))
# ap_lda
library(tidytext)

# ap_topics <- tidy(ap_lda, matrix = "beta")
# ap_topics

library(ggplot2)
library(dplyr)

# ap_top_terms <- ap_topics %>%
#   group_by(topic) %>%
#   slice_max(beta, n = 10) %>%
#   ungroup() %>%
#   arrange(topic, -beta)
#
# ap_top_terms %>%
#   mutate(term = reorder_within(term, beta, topic)) %>%
#   ggplot(aes(beta, term, fill = factor(topic))) +
#   geom_col(show.legend = FALSE) +
#   facet_wrap(~ topic, scales = "free") +
#   scale_y_reordered()

library(tidyr)

# beta_wide <- ap_topics %>%
#   mutate(topic = paste0("topic", topic)) %>%
#   pivot_wider(names_from = topic, values_from = beta) %>%
#   filter(topic1 > .001 | topic2 > .001) %>%
#   mutate(log_ratio = log2(topic2 / topic1))
#
# beta_wide
#
# ap_documents <- tidy(ap_lda, matrix = "gamma")
# ap_documents
#
# tidy(AssociatedPress) %>%
#   filter(document == 6) %>%
#   arrange(desc(count))

chapters_dtm <- word_counts %>%
  cast_dtm(document, stem, n)

chapters_dtm

chapters_lda <- LDA(chapters_dtm, k = 18, control = list(seed = 1234))
chapters_lda

chapter_topics <- tidy(chapters_lda, matrix = "beta")
chapter_topics

top_terms <- chapter_topics %>%
  group_by(topic) %>%
  slice_max(beta, n = 10) %>%
  ungroup() %>%
  arrange(topic, -beta)

top_terms

library(ggplot2)

top_terms %>%
  mutate(term = reorder_within(term, beta, topic)) %>%
  ggplot(aes(beta, term, fill = factor(topic))) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~ topic, scales = "free") +
  scale_y_reordered()

library(dplyr)
library(tidyr)
library(widyr)
title_word_pairs <- for_pairs %>% pairwise_count(word ,document , sort = TRUE, upper = FALSE)

title_word_pairs

library(ggplot2)
library(igraph)
library(ggraph)

set.seed(1234)
title_word_pairs %>%
  filter(n >= 100) %>%
  graph_from_data_frame() %>%
  ggraph(layout = "fr") +
  geom_edge_link(aes(edge_alpha = n, edge_width = n), edge_colour = "cyan4") +
  geom_node_point(size = 5) +
  geom_node_text(aes(label = name), repel = TRUE,
                 point.padding = unit(0.2, "lines")) +
  theme_void()
