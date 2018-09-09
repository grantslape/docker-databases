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