select * from customers;
select * from orders;
-- Selected dates in which 150 or more was ordered
SELECT order_date, SUM(total_amount) AS total_spent 
FROM orders WHERE total_amount >= 150
GROUP BY order_date;

-- Selected customers who've spend more than 150
SELECT customer_id, SUM(total_amount) AS total_spent 
FROM orders 
GROUP BY customer_id
HAVING SUM(total_amount) >150;

-- Showing customer id's with how many transactions they have had
SELECT customer_id, COUNT(id) AS total_transactions
FROM orders
GROUP BY customer_id;

-- Showing transactions with known customers by date and amound ordered, not showing orders with no known customers
SELECT orders.id, CONCAT(customers.first_name, ' ',customers.last_name) AS full_name, 
orders.order_date, orders.total_amount
FROM orders
INNER JOIN customers ON orders.customer_id = customers.id;

-- Showing transactions with customers who's name starts with "J"
SELECT orders.id,  
orders.order_date, orders.total_amount
FROM orders
WHERE orders.customer_id IN (SELECT id FROM customers WHERE first_name LIKE 'J%');