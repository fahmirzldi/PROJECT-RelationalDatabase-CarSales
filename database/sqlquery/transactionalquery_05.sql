WITH input_city AS (
  SELECT latitude AS input_city_latitude, longitude AS input_city_longitude
  FROM city
  WHERE city_id = 3173
)
SELECT
  cs.product_id,
  cs.brand,
  cs.model,
  cs.year,
  cs.price,
  c.latitude AS city_latitude,
  c.longitude AS city_longitude,
  SQRT(POWER(c.latitude - input_city.input_city_latitude, 2) + POWER(c.longitude - input_city.input_city_longitude, 2)) AS euclidean_distance
FROM
  car_specification AS cs
INNER JOIN seller AS sel ON cs.seller_id = sel.seller_id
INNER JOIN city AS c ON sel.city_id = c.city_id
CROSS JOIN input_city
WHERE
  sel.city_id = 3173 AND
  SQRT(POWER(c.latitude - input_city.input_city_latitude, 2) + POWER(c.longitude - input_city.input_city_longitude, 2)) = 0;
