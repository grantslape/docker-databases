drop table if exists queen_anne.customers;

create table customers (
  CustomerID int not null auto_increment,
  FirstName varchar(50) not null,
  LastName varchar(50) not null,
  Phone char(12) not null,
  PRIMARY KEY (CustomerID)
)ENGINE = INNODB;

create table invoices (
  InvoiceID int not null,
  CustomerID int not null,
  InvoiceDate date not null,
  InvoiceItem varchar(255) not null,
  Price decimal(15, 2) not null,
  Tax decimal(15, 2) not null,
  Total decimal(15, 2) as (Price + Tax) not null,
  primary key (InvoiceID, InvoiceItem, Price),
  constraint invoicesfk_1 foreign key (CustomerID) references customers(CustomerID)
)ENGINE = INNODB;

insert into customers
  (FirstName, LastName, Phone)
VALUES
  ('Shire', 'Robert', '206-524-2433'),
  ('Goodyear', 'Katherine', '206-524-3544'),
  ('Bancroft', 'Chris', '425-635-9788'),
  ('Griffith', 'John', '206-524-4655'),
  ('Tierney', 'Doris', '425-635-8677'),
  ('Anderson', 'Donna', '360-538-7566');

insert into invoices
  (InvoiceID, CustomerID, InvoiceDate, InvoiceItem, Price, Tax)
VALUES
  (1, 1, '2017-12-14', 'Antique Desk', 3000, 249),
  (1, 1, '2017-12-14', 'Antique Desk Chair', 500, 41.5),
  (2, 2, '2017-12-15', 'Dining Table Linens', 1000, 83),
  (3, 3, '2017-12-15', 'Candles', 50, 4.15),
  (4, 4, '2017-12-23', 'Candles', 45, 3.74),
  (5, 1, '2018-01-05', 'Desk Lamp', 250, 20.75),
  (6, 5, '2018-01-10', 'Dining Table Linens', 750, 62.25),
  (7, 6, '2018-01-12', 'Book Shelf', 250, 20.75),
  (8, 2, '2018-01-15', 'Antique Chair', 1250, 103.75),
  (8, 2, '2018-01-15', 'Antique Chair', 1750, 145.25),
  (9, 5, '2018-01-25', 'Antique Candle Holders', 350, 29.05);

select *
from customers;

select *
from invoices;