# Volatility Analysis: Stocks vs Tech vs Crypto (2014-2024)

A comparative analysis of risk, return, and diversification across traditional equities and cryptocurrencies, using ten years of historical price data.

## Overview

This project analyzes volatility, correlation, and risk-adjusted returns for four major assets: the S&P 500 (SPY), Nasdaq-100 (QQQ), Bitcoin (BTC), and Ethereum (ETH). It uses R (ggplot2, dplyr, tidyr) to calculate rolling annualized volatility, Sharpe ratios, maximum drawdowns, and cross-asset correlations, and visualizes the results in a series of publication-quality charts.

**Key question:** Is cryptocurrency's extra volatility actually compensated by extra return, and does adding it to a stock portfolio provide real diversification benefit?

## Key Findings

- **Crypto is 5-6x more volatile than equities.** Bitcoin's average annualized volatility (71.4%) is roughly 4.9x the S&P 500's (14.6%); Ethereum's (88.7%) is roughly 6.1x higher.
- **Higher volatility doesn't always mean better returns.** Bitcoin's risk was well compensated (Sharpe ratio 0.13, the best of the four assets), but Ethereum's was not (Sharpe ratio 0.09, the worst), despite both being "crypto."
- **Stock-crypto correlation is moderate (0.35-0.42),** compared to 0.93 between the two equity indices, suggesting a real, if bounded, diversification benefit.
- **Drawdown risk is severe for crypto.** Bitcoin and Ethereum saw maximum drawdowns of -75.6% and -90.4% respectively, versus -24.8% and -33.1% for SPY and QQQ.

## Methodology

- **Data:** Monthly historical price data from Yahoo Finance, January 2014 to December 2024 (Ethereum data begins November 2017).
- **Volatility:** Rolling 252-day standard deviation of returns, annualized.
- **Correlation:** Pearson correlation coefficient on monthly returns over the common analysis period (Nov 2017 - Dec 2024).
- **Sharpe ratio:** Annualized return divided by annualized volatility (0% risk-free rate assumed).
- **Maximum drawdown:** Largest peak-to-trough decline observed over the full period.

Full methodology and discussion of limitations are in [REPORT.md](Report.md).

## Charts

| Chart | Description |
|---|---|
| [Volatility Comparison](charts/Chart_2_Volatility_Comparison.png) | Current vs. 10-year average volatility, by asset |
| [Risk-Return Profile](charts/Chart_3_Risk_Return.png) | Volatility vs. annualized return, with Sharpe ratio = 1 reference line |
| [Correlation Matrix](charts/Chart_4_Correlation_Matrix.png) | Cross-asset correlation heatmap |
| [Maximum Drawdown](charts/Chart_5_Max_Drawdown.png) | Worst peak-to-trough decline by asset |
| [Volatility Zone Classification](charts/Chart_6_Volatility_Zones.png) | Assets mapped against Low/Moderate/High/Very High volatility bands |
| [Sharpe Ratio Comparison](charts/Chart_7_Sharpe_Ratio.png) | Risk-adjusted return by asset |

## Tools

- **R** - ggplot2, dplyr, tidyr, zoo
- **Data source** - Yahoo Finance

## Repository Structure

```
volatility-analysis/
|-- README.md
|-- REPORT.md              # Full written case study
|-- scripts/                # R scripts for each chart
|-- charts/                 # Output PNGs (300 DPI)
`-- data/                   # Raw CSV price data
```

## Author

Ananya Tyagi
