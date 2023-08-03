prision_pop_wa <- data_prison %>%
  filter(state == "WA", county_name == "Pierce County")

chart_1 <- ggplot() +
  geom_line(data = prision_pop_wa, mapping = aes(
    x = year, 
    y = white_female_prison_pop,
    color = "White Female Prison Population"
  )) +
  geom_line(data = prision_pop_wa, mapping = aes(
    x = year, 
    y = black_female_prison_pop,
    color = "Black Female Prison Population"
  )) +
  labs(
    title = "Black Versus White Female Population in Pierce County, WA",
    x = "Year",
    y = "Female Population",
    color = "Population Color"
  ) +
  scale_color_manual(
    values = c("White Female Prison Population" = "purple", "Black Female Prison Population" = "blue"),
    labels = c("White Female Prison Population", "Black Female Prison Population"),
  )