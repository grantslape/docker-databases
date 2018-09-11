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