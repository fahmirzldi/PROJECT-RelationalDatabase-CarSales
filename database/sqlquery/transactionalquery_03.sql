SELECT sel.seller_name, cs.product_id, cs.brand, cs.model, cs.year, cs.price, cs.date_post
FROM car_specification as cs
INNER JOIN seller as sel ON cs.seller_id = sel.seller_id
WHERE sel.seller_name = 'Embuh Irawan';