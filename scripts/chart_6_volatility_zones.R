# Chart 6: Volatility Zone Classification
# Current vs average volatility, with Low/Moderate/High/Very High reference bands

setwd("/Users/ananyatyagi/Desktop/Volatility Data Analysis Project")

library(ggplot2)
library(tidyr)
library(dplyr)

# volatility_comparison should already exist from the volatility calculation step
vol_plot <- volatility_comparison %>%
  pivot_longer(
    cols = c(Current, Average),
    names_to = "Type",
    values_to = "Volatility"
  )

chart6 <- ggplot(vol_plot, aes(x = factor(Asset, levels = c("SPY", "QQQ", "BTC", "ETH")),
                                y = Volatility,
                                fill = Type)) +

  geom_hline(yintercept = 15, linetype = "dashed", color = "gray60", size = 0.6) +
  geom_hline(yintercept = 30, linetype = "dashed", color = "gray60", size = 0.6) +
  geom_hline(yintercept = 60, linetype = "dashed", color = "gray60", size = 0.6) +

  annotate("text", x = 4.6, y = 7.5, label = "Low", size = 3.2, color = "gray40", fontface = "italic", hjust = 0) +
  annotate("text", x = 4.6, y = 22.5, label = "Moderate", size = 3.2, color = "gray40", fontface = "italic", hjust = 0) +
  annotate("text", x = 4.6, y = 45, label = "High", size = 3.2, color = "gray40", fontface = "italic", hjust = 0) +
  annotate("text", x = 4.6, y = 75, label = "Very High", size = 3.2, color = "gray40", fontface = "italic", hjust = 0) +

  geom_bar(stat = "identity", position = "dodge", alpha = 0.85, width = 0.7) +

  geom_text(aes(label = round(Volatility, 1)),
            position = position_dodge(width = 0.7),
            vjust = -0.5, size = 3.3, fontface = "bold") +

  scale_fill_manual(values = c("Current" = "#0173B2", "Average" = "#CCCCCC"), name = "") +

  scale_x_discrete(labels = c("SPY" = "S&P 500", "QQQ" = "Nasdaq-100",
                               "BTC" = "Bitcoin", "ETH" = "Ethereum")) +

  coord_cartesian(xlim = c(0.5, 4.6), clip = "off") +

  labs(title = "Volatility Zone Classification: Current vs Average",
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
        panel.background = element_rect(fill = "white", color = NA),
        plot.margin = margin(20, 60, 20, 20))

ggsave("Chart_6_Volatility_Zones.png", plot = chart6, width = 12, height = 7, dpi = 300, units = "in", bg = "white")

print("Chart saved: Chart_6_Volatility_Zones.png")
