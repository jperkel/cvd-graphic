library(tidyverse)
library(colorBlindness)

# from https://github.com/clauswilke/colorblindr/blob/master/R/palettes.R
palette_OkabeIto <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7", "#999999")

# standard ggplot palette
p <- ggplot(diamonds, aes(x = price, fill = cut)) + 
  theme_minimal() +
  geom_histogram() +
  labs(x = "Price (USD)", y = "Count")
# Check output in a CVD simulator
cvdPlot(p)

# Okabe-Ito palette... check output in a CVD simulator
cvdPlot(p + scale_fill_manual(values = palette_OkabeIto))

# rainbow palette... check output in a CVD simulator
cvdPlot(p + scale_fill_manual(values = rainbow(5)))
