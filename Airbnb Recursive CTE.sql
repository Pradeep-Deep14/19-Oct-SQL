--Airbnb
create table If Not Exists Customers (customer_id int, customer_name varchar(20));
insert into Customers (customer_id, customer_name) values ('1', 'Alice');
insert into Customers (customer_id, customer_name) values ('4', 'Bob');
insert into Customers (customer_id, customer_name) values ('5', 'Charlie');


SELECT * FROM CUSTOMERS


-- Write an SQL query to find the missing customer IDs. 
-- The missing IDs are ones that are not in the 
-- Customers table but are in the range between 1
-- and the maximum customer_id present in the table.

-- Notice that the maximum customer_id will not exceed 100.


WITH RECURSIVE NUMBERS AS
(
SELECT 1 AS ID
UNION ALL
SELECT ID+1
FROM NUMBERS
WHERE ID < 100
	AND
	ID <(SELECT MAX(CUSTOMER_ID) FROM CUSTOMERS)
)
SELECT ID FROM NUMBERS
WHERE ID NOT IN (SELECT CUSTOMER_ID FROM CUSTOMERS)
