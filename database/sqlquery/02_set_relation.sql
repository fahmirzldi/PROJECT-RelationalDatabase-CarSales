ALTER TABLE car_specification ADD CONSTRAINT rel_carspecification_seller
	FOREIGN KEY(seller_id)
	REFERENCES seller(seller_id);

ALTER TABLE bid_status ADD CONSTRAINT rel_bidstatus_carspecification
	FOREIGN KEY(product_id)
	REFERENCES car_specification(product_id);
	
ALTER TABLE bid_status ADD CONSTRAINT rel_bidstatus_buyer
	FOREIGN KEY(buyer_id)
	REFERENCES buyer(buyer_id);
	
ALTER TABLE seller ADD CONSTRAINT rel_seller_city
	FOREIGN KEY(city_id)
	REFERENCES city(city_id);
	
ALTER TABLE buyer ADD CONSTRAINT rel_buyer_city
	FOREIGN KEY(city_id)
	REFERENCES city(city_id);