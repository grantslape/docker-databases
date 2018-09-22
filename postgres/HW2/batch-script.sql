/*
 * CREATE
 */
DROP SCHEMA IF EXISTS sales CASCADE;

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

/*
 * INSERT
 */

INSERT INTO CATALOG_SKU_2017
    (CatalogID, SKU, SKU_Description, Department, CatalogPage, DateOnWebSite)
VALUES (20170001, 100100, 'Std. Scuba Tank, Yellow', 'Water Sports', 23, '2017-01-01'),
       (20170002, 100300, 'Std. Scuba Tank, Light Blue', 'Water Sports', 23, '2017-01-01'),
       (20170003, 100400, 'Std. SCuba Tank, Dark Blue', 'Water Sports', null, '2017-08-01'),
       (20170004, 101100, 'Dive Mask, Small Clear', 'Water Sports', 26, '2017-01-01'),
       (20170005, 101200, 'Dive Mask, Med Clear', 'Water Sports', 26, '2017-01-01'),
       (20170006, 201000, 'Half-dome Tent', 'Camping', 46, '2014-01-01'),
       (20170007, 202000, 'Half-dome Tent Vestibule', 'Camping', 46, '2017-01-01'),
       (20170008, 301000, 'Light Fly Climbing Harness', 'Climbing', 77, '2017-01-01'),
       (20170009, 302000, 'Locking Carabiner, Oval', 'Climbing', 79, '2017-01-01');

INSERT INTO CATALOG_SKU_2018
    (CatalogID, SKU, SKU_Description, Department, CatalogPage, DateOnWebSite)
VALUES (20180001, 100100, 'Std. Scuba Tank, Yellow', 'Water Sports', 23, '2018-01-01'),
       (20180002, 100200, 'Std. Scuba Tank, Magenta', 'Water Sports', 23, '2018-01-01'),
       (20180003, 101100, 'Dive Mask, Small Clear', 'Water Sports', 27, '2018-08-01'),
       (20180004, 101200, 'Dive Mask, Med Clear', 'Water Sports', 27, '2018-01-01'),
       (20180005, 201000, 'Half-dome Tent', 'Camping', 45, '2018-01-01'),
       (20180006, 202000, 'Half-dome Tent Vestibule', 'Camping', 45, '2018-01-01'),
       (20180007, 203000, 'Half-dome Test Vestibule - Wide', 'Camping', null, '2018-04-01'),
       (20180008, 301000, 'Light Fly Climbing Harness', 'Climbing', 76, '2018-01-01'),
       (20180009, 302000, 'Locking Carabiner, Oval', 'Climbing', 78, '2018-01-01');

INSERT INTO BUYER
    (BuyerName, Department, Position, Supervisor)
VALUES ('Cindy Lo', 'Purchasing', 'Buyer 2', 'Mary Smith'),
       ('Jerry Martin', 'Purchasing', 'Buyer 1', 'Cindy Lo'),
       ('Mary Smith', 'Purchasing', 'Manager', null),
       ('Nancy Meyers', 'Purchasing', 'Buyer 1', 'Pete Hansen'),
       ('Pete Hansen', 'Purchasing', 'Buyer 3', 'Mary Smith');

INSERT INTO RETAIL_ORDER
       (OrderNumber, StoreNumber, StoreZIP, OrderMonth, OrderYear, OrderTotal)
VALUES (1000, 10, '98110', 'December', 2012, 445.00),
       (2000, 20, '02335', 'December', 2012, 310.00),
       (3000, 10, '98110', 'January', 2013, 480.00);

INSERT INTO SKU_DATA
       (SKU, SKU_Description, Department, Buyer)
VALUES (100100, 'Std. Scuba Tank, Yellow', 'Water Sports', 'Pete Hansen'),
       (100200, 'Std. Scuba Tank, Magenta', 'Water Sports', 'Pete Hansen'),
       (101100, 'Dive Mask, Small Clear', 'Water Sports', 'Nancy Meyers'),
       (101200, 'Dive Mask, Med Clear', 'Water Sports', 'Nancy Meyers'),
       (201000, 'Half-dome Tent', 'Camping', 'Cindy Lo'),
       (202000, 'Half-dome Tent Vestibule', 'Camping', 'Cindy Lo'),
       (301000, 'Light Fly Climbing Harness', 'Climbing', 'Jerry Martin'),
       (302000, 'Locking Carabiner, Oval', 'Climbing', 'Jerry Martin');

INSERT INTO ORDER_ITEM
    (OrderNumber, SKU, Quantity, Price, ExtendedPrice)
 VALUES (1000, 201000, 1, 300.00, 300.00),
        (1000, 202000, 1, 130.00, 130.00),
        (2000, 101100, 4, 50.00, 200.00),
        (2000, 101200, 2, 50.00, 100.00),
        (3000, 100200, 1, 300.00, 300.00),
        (3000, 101100, 2, 50.00, 100.00),
        (3000, 101200, 1, 50.00, 50.00);

/* GROUPING
 * number of 2018 skus by department
 * ordered highest to lowest
 */
SELECT Department,
       COUNT(*) "Number of SKUs"
FROM catalog_sku_2018
GROUP BY Department
ORDER BY COUNT(*) DESC;

/* GROUPING
 * Number of direct reports
 * by Supervisor
 */
SELECT Supervisor,
       count(*) "reports"
FROM buyer
WHERE Supervisor is not null
GROUP BY Supervisor
ORDER BY count(*) desc;

/* SUBQUERY
 * Maximum total price item for each order
 * and corresponding portion of order total
 */
SELECT ro.OrderNumber,
       s.max,
       ro.OrderTotal,
       round(s.max / ro.OrderTotal, 2) "ratio"
FROM retail_order ro
JOIN (SELECT OrderNumber,
             max(ExtendedPrice) "max"
      FROM order_item
      GROUP BY OrderNumber
     ) s ON ro.OrderNumber = s.OrderNumber
ORDER BY max DESC;

/* SUBQUERY
 * Get SKU and item totals for each order
 * over $400 in value.
 */
SELECT a.OrderNumber,
       SKU,
       ExtendedPrice
FROM (SELECT OrderNumber
      FROM retail_order
      WHERE OrderTotal > 400) a
JOIN order_item oi ON a.OrderNumber = oi.OrderNumber
ORDER BY ExtendedPrice DESC,
         a.OrderNumber ASC;

/* CROSS JOIN
 * I don't know if cross joins
 * are useful with this dataset
 */
SELECT BuyerName,
       s.*
FROM sku_data s
CROSS JOIN buyer b;

/* IMPLICIT JOIN
 * highest selling sku by
 * individual order
 */
SELECT OrderNumber,
       s.SKU,
       quantity
FROM order_item o, sku_data s
WHERE o.sku = s.sku
ORDER BY quantity DESC;



/* EXPLICIT JOIN
 * SKU items by buyer with their 2018 and 2017
 * catalog pages and web posting dates
 */
SELECT b.BuyerName,
       sd.SKU,
       sd.SKU_DESCRIPTION,
       c.CatalogPage "2018 Catalog Page",
       o.CatalogPage "2017 Catalog Page",
       c.DateOnWebSite "2018 Web date",
       o.DateOnWebSite "2017 Web date"
FROM buyer b
JOIN sku_data sd on b.BuyerName = sd.Buyer
LEFT JOIN catalog_sku_2018 c ON sd.SKU = c.SKU
LEFT JOIN catalog_sku_2017 o ON sd.SKU = o.SKU
ORDER BY BuyerName, "2018 Web date", "2018 Catalog Page";

/* EXPLICIT JOIN
 * Pages that produce most sales
 * in the 2018 catalog
 */
SELECT CatalogPage,
       max(ExtendedPrice) "total sales"
FROM catalog_sku_2018 c
JOIN order_item o ON c.SKU = o.SKU
GROUP BY CatalogPage
ORDER BY "total sales";