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