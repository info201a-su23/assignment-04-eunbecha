# Filters all years to get only the year 2015
prison_pop_2015 <- data_prison %>%
  filter(year == "2015")

# Gets the total number of black female prison population per state
total_per_state <- prison_pop_2015 %>% 
  group_by(state) %>%
  summarise(black_female_prison_pop = sum(black_female_prison_pop, na.rm = TRUE))

# Changes the abbreviations to state names
state_mapping <- setNames(state.name, state.abb)

# Adds the full state name from abbreviation
total_per_state$full_state_name <- state_mapping[total_per_state$state]
state_shape <- map_data("state")

# Combines the two data sets
total_per_state <- total_per_state %>% 
  mutate(full_state_name = tolower(full_state_name))
prison_state_shape <- left_join(total_per_state, state_shape, by = c("full_state_name" = "region"))

# Plots the map
# Color gradient based on the number of female population of each state
prison_pop_map <- ggplot(data = prison_state_shape) +
  geom_polygon(mapping = aes(x = long,
                             y = lat,
                             group = group,
                             fill = black_female_prison_pop)) +
  scale_fill_continuous(low = "grey",
                        high = "blue",
                        limits = c(0, 4000),
                        labels = label_number_si()) +
  labs(title="Total Black Female Prison Population by State in 2015",
       fill="Total Black Female Prison Population") + 
  coord_map()
