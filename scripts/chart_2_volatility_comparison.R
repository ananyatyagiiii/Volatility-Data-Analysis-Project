# Chart 2: Volatility Comparison (Current vs Average)
# Bar chart comparing current 12-month volatility to 10-year average, by asset

setwd("/Users/ananyatyagi/Desktop/Volatility Data Analysis Project")

library(ggplot2)
library(tidyr)
library(dplyr)

# volatility_comparison should already exist from the volatility calculation step:
# volatility_comparison <- data.frame(
#   Asset = c("SPY", "QQQ", "BTC", "ETH"),
#   Current = c(10.72269, 11.66537, 61.51825, 79.44879),
#   Average = c(14.55, 17.77, 71.44, 88.67)
# )

vol_plot <- volatility_comparison %>%
  pivot_longer(
    cols = c(Current, Average),
    names_to = "Type",
    values_to = "Volatility"
  )

chart2 <- ggplot(vol_plot, aes(x = factor(Asset, levels = c("SPY", "QQQ", "BTC", "ETH")),
                                y = Volatility,
                                fill = Type)) +
  geom_bar(stat = "identity", position = "dodge", alpha = 0.8, width = 0.7) +
  geom_text(aes(label = round(Volatility, 2)),
            position = position_dodge(width = 0.7),
            vjust = -0.5, size = 3.5, fontface = "bold") +
  scale_fill_manual(values = c("Current" = "#0173B2", "Average" = "#CCCCCC"), name = "") +
  scale_x_discrete(labels = c("SPY" = "S&P 500\n(SPY)", "QQQ" = "Nasdaq-100\n(QQQ)",
                               "BTC" = "Bitcoin\n(BTC)", "ETH" = "Ethereum\n(ETH)")) +
  labs(title = "Volatility Comparison: Current vs Average",
       subtitle = "2014-2024 Analysis Period",
       y = "Annualized Volatility (%)", x = NULL) +
  theme_minimal() +
  theme(plot.title = element_text(size = 15, face = "bold", hjust = 0.5, margin = margin(b = 5)),
        plot.subtitle = element_text(size = 11, hjust = 0.5, color = "gray50", margin = margin(b = 15)),
        axis.text.x = element_text(size = 10, face = "bold"),
        axis.text.y = element_text(size = 10),
        axis.title.y = element_text(size = 11, face = "bold"),
        legend.position = "top",
        legend.text = element_text(size = 10),
        panel.grid.major.y = element_line(color = "#EEEEEE", size = 0.3),
        panel.grid.major.x = element_blank(),
        plot.background = element_rect(fill = "white", color = NA),
        panel.background = element_rect(fill = "white", color = NA))

ggsave("Chart_2_Volatility_Comparison.png", plot = chart2, width = 12, height = 7, dpi = 300, units = "in", bg = "white")

print("Chart saved: Chart_2_Volatility_Comparison.png")
