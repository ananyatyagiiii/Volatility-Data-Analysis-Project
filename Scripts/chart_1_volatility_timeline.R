# Chart 1: Volatility Timeline (10-Year Comparison, 2014-2024)
# Shows rolling annualized volatility for all 4 assets with crisis event markers

setwd("/Users/ananyatyagi/Desktop/Volatility Data Analysis Project")

library(ggplot2)
library(dplyr)
library(tidyr)

spy <- read.csv("SPY.csv")
qqq <- read.csv("QQQ.csv")
btc <- read.csv("BTC-USD.csv")
eth <- read.csv("ETH-USD.csv")

spy$Date <- as.Date(spy$Date)
qqq$Date <- as.Date(qqq$Date)
btc$Date <- as.Date(btc$Date)
eth$Date <- as.Date(eth$Date)

calculate_rolling_vol <- function(df, asset_name) {
  df <- df %>%
    arrange(Date) %>%
    mutate(Return = (Close - lag(Close)) / lag(Close) * 100,
           Volatility = zoo::rollapply(Return, width = 12, FUN = sd, fill = NA) * sqrt(12),
           Asset = asset_name)
  return(df)
}

spy_vol <- calculate_rolling_vol(spy, "SPY")
qqq_vol <- calculate_rolling_vol(qqq, "QQQ")
btc_vol <- calculate_rolling_vol(btc, "BTC")
eth_vol <- calculate_rolling_vol(eth, "ETH")

all_vol <- bind_rows(
  spy_vol %>% select(Date, Volatility, Asset),
  qqq_vol %>% select(Date, Volatility, Asset),
  btc_vol %>% select(Date, Volatility, Asset),
  eth_vol %>% select(Date, Volatility, Asset)
) %>% filter(!is.na(Volatility))

# Crisis event markers
crisis_events <- data.frame(
  Date = as.Date(c("2015-08-01", "2018-02-01", "2020-03-01", "2022-09-01")),
  Label = c("China\nCrisis", "VIX\nSpike", "COVID-19\nCrash", "Fed Rate\nHike")
)

chart1 <- ggplot(all_vol, aes(x = Date, y = Volatility, color = Asset)) +
  geom_vline(data = crisis_events, aes(xintercept = as.numeric(Date)),
             linetype = "dashed", color = "gray70", size = 0.5) +
  geom_text(data = crisis_events, aes(x = Date, y = 145, label = Label),
            inherit.aes = FALSE, size = 3.2, color = "black", vjust = 1) +
  geom_line(size = 0.8, alpha = 0.85) +
  scale_color_manual(values = c("SPY" = "#0173B2", "QQQ" = "#029E73",
                                 "BTC" = "#DE8F05", "ETH" = "#CC78BC"),
                      name = "Asset Class") +
  labs(title = "Volatility Timeline: 10-Year Comparison (2014-2024)",
       subtitle = "12-Month Rolling Annualized Volatility",
       x = "Date", y = "Volatility (%)") +
  theme_minimal() +
  theme(plot.title = element_text(size = 16, face = "bold"),
        plot.subtitle = element_text(size = 11, color = "gray50"),
        axis.title = element_text(size = 11, face = "bold"),
        panel.grid.minor = element_blank(),
        plot.background = element_rect(fill = "white", color = NA),
        panel.background = element_rect(fill = "white", color = NA))

ggsave("Chart_1_Volatility_Timeline.png", plot = chart1, width = 13, height = 7.5, dpi = 300, units = "in", bg = "white")

print("Chart saved: Chart_1_Volatility_Timeline.png")
