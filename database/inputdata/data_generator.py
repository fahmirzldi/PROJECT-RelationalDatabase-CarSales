from faker import Faker
from tabulate import tabulate
import random
from datetime import datetime, timedelta
import csv
from function import *

FAKER = Faker("id_ID")
Faker.seed(123)
random.seed(123)

car_specification_raw = csv_to_dict("data/car_specification.csv")
type(car_specification_raw["price"][1])

city = csv_to_dict("data/city.csv")

seller = seller_sqltable(n_data=50, city_table=city, is_print=True)

buyer = buyer_sqltable(n_data=50, city_table=city, is_print=True)

car_specification = car_specification_sqltable(
    n_data=len(car_specification_raw["product_id"]),
    car_specification_raw_table=car_specification_raw,
    seller_table=seller,
    is_print=True,
)

bid_status = bid_status_sqltable(
    n_data=50,
    car_specification_table=car_specification,
    buyer_table=buyer,
    is_print=True,
)

save_to_csv(data=city, nama_file="data/sqlupload/city")

save_to_csv(data=seller, nama_file="data/sqlupload/seller")

save_to_csv(data=buyer, nama_file="data/sqlupload/buyer")

save_to_csv(data=car_specification, nama_file="data/sqlupload/car_specification")

save_to_csv(data=bid_status, nama_file="data/sqlupload/bid_status")
