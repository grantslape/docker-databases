use sales;
/*
 * WHERE EQUALS
 * Get all 2017 catalog items that went live
 * on the website on 2017-01-01
 */
SELECT *
FROM CATALOG_SKU_2017
WHERE DateOnWebSite = '2017-01-01';

/*
 * WHERE NOT EQUALS
 * Get all order items that have been sold
 * in a quantity other than 1
 */
SELECT *
FROM ORDER_ITEM
WHERE Quantity != 1;

/*
 * ORDER BY
 * Get all orders sorted by OrderTotal descending
 */
SELECT *
FROM RETAIL_ORDER
ORDER BY OrderTotal DESC;

/*
 * ORDER BY TWO COLUMNS
 * Get all 2018 catalog items, sorted by
 * live date on website, then catalog page
 */
SELECT *
FROM CATALOG_SKU_2018
ORDER BY DateOnWebSite ASC, CatalogPage ASC;

/*
 * GROUPING
 * All order totals summed by zip code.
 */
SELECT StoreZIP,
       sum(OrderTotal) AS "order_total"
FROM RETAIL_ORDER
GROUP BY StoreZIP;

/*
 * GROUP HAVING
 * See total sales by OrderNumber
 * Only for Orders greater than $400 in value
 */
SELECT OrderNumber,
       sum(ExtendedPrice) AS "total_sales"
FROM ORDER_ITEM
GROUP BY OrderNumber
HAVING total_sales > 400;

/*
 * TWO TABLES
 * Get SKU and description for Water Sports
 * items that are included in the 2018 Catalog
 */
SELECT sku.SKU,
       sku.SKU_Description,
       sku.Department,
       cat.CatalogPage,
       cat.DateOnWebSite
FROM CATALOG_SKU_2018 cat
INNER JOIN SKU_DATA sku ON cat.SKU = sku.SKU
WHERE cat.Department = 'Water Sports';

/*
 * TWO TABLES BY GROUPING
 * Get all SKUs sold by each buyer in one column
 */
SELECT b.BuyerName,
       GROUP_CONCAT(s.SKU_Description SEPARATOR '; ') AS "item_list"
FROM SKU_DATA s
INNER JOIN BUYER b ON s.Buyer = b.BuyerName
GROUP BY b.BuyerName;