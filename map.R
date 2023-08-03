library(scales)
library(maps)
library(dplyr)
library(ggplot2)

prision_pop_2003 <- data_prison %>%
  filter(year == "2003")

state_mapping <- setNames(state.name, state.abb)

prision_pop_2003$full_state_name <- state_mapping[prision_pop_2003$state]

state_shape <- map_data("state")

prision_pop_2003 <- prision_pop_2003 %>% 
  mutate(full_state_name = tolower(full_state_name))

prison_state_shape <- left_join(prision_pop_2003, state_shape, by = c("full_state_name" = "region"))

prison_pop_map <- ggplot(data = prison_state_shape) +
  geom_polygon(mapping = aes(x = long,
                             y = lat,
                             group = group,
                             fill = total_prison_pop)) +
  scale_fill_continuous(low = "grey",
                        high = "blue",
                        limits = c(0, 5000),
                        labels = label_number_si()) +
  labs(title="Total Prison Population by State",
       fill="Total Prison Population") + 
  coord_map()
