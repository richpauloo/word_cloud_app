library(shiny)
library(wordcloud)
library(reshape2)
library(dplyr)
library(tidytext)
library(stringr)
library(shinythemes)


# placeholder data frame to display before a file is uploaded
placeholder <- data.frame(
  word = c("please","upload", ".txt","file"),
  n = c(2,4,5,3)
)

# function to tokenize input .txt files, clean stop words, and compute term frequency
clean_txt <- function(temp){
  # reshape the .txt data frame into one column
  convo <- tidyr::gather(temp, key, word) %>% select(word)
  
  # tokenize
  tokens <- convo %>% 
    unnest_tokens(word, word) %>% 
    count(word, sort = TRUE) %>% 
    ungroup()
  
  # remove stop words
  data("stop_words")
  tokens_clean <- tokens %>%
    anti_join(stop_words)
  
  # remove numbers
  nums <- tokens_clean %>% 
    filter(str_detect(word, "^[0-9]")) %>% 
    select(word) %>% unique()
  
  tokens_clean <- tokens_clean %>% 
    anti_join(nums, by = "word")
  
  return(tokens_clean)
}


# define a color palette for the word cloud
pal <- brewer.pal(8,"Dark2")