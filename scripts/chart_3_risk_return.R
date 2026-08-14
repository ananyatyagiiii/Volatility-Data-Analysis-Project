# Chart 3: Risk-Return Profile
# Scatter plot of annualized volatility vs annualized return, with Sharpe ratio = 1 reference line

setwd("/Users/ananyatyagi/Desktop/Volatility Data Analysis Project")

library(ggplot2)
library(ggrepel)

risk_return <- data.frame(
  Asset = c("SPY", "QQQ", "BTC", "ETH"),
  Volatility = c(14.94, 18.02, 74.77, 98.74),
  Return = c(11.43, 17.56, 70.06, 32.35)
)

risk_return$Label <- paste0(risk_return$Asset, "\nVol: ", round(risk_return$Volatility, 1),
                             "%  Return: ", round(risk_return$Return, 1), "%")

chart3 <- ggplot(risk_return, aes(x = Volatility, y = Return, color = Asset)) +
  geom_abline(slope = 1, intercept = 0, linetype = "dashed", color = "gray70", size = 0.5) +
  geom_point(size = 6, alpha = 0.85) +
  geom_label_repel(aes(label = Label),
                    size = 3.6, fontface = "bold", lineheight = 0.9,
                    box.padding = 0.6, point.padding = 0.5,
                    segment.color = "gray60", show.legend = FALSE,
                    label.size = 0, fill = alpha("white", 0.85)) +
  scale_color_manual(values = c("SPY" = "#0173B2", "QQQ" = "#029E73", "BTC" = "#DE8F05", "ETH" = "#CC78BC")) +
  scale_x_continuous(limits = c(0, 115), expand = expansion(mult = c(0.02, 0.05))) +
  scale_y_continuous(limits = c(-5, 90), expand = expansion(mult = c(0.02, 0.05))) +
  labs(title = "Risk-Return Profile: Asset Comparison",
       subtitle = "2014-2024 Analysis Period  |  Dashed line = Return equals Volatility (Sharpe ratio of 1)",
       x = "Annual Volatility (Risk) %",
       y = "Annual Return %") +
  theme_minimal() +
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5, margin = margin(b = 5)),
        plot.subtitle = element_text(size = 10.5, hjust = 0.5, color = "gray50", margin = margin(b = 20)),
        axis.text = element_text(size = 10),
        axis.title = element_text(size = 11, face = "bold"),
        legend.position = "none",
        panel.grid.major = element_line(color = "#EEEEEE", size = 0.3),
        panel.grid.minor = element_blank(),
        plot.background = element_rect(fill = "white", color = NA),
        panel.background = element_rect(fill = "white", color = NA),
        plot.margin = margin(20, 20, 20, 20))

ggsave("Chart_3_Risk_Return.png", plot = chart3, width = 12, height = 7.5, dpi = 300, units = "in", bg = "white")

print("Chart saved: Chart_3_Risk_Return.png")
