DROP SCHEMA IF EXISTS morgan_importing;

CREATE SCHEMA morgan_importing;

use morgan_importing;

CREATE TABLE item (
  ItemID int not null AUTO_INCREMENT,
  Description varchar(255) not null,
  PurchaseDate date not null,
  Store char(50) not null,
  City char(35) not null,
  Quantity int not null,
  LocalCurrencyAmount decimal(18,2) not null,
  ExchangeRate decimal(12,6) not null,
  PRIMARY KEY (ItemID)
)ENGINE = INNODB;

CREATE TABLE shipment (
  ShipmentID int not null AUTO_INCREMENT,
  ShipperName char(35) not null,
  ShipperInvoiceNumber int not null,
  DepartureDate date,
  ArrivalDate date,
  InsuredValue decimal(12,2),
  PRIMARY KEY (ShipmentID)
)ENGINE = INNODB;

CREATE TABLE shipment_item (
  ShipmentID int not null,
  ShipmentItemID int not null,
  ItemID int not null,
  `Value` decimal(12,2) not null,
  PRIMARY KEY (ShipmentID, ShipmentItemID),
  CONSTRAINT shipment_itemfk_1 FOREIGN KEY (ShipmentID) REFERENCES shipment(ShipmentID)
  ON UPDATE CASCADE,
  CONSTRAINT shipment_itemfk_2 FOREIGN KEY (ItemID) REFERENCES item(ItemID)
  ON UPDATE CASCADE
  ON DELETE CASCADE
)ENGINE = INNODB;