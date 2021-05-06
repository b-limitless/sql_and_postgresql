-- select the paid and unpaid order from the order table
select paid, count(*)  FROM orders 
group BY paid;

-- Select the data from user and order and join both table check if it is paid or not

select first_name, last_name, paid 
FROM users 
JOIN orders on users.id = orders.user_id;

--
select * 
From products 
order by price 
LIMIT 20
OFFSET 20;

-- 
select name FROM phones order by price DESC LIMIT 2 OFFSET 1;

-- GET THE MOST EXPENSIVE ITEM AND WICH HAS LESS WEIGHT
(
SELECT * 
FROM products 
ORDER BY price DESC 
LIMIT 4
) UNION (
SELECT * FROM 
products 
ORDER BY price / weight DESC 
LIMIT 4
);

-- FIND THE COMMON ROW BETWEEN BOTH ROW S
(
SELECT * 
FROM products 
ORDER BY price DESC 
LIMIT 4
) INTERSECT (
SELECT * FROM 
products 
ORDER BY price / weight DESC 
LIMIT 4
);

-- 
(select * 
from products 
ORDER BY price desc 
LIMIT 4)
EXCEPT 
(SELECT  * from 
products 
ORDER BY price / weight DESC 
LIMIT 4);


select manufacturer from phones where price < 170
UNION 
select manufacturer from phones group by manufacturer 
having count(*) > 2;


select name, price
FROM products 
WHERE price > (
select max(price) FROM products  WHERE department = 'Toys'
)

SELECT product_id, COUNT(*)
FROM orders
GROUP BY product_id;

--- select max price and then make price_ratio
select name, price, price/ (select max(price) from phones)
as price_ratio from phones;


select first_name
FROM users 
JOIN orders 
on orders.user_id = users.id 
WHERE orders.product_id = 3


select id FROM orders  
WHERE product_id in
(select id
FROM products
WHERE price / weight > 50);


select name, price 
FROM products
WHERE price > (select AVG(price) FROM products where department = 'Toys')


SELECT name, price 
FROM products 
WHERE price > (select price FROM products WHERE name = 'Practical Fresh Shirt');

select name, department FROM products WHERE department not in 
(select department FROM products WHERE price < 100)

select name, department, price FROM products WHERE price > ALL (
select price FROM products WHERE department = 'Industrial'
)

select name, department, price FROM products WHERE price > SOME (
select price FROM products WHERE department = 'Industrial')