SELECT
    cs.brand,
    cs.model,
    ROUND(AVG(cs.price) FILTER (WHERE age(NOW(), bid.date_bid) <= INTERVAL '6 months'), 0) AS last_6_months,
    ROUND(AVG(cs.price) FILTER (WHERE age(NOW(), bid.date_bid) <= INTERVAL '5 months'), 0) AS last_5_months,
    ROUND(AVG(cs.price) FILTER (WHERE age(NOW(), bid.date_bid) <= INTERVAL '4 months'), 0) AS last_4_months,
    ROUND(AVG(cs.price) FILTER (WHERE age(NOW(), bid.date_bid) <= INTERVAL '3 months'), 0) AS last_3_months,
    ROUND(AVG(cs.price) FILTER (WHERE age(NOW(), bid.date_bid) <= INTERVAL '2 months'), 0) AS last_2_months,
    ROUND(AVG(cs.price) FILTER (WHERE age(NOW(), bid.date_bid) <= INTERVAL '1 month'), 0) AS last_1_months
FROM
    car_specification as cs
INNER JOIN
    bid_status as bid ON cs.product_id = bid.product_id
WHERE
    bid.date_bid >= NOW() - INTERVAL '6 months'
GROUP BY
    cs.brand,
    cs.model
ORDER BY
    cs.brand,
    cs.model;
