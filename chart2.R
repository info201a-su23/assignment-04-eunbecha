prison_pop_2016 <- data_prison %>%
  filter(state == "WA", year == 2016)

chart_2 <- ggplot(data = prison_pop_2016, mapping = aes(x = county_name)) +
  geom_bar(aes(y = white_female_prison_pop,
          fill = "White Female Prison Population"), 
          stat = "identity"
          ) +
    geom_bar(aes(y = black_female_prison_pop, 
          fill = "Black Female Prison Population"),
          stat = "identity"
          ) +
  labs(
    title = "Female Prison Population in WA, 2016 by County",
    x = "County",
    y = "Prison Population",
  ) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
