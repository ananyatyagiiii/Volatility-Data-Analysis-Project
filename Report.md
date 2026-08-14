# Volatility Analysis: Stocks vs Tech vs Crypto (2014-2024)

## A Case Study in Risk, Return, and Portfolio Diversification

---

## Executive Summary

This case study examines volatility, correlation, and risk-adjusted returns across four major assets over a ten-year period (2014-2024): the S&P 500 (SPY), Nasdaq-100 (QQQ), Bitcoin (BTC), and Ethereum (ETH). Using historical price data from Yahoo Finance, rolling annualized volatility was calculated for each asset in R, alongside correlation coefficients, Sharpe ratios, and maximum drawdowns.

The analysis finds that cryptocurrencies are 5-6 times more volatile than traditional equities, but that this added risk is not always compensated by proportionally higher returns. It also finds that despite high individual volatility, crypto assets carry only moderate correlation with stocks (0.38-0.42), suggesting a modest diversification benefit when allocated carefully within a broader portfolio.

| Asset | Current Volatility | Average Volatility | Annual Return | Sharpe Ratio | Max Drawdown |
|-------|--------------------|--------------------|-----------|--------------|--------------|
| S&P 500 (SPY) | 10.72% | 14.55% | 11.43% | 0.10 | -24.80% |
| Nasdaq-100 (QQQ) | 11.67% | 17.77% | 17.56% | 0.12 | -33.07% |
| Bitcoin (BTC) | 61.52% | 71.44% | 70.06% | 0.13 | -75.59% |
| Ethereum (ETH) | 79.45% | 88.67% | 32.35% | 0.09 | -90.43% |

---

## 1. Introduction & Research Questions

Investors increasingly weigh whether to include cryptocurrency alongside traditional equities in a portfolio. This case study set out to answer five questions:

1. How does volatility differ across asset classes?
2. Do volatility patterns change during periods of market stress?
3. How correlated are these asset classes with one another?
4. What is the relationship between risk (volatility) and return?
5. What are the practical implications for portfolio construction?

---

## 2. Data & Methodology

**Data source:** Yahoo Finance historical price data, January 2014 through December 2024.

**Assets analyzed:**
- S&P 500 (SPY) - 132 months
- Nasdaq-100 (QQQ) - 132 months
- Bitcoin (BTC-USD) - 124 months (data begins September 2014)
- Ethereum (ETH-USD) - 86 months (data begins November 2017)

**Volatility calculation:**
1. Monthly returns were calculated as the percentage change in closing price from one period to the next: `Return = (Close[t] - Close[t-1]) / Close[t-1]`
2. A rolling 12-month (252 trading day equivalent) standard deviation of returns was computed for each asset.
3. This was annualized by multiplying by the square root of 12, converting monthly standard deviation into a comparable annual percentage.
4. "Current" volatility reflects the most recent rolling window in the dataset (as of December 2024, the end of the analysis period); "Average" volatility reflects the mean of the entire rolling series across the full ten years.

**Other metrics:**
- **Correlation** was calculated using Pearson's correlation coefficient on monthly returns, over the common period where all four assets have data (November 2017 - December 2024).
- **Sharpe ratio** was calculated as annualized return divided by annualized volatility, assuming a 0% risk-free rate (a conservative simplification).
- **Maximum drawdown** was calculated as the largest peak-to-trough percentage decline observed at any point in the ten-year period.

**Tools:** All calculations and visualizations were built in R, using `ggplot2` for charting, `dplyr` and `tidyr` for data manipulation, and `zoo` for rolling-window calculations.

**Assumptions and limitations:**
- Risk-free rate assumed at 0% for Sharpe ratio calculations (a conservative choice that slightly understates all Sharpe ratios).
- Trading costs, taxes, and slippage are not modeled.
- Ethereum's shorter data history (7 years vs. 10-11 years for other assets) means its statistics reflect a somewhat different set of market conditions than SPY, QQQ, or BTC.
- This is a historical analysis, not a predictive model. Past volatility and returns do not guarantee future performance.

---

## 3. Findings

### 3.1 Volatility has fluctuated substantially over the decade, with crypto consistently far above equities

![Volatility Timeline](charts/Chart_1_Volatility_Timeline.png)

The rolling volatility timeline shows how each asset's risk level evolved from 2014 through 2024. Several patterns stand out: Bitcoin and Ethereum spend virtually the entire period well above SPY and QQQ, and all four assets show visible volatility spikes clustered around the same market stress events, including the 2015 China currency devaluation, the 2018 VIX spike, the 2020 COVID-19 crash, and the 2022 Federal Reserve rate hikes. Ethereum in particular shows extreme spikes shortly after its 2017 data begins, exceeding 140% annualized volatility during the initial crypto boom, before gradually moderating (with occasional relapses) through 2024.

### 3.2 Crypto volatility is substantially higher than equity volatility

![Volatility Comparison](charts/Chart_2_Volatility_Comparison.png)

Averaged across the full ten-year period, Bitcoin's annualized volatility (71.44%) is roughly 4.9 times that of the S&P 500 (14.55%), and Ethereum's (88.67%) is roughly 6.1 times higher. Even the more growth-oriented Nasdaq-100 (17.77%) remains far closer to the S&P 500 than to either cryptocurrency.

### 3.3 Higher volatility does not translate proportionally into higher returns

![Risk-Return Profile](charts/Chart_3_Risk_Return.png)

Comparing volatility to annualized return reveals an inconsistent relationship:

- **Bitcoin:** 74.77% volatility produced 70.06% annualized return, a near 1:1 ratio, suggesting the market has broadly compensated Bitcoin holders for the risk taken.
- **Ethereum:** 98.74% volatility produced only 32.35% annualized return, meaning Ethereum carried the highest risk of any asset in the study but delivered the weakest risk-adjusted outcome.
- **Nasdaq-100:** 18.02% volatility produced 17.56% return, a reasonably efficient trade-off.
- **S&P 500:** 14.94% volatility produced 11.43% return, the most conservative profile in the set.

The dashed reference line in the chart (where return equals volatility) makes this visible directly: Bitcoin sits close to the line, while Ethereum sits well below it.

### 3.4 Stock-crypto correlation is moderate, suggesting a partial diversification benefit

![Correlation Matrix](charts/Chart_4_Correlation_Matrix.png)

| | SPY | QQQ | BTC | ETH |
|---|-----|-----|-----|-----|
| **SPY** | 1.000 | 0.925 | 0.381 | 0.416 |
| **QQQ** | 0.925 | 1.000 | 0.349 | 0.409 |
| **BTC** | 0.381 | 0.349 | 1.000 | 0.740 |
| **ETH** | 0.416 | 0.409 | 0.740 | 1.000 |

Three patterns stand out:

- **SPY and QQQ move almost in lockstep** (0.925 correlation), so holding both provides limited diversification benefit relative to holding either alone.
- **BTC and ETH are moderately-to-highly correlated with each other** (0.740), tending to rise and fall together, though not perfectly.
- **Stocks and crypto show only moderate correlation** (0.35-0.42), the range in which diversification theory suggests genuine benefit: the two asset classes do not move in lockstep, so combining them can smooth portfolio-level volatility even though each individual crypto asset is highly volatile on its own.

It is worth noting that correlations between asset classes are not static; historically, correlations between risk assets (including crypto) have tended to rise during periods of acute market stress (such as 2020 and 2022), somewhat reducing the diversification benefit exactly when it would be most valuable.

### 3.5 Maximum drawdowns reveal the tail-risk difference between asset classes

![Maximum Drawdown](charts/Chart_5_Max_Drawdown.png)

| Asset | Maximum Drawdown |
|-------|-------------------|
| S&P 500 | -24.80% |
| Nasdaq-100 | -33.07% |
| Bitcoin | -75.59% |
| Ethereum | -90.43% |

Beyond typical volatility, the worst-case historical outcome for each asset differs enormously. An investor in Ethereum who bought at its historical peak would, at the lowest point, have seen over 90% of their position's value erased. Equity indices, by contrast, have historically drawn down by 25-33% at their worst points in this sample. This is a critical consideration for position sizing: even a modest portfolio allocation to a highly volatile asset can produce an outsized effect on total portfolio value during a severe drawdown.

### 3.6 Mapping current and average volatility against defined risk zones

![Volatility Zone Classification](charts/Chart_6_Volatility_Zones.png)

Using the volatility bands defined in the methodology (Low: 0-15%, Moderate: 15-30%, High: 30-60%, Very High: 60%+), SPY and QQQ fall within the Low to Moderate zones across both their current and average readings. BTC and ETH, by contrast, sit solidly within the Very High zone in both current and average terms, though both show a modest decline in current volatility relative to their ten-year average, suggesting some recent stabilization relative to their historical norm.

### 3.7 Risk-adjusted returns (Sharpe ratio) tell a more nuanced story than raw volatility alone

![Sharpe Ratio Comparison](charts/Chart_7_Sharpe_Ratio.png)

| Asset | Sharpe Ratio | Interpretation |
|-------|--------------|-----------------|
| Bitcoin | 0.13 | Best risk-adjusted return in the set |
| Nasdaq-100 | 0.12 | Second-best; efficient growth exposure |
| S&P 500 | 0.10 | Reliable, lower-risk baseline |
| Ethereum | 0.09 | Weakest risk-adjusted return, despite high absolute volatility |

This is a notable finding: Bitcoin, despite being the second-most volatile asset in the study, produced the best return per unit of risk taken, outperforming both equity indices on a risk-adjusted basis over this period. Ethereum, despite also being a well-known cryptocurrency, produced the worst risk-adjusted return of the four assets, underscoring that "crypto" is not a monolithic risk category; individual assets within it can behave very differently.

---

## 4. Discussion

Taken together, these findings suggest a few practical conclusions for portfolio construction, offered here as observations from the data rather than personalized financial advice:

**Volatility alone is an incomplete risk measure.** Bitcoin's strong Sharpe ratio despite high volatility, contrasted with Ethereum's weak Sharpe ratio despite similarly high volatility, illustrates that raw volatility figures should not be used in isolation to judge whether an asset is "worth" the risk. Risk-adjusted metrics like the Sharpe ratio, and worst-case metrics like maximum drawdown, add necessary context.

**Diversification benefits exist but are bounded.** The moderate correlation between crypto and equities (0.35-0.42) supports the idea that a modest crypto allocation could reduce overall portfolio volatility on a diversification basis, distinct from any view on crypto's expected return. However, because correlations tend to rise during crises, this benefit should not be assumed to hold during the exact periods an investor might need it most.

**Position sizing matters more for high-drawdown assets.** Given that Bitcoin and Ethereum have both experienced drawdowns exceeding 75% historically, even investors who are optimistic about crypto's long-term prospects have reason to size positions conservatively relative to the rest of a portfolio, simply to limit the impact of a severe, multi-year drawdown period.

---

## 5. Limitations

- **Sample period bias:** Ten years (or seven, for Ethereum) is a limited window in financial history and includes some unusually strong bull markets for both equities and crypto (2014-2021, and the 2023-2024 recovery). Results may not generalize to future periods or to different starting points within the sample.
- **Survivorship consideration:** Bitcoin and Ethereum are, by 2024, the two largest and most established cryptocurrencies. Their historical performance is not representative of the broader universe of cryptocurrencies, many of which have failed entirely over the same period.
- **Zero risk-free rate assumption:** Using a 0% risk-free rate for Sharpe ratio calculations is a simplification; actual risk-free rates varied meaningfully over this period (from near-zero in 2014-2021 to 4-5% in 2023-2024), which would somewhat lower all Sharpe ratios if a realistic, time-varying rate were used instead.
- **No transaction costs or taxes:** Real-world returns would be reduced by trading costs, spreads, and tax obligations, which are not modeled here.
- **Historical, not predictive:** Nothing in this analysis should be read as a forecast of future volatility, correlation, or returns. Market structure, regulation, and adoption patterns for cryptocurrency in particular have changed substantially even within the sample period and may continue to change.

---

## 6. Conclusion

Over the 2014-2024 period, cryptocurrencies exhibited volatility roughly five to six times greater than traditional equity indices, and drawdowns three to four times more severe. Despite this, Bitcoin's risk-adjusted return (Sharpe ratio of 0.13) modestly exceeded both the S&P 500 (0.10) and Nasdaq-100 (0.12), while Ethereum's (0.09) fell short of all three. The moderate correlation between crypto and equities (0.35-0.42) indicates a genuine, if bounded, diversification benefit, one that should be weighed against the substantial tail risk each of these assets carries individually. These findings underscore that volatility, return, and correlation each capture a different dimension of risk, and that a complete assessment of any asset requires looking at all three together rather than any one in isolation.

---

*This analysis was conducted independently using R and public Yahoo Finance data. It does not constitute financial advice.*
