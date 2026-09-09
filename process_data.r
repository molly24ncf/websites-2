library(tidyverse)

billboard_long <- billboard |>
  select(artist, track, date.entered, starts_with("wk")) |>
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    values_to = "rank",
    values_drop_na = TRUE
  ) |>
  mutate(
    week = as.integer(str_remove(week, "wk")),
    chart_date = date.entered + weeks(week - 1)
  ) |>
  filter(track %in% c("Loser", "Kryptonite", "Baby Don't Cry", "Wobble Wobble"))

# Use billboard_long for plotting later

top_songs <- billboard_long

write_rds(top_songs, file = "clean_data.rds")
