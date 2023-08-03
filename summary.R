library(ggplot2)
library(dplyr)
library(scales)
library(maps)

data_prison <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-pop.csv?raw=true")

# Finds the difference of the average male and female prison population
# Prints the average male and female population then the difference
female_male_dif <- data_prison %>%
  filter(!is.na(male_prison_pop) & !is.na(female_prison_pop)) %>%
  summarize(avg_male_pop = mean(male_prison_pop),
  avg_female_pop = mean(female_prison_pop)) %>%
  mutate(difference = avg_male_pop - avg_female_pop) %>%
  print()
  
# Finds the sum of female population in WA, 2015
female_WA_2015 <- data_prison %>%
  filter(state == "WA", year == 2016, !is.na(female_prison_pop)) %>%
  select(female_prison_pop) %>%
  sum()

# Finds the sum of male population in WA, 2015
malel_WA_2015 <- data_prison %>%
  filter(state == "WA", year == 2016, !is.na(male_prison_pop)) %>%
  select(male_prison_pop) %>%
  sum()

# Finds the sum of white female population in WA, 2015
white_female_WA_2015 <- data_prison %>%
  filter(state == "WA", year == 2016, !is.na(white_female_prison_pop)) %>%
  select(white_female_prison_pop) %>%
  sum()

# Finds the sum of black female population in WA, 2015
black_female_WA_2015 <- data_prison %>%
  filter(state == "WA", year == 2016, !is.na(black_female_prison_pop)) %>%
  select(black_female_prison_pop) %>%
  sum()
