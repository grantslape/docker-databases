CREATE SCHEMA sales;

SET search_path = "sales";

CREATE TABLE CATALOG_SKU_2017 (
  CatalogID int not null,
  SKU int not null,
  SKU_Description char(35) not null,
  Department char(30) not null,
  CatalogPage int,
  DateOnWebSite date not null,
  PRIMARY KEY (CatalogID)
);

CREATE TABLE CATALOG_SKU_2018 (
  CatalogID int not null,
  SKU int not null,
  SKU_Description char(35) not null,
  Department char(30) not null,
  CatalogPage int,
  DateOnWebSite date not null,
  PRIMARY KEY (CatalogID)
);

CREATE TABLE BUYER (
  BuyerName char(35) not null,
  Department char(35) not null,
  Position char(35) not null,
  Supervisor char(35),
  PRIMARY KEY (BuyerName)
);

CREATE TABLE RETAIL_ORDER (
  OrderNumber int not null,
  StoreNumber int not null,
  StoreZIP char(9) not null,
  OrderMonth char(12) not null,
  OrderYear int not null,
  OrderTotal decimal(15,2) not null,
  PRIMARY KEY (OrderNumber)
);

CREATE TABLE SKU_DATA (
  SKU int not null,
  SKU_Description char(35) not null,
  Department char(30) not null,
  Buyer char(30) not null,
  PRIMARY KEY (SKU),
  CONSTRAINT sku_datafk_1 FOREIGN KEY (Buyer) REFERENCES BUYER(BuyerName)
);

CREATE TABLE ORDER_ITEM (
  OrderNumber int not null,
  SKU int not null,
  Quantity int not null,
  Price decimal(15,2) not null,
  ExtendedPrice decimal(15,2) not null,
  PRIMARY KEY (OrderNumber, SKU),
  CONSTRAINT order_itemfk_1 FOREIGN KEY (OrderNumber) REFERENCES RETAIL_ORDER(OrderNumber)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  CONSTRAINT order_itemfk_2 FOREIGN KEY (SKU) REFERENCES  SKU_DATA(SKU)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);