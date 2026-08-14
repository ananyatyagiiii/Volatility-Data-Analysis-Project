# Chart 5: Maximum Drawdown
# Horizontal bar chart showing worst peak-to-trough decline by asset

setwd("/Users/ananyatyagi/Desktop/Volatility Data Analysis Project")

library(ggplot2)

drawdown_data <- data.frame(
  Asset = c("SPY", "QQQ", "BTC", "ETH"),
  Max_Drawdown = c(-24.80, -33.07, -75.59, -90.43)
)

drawdown_data$Asset <- factor(drawdown_data$Asset, levels = c("ETH", "BTC", "QQQ", "SPY"))

chart5 <- ggplot(drawdown_data, aes(x = Asset, y = Max_Drawdown, fill = Asset)) +
  geom_bar(stat = "identity", width = 0.6, alpha = 0.85) +
  geom_text(aes(label = paste0(Max_Drawdown, "%")),
            nudge_y = -4, hjust = 1, size = 4.5, fontface = "bold", color = "black") +
  coord_flip() +
  scale_fill_manual(values = c("SPY" = "#0173B2", "QQQ" = "#029E73",
                                "BTC" = "#DE8F05", "ETH" = "#CC78BC")) +
  scale_y_continuous(limits = c(-100, 5), breaks = seq(-100, 0, 25)) +
  labs(title = "Maximum Drawdown by Asset Class",
       subtitle = "Worst peak-to-trough decline, 2014-2024",
       x = NULL, y = "Maximum Drawdown (%)") +
  theme_minimal() +
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5, margin = margin(b = 5)),
        plot.subtitle = element_text(size = 11, hjust = 0.5, color = "gray50", margin = margin(b = 20)),
        axis.text = element_text(size = 11, face = "bold"),
        axis.title.x = element_text(size = 11, face = "bold"),
        legend.position = "none",
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        plot.background = element_rect(fill = "white", color = NA),
        panel.background = element_rect(fill = "white", color = NA),
        plot.margin = margin(20, 20, 20, 20))

ggsave("Chart_5_Max_Drawdown.png", plot = chart5, width = 10, height = 6.5, dpi = 300, units = "in", bg = "white")

print("Chart saved: Chart_5_Max_Drawdown.png")
