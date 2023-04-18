use `premier_products`;

-- print all rows and columns of dataset -- 
SELECT * FROM customer, order_line, orders, part, sales_rep;

-- print last name, first name, sales rep number, and city from sales rep table
SELECT last_name, first_name, sales_rep_num, city FROM sales_rep;

-- select order and customer number from orders
SELECT order_num, customer_num FROM orders;

-- select only 2 rows from order line -- 
SELECT * FROM order_line LIMIT 2;

-- select all of the entries from customer where sales rep number = 20 --
SELECT * FROM customer WHERE sales_rep_num = 20;

-- select customer name, balance, credit limit from customer where sales rep num = 20 --
SELECT customer_name, balance, credit_limit FROM customer WHERE sales_rep_num = 20;

-- select part num, num ordered, quoted price and total price where total price is (num_ordered * quoted_price) where only 1 num ordered and the order number is 21617 --
SELECT part_num, num_ordered, quoted_price, (num_ordered * quoted_price) AS total_price FROM order_line
WHERE order_num = 21617 AND num_ordered = 1;

-- show all the orders from order date between '2010-10-20' and '2010-10-22' --
SELECT * FROM orders WHERE order_date BETWEEN '2010-10-20' AND '2010-10-22';

-- list all of parts where the part description starts with 'D' and end with 'er' -- 
SELECT * FROM part WHERE part_description LIKE 'D%er';

-- show total balance from customer -- 
SELECT SUM(balance) FROM customer;

-- show minimum balance from customer -- 
SELECT MIN(balance) FROM customer;

-- count number of customers in customer table -- 
SELECT COUNT(*) FROM customer;

-- select order number where the quote price is more than 500 but less than 1000 -- 
SELECT order_num, quoted_price FROM order_line WHERE quoted_price > 500 AND quoted_price < 1000;

-- create a new table of customer name, last name, and first name from customer and sales rep table by matching up their primary key -- 
CREATE TABLE customer_sales_rep (
    customer_name CHAR(50),
    last_name CHAR(50),
    first_name CHAR(50)
);

INSERT INTO customer_sales_rep (customer_name, last_name, first_name)
SELECT 
    c.customer_name, 
    s.last_name, 
    s.first_name 
FROM customer c
JOIN sales_rep s
ON c.sales_rep_num = s.sales_rep_num;


-- view new table --
SELECT * FROM customer_sales_rep;








