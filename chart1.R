prision_pop_wa <- data_prison %>%
  filter(state == "WA", county_name == "Pierce County")

chart_1 <- ggplot() +
  geom_line(data = prision_pop_wa, mapping = aes(
    x = year, 
    y = female_prison_pop,
    color = "Female Prison Population"
  )) +
  geom_line(data = prision_pop_wa, mapping = aes(
    x = year, 
    y = male_prison_pop,
    color = "Male Prison Population"
  )) +
  labs(
    title = "Female Versus Male Population in Pierce County, WA",
    x = "Year",
    y = "Female and Male Population",
    color = "Population Color"
  ) +
  scale_color_manual(
    values = c("Female Prison Population" = "red", "Male Prison Population" = "blue"),
    labels = c("Female Prison Population", "Male Prison Population"),
  )