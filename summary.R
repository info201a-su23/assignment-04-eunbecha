library(ggplot2)
library(dplyr)
library(scales)
library(maps)

data_prison <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-pop.csv?raw=true")

# Finds the difference of the average male and female prison population by state
# Contains the average male, female population, and the difference by state
female_male_dif <- data_prison %>%
  group_by(state) %>%
  filter(!is.na(male_prison_pop) & !is.na(female_prison_pop)) %>%
  summarize(avg_male_pop = mean(male_prison_pop),
  avg_female_pop = mean(female_prison_pop)) %>%
  mutate(difference = avg_male_pop - avg_female_pop) %>%
  ungroup()

# Finds the difference of the average white and black female prison population by state
# Contains the averages and the difference by state
white_black_female_dif <- data_prison %>%
  group_by(state) %>%
  filter(!is.na(white_female_prison_pop) & !is.na(black_female_prison_pop)) %>%
  summarize(avg_white_pop = mean(white_female_prison_pop),
            avg_black_pop = mean(black_female_prison_pop)) %>%
  mutate(difference = avg_white_pop - avg_black_pop) %>%
  ungroup()

# Finds the sum of white female prison population in WA, 2015
white_female_WA_2015 <- data_prison %>%
  filter(state == "WA", year == 2015, !is.na(white_female_prison_pop)) %>%
  select(white_female_prison_pop) %>%
  sum()

# Finds the sum of black female prison population in WA, 2015
black_female_WA_2015 <- data_prison %>%
  filter(state == "WA", year == 2015, !is.na(black_female_prison_pop)) %>%
  select(black_female_prison_pop) %>%
  sum()

# Finds the top 3 states with the most black female prison population
most_black_female_prison_states <- data_prison %>%
  filter(year == 2015, !is.na(black_female_prison_pop)) %>%
  group_by(state) %>%
  summarize(total_black_female_pop = sum(black_female_prison_pop)) %>%
  arrange(desc(total_black_female_pop)) %>%
  top_n(3)
