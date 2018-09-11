CREATE TABLE CATALOG_SKU_2017 (
  CatalogID int not null,
  SKU int not null,
  SKU_Description char(35) not null,
  Department char(30) not null,
  CatalogPage int,
  DateOnWebSite date not null,
  PRIMARY KEY (CatalogID)
) ENGINE = INNODB;

CREATE TABLE CATALOG_SKU_2018 (
  CatalogID int not null,
  SKU int not null,
  SKU_Description char(35) not null,
  Department char(30) not null,
  CatalogPage int,
  DateOnWebSite date not null,
  PRIMARY KEY (CatalogID)
) ENGINE = INNODB;

CREATE TABLE BUYER (
  BuyerName char(35) not null,
  Department char(35) not null,
  Position char(35) not null,
  Supervisor char(35),
  PRIMARY KEY (BuyerName)
) ENGINE = INNODB;