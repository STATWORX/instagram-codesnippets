# load packages ----------------------------------------------------------------
library(dplyr)
library(snakecase)

iris %>% 
  as_tibble() %>% 
  # harmonize your column names-------------------------------------------------
  # snake_case_options
  rename_all(snakecase::to_snake_case) %>% 
  rename_all(snakecase::to_screaming_snake_case) %>% 
  # camelCaseOptions
  rename_all(snakecase::to_lower_camel_case) %>% 
  rename_all(snakecase::to_upper_camel_case) %>% 
  # Sentence case option
  rename_all(snakecase::to_sentence_case) %>% 
  # Title Case Option
  rename_all(snakecase::to_title_case) %>% 
  # WhaT'S wrONG wiTh yoU?!
  rename_all(snakecase::to_random_case)
