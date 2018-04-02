#1 UPDATE
UPDATE items
SET price = 14000000
WHERE SKU = 'AROG-001';

#2 Find all users who have never logged in. 
SELECT username, last_login
FROM users
WHERE last_login IS NULL;

#3 Find all items that contains "mac".
SELECT *
FROM items
WHERE name LIKE '%mac%';

#4 Count all paid orders with SKU IPHX-001.
SELECT COUNT(total)
FROM orders
WHERE item LIKE '%IPHX-001%';

#5 Find lowest price of all items.
SELECT MIN(price) AS Lowestprice
FROM items

#6 Find highest price of all items.
SELECT MAX(price) AS Higestprice
FROM items

#7 Find average price of all items.
SELECT AVG(price) AS Avgprice
FROM items

#8 Find all orders made in February 2018.
SELECT *
FROM orders
WHERE created_at LIKE '%2018-02%'

#9 Find all orders made between 1st March to 15th March.
SELECT *
FROM orders
WHERE created_at BETWEEN '2018-03-01' AND '2018-03-15'
ORDER BY created_at;

#10 Find all items was sold in February 2018.
SELECT *
FROM orders
WHERE status = 'paid' AND created_at LIKE '%2018-02%';

#11 Find all paid orders in March 2018.
SELECT *
FROM orders
WHERE status = 'paid' AND created_at LIKE '%2018-03%';

#12 Sum all total orders, with status canceled – made by user with ID 1.
SELECT user_id, SUM(total)
FROM orders
WHERE status = 'canceled' AND user_id = 1;

#13 Sum all total orders, with status paid – made by user with ID 3.
SELECT user_id, SUM(total)
FROM orders
WHERE status = 'paid' AND user_id = 3;

#14 Find all paid orders with courier ID 2 made by user ID 1.
SELECT courier_id, SUM(total)
FROM orders
WHERE status = 'paid' AND courier_id = 2 AND user_id = 1;

#15 Find all orders that contains SKU IPHX-001.
SELECT *
FROM orders
WHERE item LIKE '%IPHX-001%'