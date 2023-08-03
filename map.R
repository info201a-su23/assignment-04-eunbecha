library(ggplot2)
library(dplyr)

head(data)

data %>%
  ggplot( aes(x=total_pop)) +
  geom_histogram(bins=20, fill='skyblue', color='#69b3a2') + scale_x_log10()

data_merge = data %>%
  left_join(. , data, by=c("region"="state"))
