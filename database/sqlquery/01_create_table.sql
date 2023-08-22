	CREATE TABLE IF NOT EXISTS car_specification (
		product_id SERIAL PRIMARY KEY,
		seller_id INT NOT NULL,
		brand VARCHAR NOT NULL,
		model VARCHAR NOT NULL,
		body_type VARCHAR NOT NULL,
		year INT NOT NULL,
		price NUMERIC NOT NULL CHECK (price > 0),
		bid_allow VARCHAR NOT NULL CHECK (bid_allow in ('Allow', 'Not Allow')),
		date_post DATE NOT NULL
	);
	CREATE TABLE IF NOT EXISTS bid_status (
		bid_id SERIAL PRIMARY KEY,
		product_id INT NOT NULL,
		buyer_id INT NOT NULL,
		date_bid DATE NOT NULL,
		bid_price NUMERIC NOT NULL CHECK (bid_price > 0),
		bid_status VARCHAR NOT NULL
	);
	CREATE TABLE IF NOT EXISTS seller (
		seller_id SERIAL PRIMARY KEY,
		seller_name VARCHAR NOT NULL,
		city_id INT NOT NULL
	);
	CREATE TABLE IF NOT EXISTS city (
		city_id SERIAL PRIMARY KEY,
		city_name VARCHAR NOT NULL UNIQUE,
		latitude NUMERIC NOT NULL,
		longitude NUMERIC NOT NULL
	);
	CREATE TABLE IF NOT EXISTS buyer (
		buyer_id SERIAL PRIMARY KEY,
		buyer_name VARCHAR NOT NULL,
		city_id INT NOT NULL
	);
