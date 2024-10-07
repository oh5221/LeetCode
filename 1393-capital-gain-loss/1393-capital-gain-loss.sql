WITH SELL AS (
    SELECT stock_name, operation,
        SUM(price) as sell_price
    FROM Stocks
    WHERE operation = 'Sell'
    GROUP BY stock_name
),
BUY AS (
    SELECT stock_name, operation,
        SUM(price) as buy_price
    FROM Stocks
    WHERE operation = 'Buy'
    GROUP BY stock_name
)

SELECT S.stock_name, (sell_price - buy_price) AS capital_gain_loss
FROM SELL S, BUY B
WHERE S.stock_name = B.stock_name