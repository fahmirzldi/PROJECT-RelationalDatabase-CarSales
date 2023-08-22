WITH avg_6_months AS (
    SELECT 
        cs.model,
        AVG(bid.bid_price) as avg_bid_6month
    FROM
        car_specification as cs
    INNER JOIN
        bid_status as bid ON cs.product_id = bid.product_id
    WHERE
        bid.date_bid >= NOW() - INTERVAL '6 months'
    GROUP BY
        cs.model
)
SELECT 
    cs.model,
    CAST(AVG(cs.price) AS INT) AS avg_price,
    CAST(AVG(avg_6months.avg_bid_6month) AS INT) AS avg_bid_6month,
    CAST(AVG(cs.price) - AVG(avg_6months.avg_bid_6month) AS INT) AS difference,
    (AVG(cs.price) - AVG(avg_6months.avg_bid_6month)) / AVG(cs.price) * 100 AS difference_percent
FROM
    car_specification as cs
LEFT JOIN
    bid_status as bid ON cs.product_id = bid.product_id
LEFT JOIN
    avg_6_months as avg_6months ON cs.model = avg_6months.model
GROUP BY
    cs.model
ORDER BY
    cs.model;
