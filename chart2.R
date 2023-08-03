prison_pop_2016 <- data_prison %>%
  filter(state == "WA", year == 2016)

chart_2 <- ggplot(data = prison_pop_2016, mapping = aes(x = county_name)) +
  geom_bar(aes(y = male_prison_pop, 
          fill = "Male Prison Population"),
          stat = "identity"
           ) +
  geom_bar(aes(y = female_prison_pop,
          fill = "Female Prison Population"), 
          stat = "identity"
          ) +
  labs(
    title = "Prison Population in WA, 2016 by County",
    x = "County",
    y = "Prison Population",
  ) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
