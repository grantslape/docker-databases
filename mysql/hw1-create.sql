CREATE DATABASE IF NOT EXISTS sales;

CREATE TABLE IF NOT EXISTS retail_order (
  order_number int not null,
  store_number int not null,
  store_zip char(9) not null,
  order_month char(12) not null,
  order_year int not null,
  order_total decimal(15,2) not null,
  PRIMARY KEY (order_number)
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS sku_data (
  sku int not null,
  sku_description char(35) not null,
  department char(30) not null,
  buyer char(30),
  PRIMARY KEY (sku)
) ENGINE = INNODB;

  CREATE TABLE IF NOT EXISTS order_item (
    order_number int not null,
    sku int not null,
    quantity int not null,
    price decimal(15,2) not null,
    extended_price decimal(15,2) not null,
    CONSTRAINT order_itemfk_1 FOREIGN KEY (order_number) REFERENCES retail_order(order_number) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT order_itemfk_2 FOREIGN KEY (sku) REFERENCES  sku_data(sku) ON DELETE CASCADE ON UPDATE CASCADE
  ) ENGINE = INNODB;
