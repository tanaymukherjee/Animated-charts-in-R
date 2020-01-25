# Animation for heatmap
library(dplyr)
mean.temp <- airquality %>%
  group_by(Month) %>%
  summarise(Temp = mean(Temp))
mean.temp

p <- ggplot(mean.temp, aes(Month, Temp, fill = Temp)) +
  geom_col() +
  scale_fill_distiller(palette = "Reds", direction = 1) +
  theme_minimal() +
  theme(
    panel.grid = element_blank(),
    panel.grid.major.y = element_line(color = "white"),
    panel.ontop = TRUE
  )
p

# Animate the above heatmap
p + transition_states(Month, wrap = FALSE) +
  shadow_mark()
anim_save("heatmap_animation.gif")

# Animate the heatmap and add grow/fade feature
p + transition_states(Month, wrap = FALSE) +
  shadow_mark() +
  enter_grow() +
  enter_fade()
anim_save("heatmap_animation_2.gif")
