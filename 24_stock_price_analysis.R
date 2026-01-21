#Closing prices of the stock
closing_prices <- c(120, 122, 118, 121, 119, 117, 123, 125, 126, 124, 128, 130, 129, 131, 135, 134, 136, 137, 140, 138, 139, 141, 142, 144, 143, 145, 146, 148, 147, 149)
#Calculating daily returns in percentage
daily_returns <- diff(closing_prices) / head(closing_prices, -1) * 100
#Finding highest and lowest daily returns
highest_return <- max(daily_returns)
lowest_return <- min(daily_returns)
#Calculating cumulative return over the month
cumulative_return <- (tail(closing_prices, 1) - head(closing_prices, 1)) / head(closing_prices, 1) * 100
#Displaying the results
cat("Daily returns (%):", daily_returns, "\n")
cat("Highest daily return (%):", highest_return, "\n")
cat("Lowest daily return (%):", lowest_return, "\n")
cat("Cumulative return over the month (%):", cumulative_return, "\n")