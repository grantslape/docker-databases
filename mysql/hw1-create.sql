CREATE DATABASE IF NOT EXISTS sales;

USE sales;

CREATE TABLE IF NOT EXISTS RETAIL_ORDER (
  OrderNumber int not null,
  StoreNumber int not null,
  StoreZIP char(9) not null,
  OrderMonth char(12) not null,
  OrderYear int not null,
  OrderTotal decimal(15,2) not null,
  PRIMARY KEY (OrderNumber)
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS sku_data (
  SKU int not null,
  SKU_Description char(35) not null,
  Department char(30) not null,
  Buyer char(30),
  PRIMARY KEY (SKU)
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS order_item (
  OrderNumber int not null,
  SKU int not null,
  Quantity int not null,
  Price decimal(15,2) not null,
  ExtendedPrice decimal(15,2) not null,
  CONSTRAINT order_itemfk_1 FOREIGN KEY (OrderNumber) REFERENCES retail_order(OrderNumber) 
  ON DELETE CASCADE 
  ON UPDATE CASCADE,
  CONSTRAINT order_itemfk_2 FOREIGN KEY (SKU) REFERENCES  sku_data(SKU) 
  ON DELETE CASCADE
  ON UPDATE CASCADE
) ENGINE = INNODB;

