from faker import Faker
from tabulate import tabulate
import random
from datetime import datetime, timedelta
import csv

FAKER = Faker("id_ID")
Faker.seed(123)
random.seed(123)


def show_data(table):
    """
    Fungsi untuk menampilkan data

    arg:
        - table (dict) : data dictionary yang ingin ditampilkan

    return:
        None
    """

    tab = tabulate(
        tabular_data=table, headers=table.keys(), tablefmt="psql", numalign="center"
    )
    print(tab)


def csv_to_dict(filename):
    """
    Fungsi untuk ekstrak file csv menjadi list of dictionary

    arg:
        - filename (str) : nama file csv yang akan dibuka
    return:
        - data  (list) :  list of dictionary
    """

    # buka file csv
    with open(f"{filename}", mode="r", encoding="utf-8-sig") as file:
        csv_reader = csv.DictReader(file)

        # simpan dalam bentuk list of dictionary
        data = {}
        for row in csv_reader:
            for key, value in row.items():
                # setdefault() untuk menambahkan key ke result_dict
                # value dari key diisi dengan empty list dulu
                # empty list diisi dengan method append per baris data
                data.setdefault(key, []).append(value)

    return data


def seller_sqltable(n_data, city_table, is_print):
    table = {}
    table["seller_id"] = [i + 1 for i in range(n_data)]
    table["seller_name"] = [FAKER.name() for i in range(n_data)]
    table["city_id"] = [random.choice(city_table["city_id"]) for i in range(n_data)]

    if is_print:
        show_data(table)

    return table


def buyer_sqltable(n_data, city_table, is_print):
    table = {}
    table["buyer_id"] = [i + 1 for i in range(n_data)]
    table["buyer_name"] = [FAKER.name() for i in range(n_data)]
    table["city_id"] = [random.choice(city_table["city_id"]) for i in range(n_data)]

    if is_print:
        show_data(table)

    return table


def car_specification_sqltable(
    n_data, car_specification_raw_table, seller_table, is_print
):
    table = {}
    table["product_id"] = car_specification_raw_table["product_id"]
    table["seller_id"] = [
        random.choice(seller_table["seller_id"]) for i in range(n_data)
    ]
    table["brand"] = car_specification_raw_table["brand"]
    table["model"] = car_specification_raw_table["model"]
    table["body_type"] = car_specification_raw_table["body_type"]
    table["year"] = car_specification_raw_table["year"]
    table["price"] = car_specification_raw_table["price"]
    table["bid_allow"] = ["Allow" for i in range(n_data)]

    # definisikan awal tanggal
    start_date = datetime(2022, 1, 1)

    # definisikan akhir tanggal
    end_date = datetime(2023, 12, 31, 23, 59, 59)

    table["date_post"] = [
        FAKER.date_time_between(start_date=start_date, end_date=end_date)
        for i in range(n_data)
    ]

    if is_print:
        show_data(table)

    return table


def bid_status_sqltable(n_data, car_specification_table, buyer_table, is_print):
    table = {}
    table["bid_id"] = [i + 1 for i in range(n_data)]
    table["product_id"] = [
        random.choice(car_specification_table["product_id"]) for i in range(n_data)
    ]
    table["buyer_id"] = [random.choice(buyer_table["buyer_id"]) for i in range(n_data)]

    date_post = []
    end_date = datetime(2023, 12, 31, 23, 59, 59)
    for i in range(n_data):
        for j in range(len(car_specification_table["product_id"])):
            if car_specification_table["product_id"][j] == table["product_id"][i]:
                date_post.append(car_specification_table["date_post"][j])

    table["date_bid"] = [
        FAKER.date_time_between(start_date=start_date, end_date=end_date)
        for start_date in date_post
    ]

    price = []
    for i in range(n_data):
        for j in range(len(car_specification_table["product_id"])):
            if car_specification_table["product_id"][j] == table["product_id"][i]:
                price.append(float(car_specification_table["price"][j]))

    table["bid_price"] = [
        int(bottom_price + random.choice([0.1, 0.2, 0.3]) * bottom_price)
        for bottom_price in price
    ]

    table["bid_status"] = ["Sent" for i in range(n_data)]

    if is_print:
        show_data(table)

    return table


def save_to_csv(data, nama_file):
    """
    Fungsi untuk menyimpan data dummy ke csv

    args:
        - data (list)     : list of dictionary data yang akan dijadikan csv
        - nama_file (str) : nama untuk file csv

        return:
                - None
    """

    # Membuat file csv
    with open(file=f"{nama_file}.csv", mode="w", newline="") as csv_file:
        # Membuat writer csv
        writer = csv.writer(csv_file)

        # write header csv
        writer.writerow(list(data.keys()))

        # mengetahui panjang data
        len_data = len(list(data.items())[0][1])

        # write data ke file csv
        for i in range(len_data):
            row = []
            for key in data.keys():
                row.append(data[key][i])
            writer.writerow(row)
