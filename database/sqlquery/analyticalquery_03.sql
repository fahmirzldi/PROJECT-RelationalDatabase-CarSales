WITH ranked_bids AS (
  SELECT
    cs.model,
    bid.buyer_id,
    bid.date_bid,
    bid.bid_price,
    ROW_NUMBER() OVER (PARTITION BY cs.model, bid.buyer_id ORDER BY bid.date_bid) AS bid_rank
  FROM car_specification as cs
  INNER JOIN bid_status as bid ON cs.product_id = bid.product_id
)
SELECT
  model,
  buyer_id,
  MAX(CASE WHEN bid_rank = 1 THEN date_bid END) AS first_bid_date,
  MAX(CASE WHEN bid_rank = 1 THEN bid_price END) AS first_bid_price,
  MAX(CASE WHEN bid_rank = 2 THEN date_bid END) AS next_bid_date,
  MAX(CASE WHEN bid_rank = 2 THEN bid_price END) AS next_bid_price
FROM ranked_bids
WHERE bid_rank <= 2
GROUP BY model, buyer_id;
