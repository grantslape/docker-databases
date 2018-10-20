drop table if exists invoices;
drop table if exists queen_anne.customers;

create table customers (
  CustomerID int not null auto_increment,
  FirstName varchar(50) not null,
  LastName varchar(50) not null,
  Phone char(12) not null,
  PRIMARY KEY (CustomerID)
)ENGINE = INNODB;

create table invoices (
  InvoiceID int not null auto_increment,
  CustomerID int not null,
  InvoiceDate date not null,
  PRIMARY KEY (InvoiceID),
  constraint invoicesfk_1 foreign key (CustomerID) references customers(CustomerID)
)ENGINE = INNODB;

create table items (
  ItemID int not null auto_increment,
  `Name` varchar(255) not null,
  PRIMARY KEY (ItemID)
)ENGINE = INNODB;

create table invoices_items (
  InvoiceID int not null,
  InvoiceItemID int not null,
  Price decimal(15, 2) not null,
  Tax decimal(15, 2) as (0.083 * Price) not null,
  Total decimal(15, 2) as (Price + Tax) not null,
  constraint invoices_itemsfk_1 foreign key (InvoiceID) references invoices(InvoiceID),
  constraint invoices_itemsfk_2 foreign key (InvoiceItemID) references items(ItemID)
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
  (CustomerID, InvoiceDate)
VALUES
  (1, '2017-12-14'),
  (2, '2017-12-15'),
  (3, '2017-12-15'),
  (4, '2017-12-23'),
  (1, '2018-01-05'),
  (5, '2018-01-10'),
  (6, '2018-01-12'),
  (2, '2018-01-15'),
  (5, '2018-01-25');

insert into items
  (Name)
VALUES
  ('Antique Desk'),
  ('Antique Desk Chair'),
  ('Dining Table Linens'),
  ('Candles'),
  ('Desk Lamp'),
  ('Book Shelf'),
  ('Antique Chair'),
  ('Antique Candle Holders');

insert into invoices_items
  (InvoiceID, InvoiceItemID, Price)
VALUES
  (1, 1, 3000),
  (1, 2, 500),
  (2, 3, 1000),
  (3, 4, 50),
  (4, 4, 45),
  (5, 5, 250),
  (6, 3, 750),
  (7, 6, 250),
  (8, 7, 1250),
  (8, 7, 1750),
  (9, 8, 350);

select *
from queen_anne.customers;

select *
from queen_anne.invoices;

select *
from queen_anne.items;

select *
from queen_anne.invoices_items;

select
  LastName,
  FirstName,
  Phone,
  InvoiceDate,
  `Name`,
  Price,
  Tax,
  Total
from queen_anne.customers c
join queen_anne.invoices i on c.CustomerID = i.CustomerID
join invoices_items item on i.InvoiceID = item.InvoiceID
join items i2 on item.InvoiceItemID = i2.ItemID
order by InvoiceDate;