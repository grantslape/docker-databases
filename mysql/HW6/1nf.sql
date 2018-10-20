drop schema if exists queen_anne;

create schema queen_anne;

use queen_anne;

create table customers (
  CustomerID int not null,
  FirstName varchar(50) not null,
  LastName varchar(50) not null,
  Phone char(12) not null,
  InvoiceID int not null,
  InvoiceDate date not null,
  InvoiceItem varchar(255) not null,
  Price decimal(15, 2) not null,
  Tax decimal(15, 2) not null,
  Total decimal(15, 2) as (Price + Tax) not null,
  primary key (CustomerID, InvoiceID, InvoiceItem, Price)
)ENGINE = INNODB;

insert into customers
(CustomerID, LastName, FirstName, Phone, InvoiceID, InvoiceDate, InvoiceItem, Price, Tax)
VALUES
  (1, 'Shire', 'Robert', '206-524-2433', 1, '2017-12-14', 'Antique Desk', 3000, 249),
  (1, 'Shire', 'Robert', '206-524-2433', 1, '2017-12-14', 'Antique Desk Chair', 500, 41.5),
  (2, 'Goodyear', 'Katherine', '206-524-3544', 2, '2017-12-15', 'Dining Table Linens', 1000, 83),
  (3, 'Bancroft', 'Chris', '425-635-9788', 3, '2017-12-15', 'Candles', 50, 4.15),
  (4, 'Griffith', 'John', '206-524-4655', 4, '2017-12-23', 'Candles', 45, 3.74),
  (1, 'Shire', 'Robert', '206-524-2433', 5, '2018-01-05', 'Desk Lamp', 250, 20.75),
  (5, 'Tierney', 'Doris', '425-635-8677', 6, '2018-01-10', 'Dining Table Linens', 750, 62.25),
  (6, 'Anderson', 'Donna', '360-538-7566', 7, '2018-01-12', 'Book Shelf', 250, 20.75),
  (2, 'Goodyear', 'Katherine', '206-524-3544', 8, '2018-01-15', 'Antique Chair', 1250, 103.75),
  (2, 'Goodyear', 'Katherine', '206-524-3544', 8, '2018-01-15', 'Antique Chair', 1750, 145.25),
  (5, 'Tierney', 'Doris', '425-635-8677', 9, '2018-01-25', 'Antique Candle Holders', 350, 29.05);

select *
from queen_anne.customers
order by InvoiceDate;