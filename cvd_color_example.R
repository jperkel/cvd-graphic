library(tidyverse)
library(colorBlindness)
library(here)

# from https://github.com/clauswilke/colorblindr/blob/master/R/palettes.R
palette_OkabeIto <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7", "#999999")

# standard ggplot palette
p <- ggplot(diamonds, aes(x = price, fill = cut)) + 
  theme_minimal() +
  geom_histogram() +
  labs(x = "Price (USD)", y = "Count")
# Check output in a CVD simulator
std_palette <- cvdPlot(p)
ggsave(here("std_palette.jpg"), width = 8, height = 6, units = "in")

# Okabe-Ito palette... check output in a CVD simulator
okabe_ito <- cvdPlot(p + scale_fill_manual(values = palette_OkabeIto))
ggsave(here("okabe_ito.jpg"), width = 8, height = 6, units = "in")

# rainbow palette... check output in a CVD simulator
rainbow <- cvdPlot(p + scale_fill_manual(values = rainbow(5)))
ggsave(here("rainbow.jpg"), width = 8, height = 6, units = "in")
