INSERT INTO morgan_importing.item
  (Description, PurchaseDate, Store, City, Quantity, LocalCurrencyAmount, ExchangeRate)
VALUES
  ('QE Dining Set', '2018-04-07', 'Eastern Treasures', 'Manila', 2, 403405, 0.01774),
  ('Willow Serving Dishes', '2018-07-15', 'Jade Antiques', 'Singapore', 75, 102, 0.5903),
  ('Large Bureau', '2018-07-17', 'Eastern Sales', 'Singapore', 8, 2000, 0.5903),
  ('Brass Lamps', '2018-07-20', 'Jade Antiques', 'Singapore', 40, 50, 0.5903);

INSERT INTO morgan_importing.shipment
  (ShipperName, ShipperInvoiceNumber, DepartureDate, ArrivalDate, InsuredValue)
VALUES
  ('ABC Trans-Oceanic', 2017651, '2017-12-10', '2018-03-15', 15000),
  ('ABC Trans-Oceanic', 2018012, '2018-01-10', '2018-03-20', 12000),
  ('Worldwide', 49100300, '2018-05-05', '2018-06-17', 20000),
  ('International', 399400, '2018-06-02', '2018-07-17', 17500),
  ('Worldwide', 84899440, '2018-07-10', '2018-07-28', 25000),
  ('International', 488955, '2018-08-05', '2018-09-11', 18000);

INSERT INTO morgan_importing.shipment_item
  (ShipmentID, ShipmentItemID, ItemID, `Value`)
VALUES
  (3, 1, 1, 15000),
  (4, 1, 4, 1200),
  (4, 2, 3, 9500),
  (4, 3, 2, 4500);