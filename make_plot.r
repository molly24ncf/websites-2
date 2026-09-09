library(tidyverse)

top_songs <- read_rds("clean_data.rds")

billboard_plot <- top_songs |>
  ggplot(aes(x = chart_date, y = rank, color = track, group = track)) +
  geom_line(linewidth = 1.1) +
  geom_point(size = 1.5) +
  scale_y_reverse() +
  labs(
    title = "Billboard chart trajectories for selected songs",
    subtitle = "Lower ranks indicate better chart performance.",
    x = "Chart date",
    y = "Billboard rank",
    color = "Track"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold"),
    legend.position = "top"
  )

ggsave("billboard_plot.png", plot = billboard_plot, width = 8, height = 5)
