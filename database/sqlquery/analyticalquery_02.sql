WITH avg_price AS(
	SELECT c.city_id, c.city_name, ROUND(AVG(cs.price), 0) as avg_car_city
	FROM car_specification as cs
	INNER JOIN seller as sel ON cs.seller_id = sel.seller_id
	INNER JOIN city as c ON c.city_id = sel.city_id
	GROUP BY c.city_id, c.city_name)
SELECT avg_price.city_name, cs.brand, cs.model, cs.year, cs.price, avg_price.avg_car_city
FROM car_specification as cs
INNER JOIN seller as sel ON cs.seller_id = sel.seller_id
INNER JOIN avg_price ON avg_price.city_id = sel.city_id