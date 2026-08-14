# Chart 7: Sharpe Ratio Comparison
# Bar chart of risk-adjusted return (Sharpe ratio) by asset

setwd("/Users/ananyatyagi/Desktop/Volatility Data Analysis Project")

library(ggplot2)

sharpe_data <- data.frame(
  Asset = c("SPY", "QQQ", "BTC", "ETH"),
  Sharpe = c(0.10, 0.12, 0.13, 0.09)
)

sharpe_data$Asset <- factor(sharpe_data$Asset, levels = c("SPY", "QQQ", "BTC", "ETH"))

chart7 <- ggplot(sharpe_data, aes(x = Asset, y = Sharpe, fill = Asset)) +
  geom_bar(stat = "identity", width = 0.6, alpha = 0.85) +
  geom_text(aes(label = sprintf("%.2f", Sharpe)),
            vjust = -0.6, size = 5, fontface = "bold") +
  scale_fill_manual(values = c("SPY" = "#0173B2", "QQQ" = "#029E73",
                                "BTC" = "#DE8F05", "ETH" = "#CC78BC")) +
  scale_x_discrete(labels = c("SPY" = "S&P 500\n(SPY)", "QQQ" = "Nasdaq-100\n(QQQ)",
                               "BTC" = "Bitcoin\n(BTC)", "ETH" = "Ethereum\n(ETH)")) +
  scale_y_continuous(limits = c(0, 0.16), breaks = seq(0, 0.15, 0.05)) +
  labs(title = "Risk-Adjusted Returns: Sharpe Ratio by Asset",
       subtitle = "Return earned per unit of risk taken, 2014-2024",
       x = NULL, y = "Sharpe Ratio") +
  theme_minimal() +
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5, margin = margin(b = 5)),
        plot.subtitle = element_text(size = 11, hjust = 0.5, color = "gray50", margin = margin(b = 20)),
        axis.text.x = element_text(size = 11, face = "bold"),
        axis.text.y = element_text(size = 10),
        axis.title.y = element_text(size = 11, face = "bold"),
        legend.position = "none",
        panel.grid.major.y = element_line(color = "#EEEEEE", size = 0.3),
        panel.grid.major.x = element_blank(),
        panel.grid.minor = element_blank(),
        plot.background = element_rect(fill = "white", color = NA),
        panel.background = element_rect(fill = "white", color = NA),
        plot.margin = margin(20, 20, 20, 20))

ggsave("Chart_7_Sharpe_Ratio.png", plot = chart7, width = 10, height = 6.5, dpi = 300, units = "in", bg = "white")

print("Chart saved: Chart_7_Sharpe_Ratio.png")
