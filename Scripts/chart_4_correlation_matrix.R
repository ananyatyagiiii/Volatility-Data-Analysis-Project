# Chart 4: Correlation Matrix
# Heatmap of cross-asset correlation (common analysis period: Nov 2017 - Dec 2024)

setwd("/Users/ananyatyagi/Desktop/Volatility Data Analysis Project")

library(ggplot2)
library(tidyr)
library(dplyr)

corr_matrix <- matrix(c(
  1.0000, 0.9252, 0.3814, 0.4158,
  0.9252, 1.0000, 0.3488, 0.4091,
  0.3814, 0.3488, 1.0000, 0.7403,
  0.4158, 0.4091, 0.7403, 1.0000
), nrow = 4, byrow = TRUE)

rownames(corr_matrix) <- c("SPY", "QQQ", "BTC", "ETH")
colnames(corr_matrix) <- c("SPY", "QQQ", "BTC", "ETH")

corr_df <- as.data.frame(corr_matrix)
corr_df$Asset1 <- rownames(corr_df)

corr_long <- corr_df %>%
  pivot_longer(cols = c(SPY, QQQ, BTC, ETH), names_to = "Asset2", values_to = "Correlation")

corr_long$Asset1 <- factor(corr_long$Asset1, levels = c("SPY", "QQQ", "BTC", "ETH"))
corr_long$Asset2 <- factor(corr_long$Asset2, levels = rev(c("SPY", "QQQ", "BTC", "ETH")))

chart4 <- ggplot(corr_long, aes(x = Asset1, y = Asset2, fill = Correlation)) +
  geom_tile(color = "white", size = 1.5) +
  geom_text(aes(label = sprintf("%.3f", Correlation)),
            color = "black", size = 5, fontface = "bold") +
  scale_fill_gradient2(low = "#4575B4", mid = "white", high = "#D73027",
                        midpoint = 0.5, limits = c(0, 1),
                        name = "Correlation") +
  labs(title = "Correlation Matrix: Asset Class Relationships",
       subtitle = "Nov 2017 - Dec 2024 (Common Analysis Period)",
       x = NULL, y = NULL) +
  theme_minimal() +
  theme(plot.title = element_text(size = 16, face = "bold", hjust = 0.5, margin = margin(b = 5)),
        plot.subtitle = element_text(size = 11, hjust = 0.5, color = "gray50", margin = margin(b = 20)),
        axis.text = element_text(size = 12, face = "bold"),
        panel.grid = element_blank(),
        legend.title = element_text(size = 10, face = "bold"),
        legend.text = element_text(size = 9),
        plot.background = element_rect(fill = "white", color = NA),
        panel.background = element_rect(fill = "white", color = NA),
        plot.margin = margin(20, 20, 20, 20))

ggsave("Chart_4_Correlation_Matrix.png", plot = chart4, width = 9, height = 8, dpi = 300, units = "in", bg = "white")

print("Chart saved: Chart_4_Correlation_Matrix.png")
