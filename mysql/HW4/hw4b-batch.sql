/*
 * List all shipments greater than
 * $17,000 in value
 */
select *
from morgan_importing.shipment s
where InsuredValue > 17000;

/* Human readable
 * By item list of all shipment items
 */
select
  s.ShipperName,
  s.ShipmentID,
  i.Description,
  i.Quantity,
  si.Value,
  i.LocalCurrencyAmount,
  s.InsuredValue
from morgan_importing.shipment_item si
join morgan_importing.shipment s on si.ShipmentID = s.ShipmentID
join morgan_importing.item i on si.ItemID = i.ItemID;

/* All shippers who's names start with AB
 * #D from book
 */
select
  ShipmentID,
  ShipperName,
  ShipperInvoiceNumber
from morgan_importing.shipment
where ShipperName like 'ab%';

/*
 * # E from book
 * Shipments that departed in December
 */
select
  ShipmentID,
  ShipperName,
  ShipperInvoiceNumber,
  ArrivalDate
FROM morgan_importing.shipment
where month(DepartureDate) = 12;

/*
 * #F from book
 * Shipments that departed on the 10th of
 * any month
 */
select
  ShipmentID,
  ShipperName,
  ShipperInvoiceNumber,
  ArrivalDate
FROM morgan_importing.shipment
where day(DepartureDate) = 10;

/* #S from book.
 * non-Singapore orders first by shipper name asc and departure date desc
 * then Singapore sorted by value asc
 */
select
  s.ShipperName,
  s.ShipmentID,
  s.DepartureDate,
  si.Value
from morgan_importing.shipment s
left join morgan_importing.shipment_item si on s.ShipmentID = si.ShipmentID
left join morgan_importing.item i on si.ItemID = i.ItemID AND i.City = 'Singapore'
order by `Value`, ShipperName, DepartureDate desc;

/* #N from book
 * All shipments >=1000 in value
 * sorted by name asc, departure desc
 */
select
  ShipperName,
  s.ShipmentID,
  DepartureDate
from morgan_importing.shipment s
join morgan_importing.shipment_item si on s.ShipmentID = si.ShipmentID
where si.Value >= 1000
order by ShipperName, DepartureDate desc;

/* #H from book
 * Average insured value of all shipments
 */
select
  round(avg(InsuredValue), 2) average
from morgan_importing.shipment;