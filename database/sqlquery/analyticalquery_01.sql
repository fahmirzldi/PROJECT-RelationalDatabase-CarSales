WITH model_bid AS(
	SELECT cs.model, count(bid.bid_id) as count_bid
	FROM bid_status as bid
	INNER JOIN car_specification AS cs ON cs.product_id = bid.product_id
	GROUP BY cs.model)
SELECT cs.model, count(cs.product_id) as count_product, model_bid.count_bid
FROM car_specification as cs
INNER JOIN model_bid ON cs.model = model_bid.model
GROUP BY cs.model, model_bid.count_bid
ORDER BY count_product, count_bid DESC;