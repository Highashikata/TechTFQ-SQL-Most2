--- Q8: Retrieving the Hierarchy of employees under a given manager id
select * from employee;
select * from emp_details;

---- Let' fetch the hierarchy of employees working under Alice Architect whoe employee_id equals 4
-- So we're going to search for emloyees having 4 as Manger_id

WITH recursive cte AS
(
       SELECT id,
              NAME,
              manager_id,
              salary,
              designation,
              1 AS hierarchylevel
       FROM   emp_details
       WHERE  manager_id = 4
       UNION ALL
       SELECT emp.id,
              emp.NAME,
              emp.manager_id,
              emp.salary,
              emp.designation,
              e.hierarchylevel + 1
       FROM   emp_details emp
       JOIN   cte e
       ON     e.id = emp.manager_id )
SELECT *,
       hierarchylevel
FROM   cte;


--- Q9: Finding the difference in avg ssales
CREATE TABLE orders (
    order_number BIGINT PRIMARY KEY,
    quantity_ordered INTEGER,
    price_each DOUBLE PRECISION,
    sales DOUBLE PRECISION,
    order_date DATE,
    status VARCHAR(50),
    qtr_id INTEGER,
    month_id INTEGER,
    year_id INTEGER,
    product VARCHAR(50),
    customer VARCHAR(50),
    deal_size VARCHAR(10)
);


-- Alimentation de la table
INSERT INTO orders (order_number, quantity_ordered, price_each, sales, order_date, status, qtr_id, month_id, year_id, product, customer, deal_size)
VALUES
    (1001, 5, 999.99, 4999.95, '2024-01-05', 'Shipped', 1, 1, 2024, 'iPhone 13 Pro', 'C1', 'Large'),
    (1002, 3, 1499.99, 4499.97, '2024-01-10', 'Shipped', 1, 1, 2024, 'MacBook Pro 14', 'C2', 'Medium'),
    (1003, 2, 199.99, 399.98, '2024-01-15', 'Pending', 1, 1, 2024, 'AirPods Pro', 'C3', 'Small'),
    (1004, 4, 799.99, 3199.96, '2024-01-20', 'Shipped', 1, 1, 2024, 'iPad Air', 'C4', 'Large'),
    (1005, 2, 499.99, 999.98, '2024-01-25', 'Pending', 1, 1, 2024, 'Apple Watch Series 7', 'C5', 'Small'),
    (1006, 3, 1499.99, 4499.97, '2024-02-02', 'Shipped', 1, 2, 2024, 'MacBook Pro 14', 'C6', 'Medium'),
    (1007, 2, 199.99, 399.98, '2024-02-07', 'Shipped', 1, 2, 2024, 'AirPods Pro', 'C7', 'Small'),
    (1008, 6, 999.99, 5999.94, '2024-02-12', 'Pending', 1, 2, 2024, 'iPhone 13 Pro', 'C8', 'Large'),
    (1009, 3, 799.99, 2399.97, '2024-02-17', 'Shipped', 1, 2, 2024, 'iPad Air', 'C9', 'Medium'),
    (1010, 1, 3999.99, 3999.99, '2024-02-22', 'Shipped', 1, 2, 2024, 'Mac Pro', 'C10', 'Large'),
    (1011, 4, 149.99, 599.96, '2024-03-01', 'Pending', 1, 3, 2024, 'HomePod Mini', 'C11', 'Medium'),
    (1012, 2, 1499.99, 2999.98, '2024-03-06', 'Shipped', 1, 3, 2024, 'MacBook Air 13', 'C12', 'Small'),
    (1013, 3, 399.99, 1199.97, '2024-03-11', 'Shipped', 1, 3, 2024, 'Apple TV 4K', 'C13', 'Medium'),
    (1014, 5, 149.99, 749.95, '2024-03-16', 'Pending', 1, 3, 2024, 'HomePod Mini', 'C14', 'Large'),
    (1015, 1, 1199.99, 1199.99, '2024-03-21', 'Shipped', 1, 3, 2024, 'iPad Pro 11', 'C15', 'Small'),
    (1016, 2, 699.99, 1399.98, '2024-03-26', 'Shipped', 1, 3, 2024, 'Apple Watch SE', 'C16', 'Medium'),
    (1017, 4, 2999.99, 11999.96, '2024-04-02', 'Pending', 2, 4, 2024, 'Mac Pro', 'C17', 'Large'),
    (1018, 3, 199.99, 599.97, '2024-04-07', 'Shipped', 2, 4, 2024, 'AirPods', 'C18', 'Small'),
    (1019, 6, 799.99, 4799.94, '2024-04-12', 'Shipped', 2, 4, 2024, 'iPad Mini', 'C19', 'Large'),
    (1020, 2, 399.99, 799.98, '2024-04-17', 'Pending', 2, 4, 2024, 'Apple TV HD', 'C20', 'Medium'),
    (1021, 5, 499.99, 2499.95, '2024-04-22', 'Shipped', 2, 4, 2024, 'AirTag', 'C21', 'Large'),
    (1022, 3, 599.99, 1799.97, '2024-04-27', 'Shipped', 2, 4, 2024, 'HomePod Mini', 'C22', 'Medium'),
    (1023, 1, 299.99, 299.99, '2024-05-03', 'Pending', 2, 5, 2024, 'Apple Pencil 2', 'C23', 'Small');
	
INSERT INTO orders (order_number, quantity_ordered, price_each, sales, order_date, status, qtr_id, month_id, year_id, product, customer, deal_size)
VALUES
    (2001, 5, 999.99, 4999.95, '2023-01-05', 'Shipped', 1, 1, 2023, 'iPhone 12 Pro', 'C1', 'Large'),
    (2002, 3, 1499.99, 4499.97, '2023-01-10', 'Shipped', 1, 1, 2023, 'MacBook Pro 13', 'C2', 'Medium'),
    (2003, 2, 199.99, 399.98, '2023-01-15', 'Pending', 1, 1, 2023, 'AirPods 3', 'C3', 'Small'),
    (2004, 4, 799.99, 3199.96, '2023-01-20', 'Shipped', 1, 1, 2023, 'iPad', 'C4', 'Large'),
    (2005, 2, 499.99, 999.98, '2023-01-25', 'Pending', 1, 1, 2023, 'Apple Watch Series 6', 'C5', 'Small'),
    (2006, 3, 1499.99, 4499.97, '2023-02-02', 'Shipped', 1, 2, 2023, 'MacBook Air 13', 'C6', 'Medium'),
    (2007, 2, 199.99, 399.98, '2023-02-07', 'Shipped', 1, 2, 2023, 'AirPods Pro', 'C7', 'Small'),
    (2008, 6, 999.99, 5999.94, '2023-02-12', 'Pending', 1, 2, 2023, 'iPhone 12', 'C8', 'Large'),
    (2009, 3, 799.99, 2399.97, '2023-02-17', 'Shipped', 1, 2, 2023, 'iPad Mini 6', 'C9', 'Medium'),
    (2010, 1, 3999.99, 3999.99, '2023-02-22', 'Shipped', 1, 2, 2023, 'Mac Pro', 'C10', 'Large');


INSERT INTO orders (order_number, quantity_ordered, price_each, sales, order_date, status, qtr_id, month_id, year_id, product, customer, deal_size)
VALUES
    -- 2023
    (2301, 5, 999.99, 4999.95, '2023-01-05', 'Shipped', 1, 1, 2023, 'iPhone 12 Pro', 'C1', 'Large'),
    (2302, 3, 1499.99, 4499.97, '2023-02-10', 'Shipped', 1, 2, 2023, 'MacBook Pro 13', 'C2', 'Medium'),
    (2303, 2, 199.99, 399.98, '2023-03-15', 'Pending', 1, 3, 2023, 'AirPods 3', 'C3', 'Small'),
    (2304, 4, 799.99, 3199.96, '2023-04-20', 'Shipped', 2, 4, 2023, 'iPad', 'C4', 'Large'),
    (2305, 2, 499.99, 999.98, '2023-05-25', 'Pending', 2, 5, 2023, 'Apple Watch Series 6', 'C5', 'Small'),
    (2306, 3, 1499.99, 4499.97, '2023-06-02', 'Shipped', 2, 6, 2023, 'MacBook Air 13', 'C6', 'Medium'),
    (2307, 2, 199.99, 399.98, '2023-07-07', 'Shipped', 2, 7, 2023, 'AirPods Pro', 'C7', 'Small'),
    (2308, 6, 999.99, 5999.94, '2023-08-12', 'Pending', 3, 8, 2023, 'iPhone 12', 'C8', 'Large'),
    (2309, 3, 799.99, 2399.97, '2023-09-17', 'Shipped', 3, 9, 2023, 'iPad Mini 6', 'C9', 'Medium'),
    (2310, 1, 3999.99, 3999.99, '2023-10-22', 'Shipped', 4, 10, 2023, 'Mac Pro', 'C10', 'Large'),
    (2311, 4, 149.99, 599.96, '2023-11-01', 'Pending', 4, 11, 2023, 'HomePod Mini', 'C11', 'Medium'),
    (2312, 2, 1499.99, 2999.98, '2023-12-06', 'Shipped', 4, 12, 2023, 'MacBook Air 13', 'C12', 'Small');


INSERT INTO orders (order_number, quantity_ordered, price_each, sales, order_date, status, qtr_id, month_id, year_id, product, customer, deal_size)
VALUES
    -- 2024
    (2401, 5, 999.99, 4999.95, '2024-01-05', 'Shipped', 1, 1, 2024, 'iPhone 13 Pro', 'C1', 'Large'),
    (2402, 3, 1499.99, 4499.97, '2024-02-10', 'Shipped', 1, 2, 2024, 'MacBook Pro 14', 'C2', 'Medium'),
    (2403, 2, 199.99, 399.98, '2024-03-15', 'Pending', 1, 3, 2024, 'AirPods Pro', 'C3', 'Small'),
    (2404, 4, 799.99, 3199.96, '2024-04-20', 'Shipped', 2, 4, 2024, 'iPad Air', 'C4', 'Large'),
    (2405, 2, 499.99, 999.98, '2024-05-25', 'Pending', 2, 5, 2024, 'Apple Watch Series 7', 'C5', 'Small'),
    (2406, 3, 1499.99, 4499.97, '2024-06-02', 'Shipped', 2, 6, 2024, 'MacBook Air 15', 'C6', 'Medium'),
    (2407, 2, 199.99, 399.98, '2024-07-07', 'Shipped', 2, 7, 2024, 'HomePod Pro', 'C7', 'Small'),
    (2408, 6, 999.99, 5999.94, '2024-08-12', 'Pending', 3, 8, 2024, 'iPhone 14', 'C8', 'Large'),
    (2409, 3, 799.99, 2399.97, '2024-09-17', 'Shipped', 3, 9, 2024, 'iPad Pro', 'C9', 'Medium'),
    (2410, 1, 3999.99, 3999.99, '2024-10-22', 'Shipped', 4, 10, 2024, 'iMac 27', 'C10', 'Large'),
    (2411, 4, 149.99, 599.96, '2024-11-01', 'Pending', 4, 11, 2024, 'AirPods Max', 'C11', 'Medium'),
    (2412, 2, 1499.99, 2999.98, '2024-12-06', 'Shipped', 4, 12, 2024, 'MacBook Air 13', 'C12', 'Small');


INSERT INTO orders (order_number, quantity_ordered, price_each, sales, order_date, status, qtr_id, month_id, year_id, product, customer, deal_size)
VALUES
    -- Février 2023
    (2602, 2, 299.99, 599.98, '2023-02-08', 'Shipped', 1, 2, 2023, 'iPad Mini', 'C14', 'Medium'),
    -- Mars 2023
    (2603, 5, 1499.99, 7499.95, '2023-03-15', 'Pending', 1, 3, 2023, 'iPhone 12', 'C15', 'Large'),
    -- Avril 2023
    (2354, 4, 1999.99, 7999.96, '2023-04-20', 'Shipped', 2, 4, 2023, 'MacBook Pro 16', 'C16', 'Medium'),
    -- Mai 2023
    (2345, 1, 599.99, 599.99, '2023-05-25', 'Pending', 2, 5, 2023, 'AirPods 3', 'C17', 'Small'),
    -- Juin 2023
    (2806, 3, 1499.99, 4499.97, '2023-06-02', 'Shipped', 2, 6, 2023, 'iMac 27"', 'C18', 'Medium'),
    -- Juillet 2023
    (2707, 2, 799.99, 1599.98, '2023-07-05', 'Shipped', 3, 7, 2023, 'HomePod Mini', 'C19', 'Small'),
    --Août 2023
    (2908, 1, 199.99, 199.99, '2023-08-10', 'Pending', 3, 8, 2023, 'Apple TV 4K', 'C20', 'Small'),
    -- Septembre 2023
    (2559, 4, 999.99, 3999.96, '2023-09-15', 'Shipped', 3, 9, 2023, 'Apple Pencil', 'C21', 'Medium'),
    -- Octobre 2023
    (2351, 2, 149.99, 299.98, '2023-10-20', 'Shipped', 4, 10, 2023, 'Magic Keyboard', 'C22', 'Small'),
    -- Novembre 2023
    (2361, 3, 299.99, 899.97, '2023-11-25', 'Pending', 4, 11, 2023, 'Mac Pro', 'C23', 'Medium'),
    -- Décembre 2023
    (2902, 5, 1999.99, 9999.95, '2023-12-30', 'Shipped', 4, 12, 2023, 'Apple Studio Display', 'C24', 'Large');



select * from orders;



select product, year_id, month_id, sum(sales) over(partition by year_id order by month_id) from orders;


SELECT
    month_id,
    SUM(CASE WHEN year_id = 2023 THEN sales ELSE 0 END) AS sales_2023,
    SUM(CASE WHEN year_id = 2024 THEN sales ELSE 0 END) AS sales_2024,
    SUM(CASE WHEN year_id = 2024 THEN sales ELSE 0 END) - SUM(CASE WHEN year_id = 2023 THEN sales ELSE 0 END) AS sales_difference
FROM
    orders
WHERE
    year_id IN (2023, 2024)
GROUP BY
    month_id
ORDER BY
    month_id;
	
---- Sales difference per month per year

-- Methode1.
SELECT T_sales_2023.month_id,
	   T_sales_2023.total_sales_2023,
	   T_sales_2024.total_sales_2024,
       T_sales_2024.total_sales_2024 - COALESCE(T_sales_2023.total_sales_2023, 0) AS sales_difference
FROM   
	(SELECT Extract(month FROM order_date) AS month_id,
               Extract(year FROM order_date)  AS année,
               Sum(sales)                     AS total_sales_2023
        FROM   orders
        WHERE  Extract(year FROM order_date) = 2023
        GROUP  BY Extract(month FROM order_date),
                  Extract(year FROM order_date)
        ORDER  BY Extract(month FROM order_date)) T_sales_2023
		
LEFT JOIN 
	(SELECT Extract(month FROM order_date) AS month_id,
                         Extract(year FROM order_date)  AS année,
                         Sum(sales)                     AS total_sales_2024
                  FROM   orders
                  WHERE  Extract(year FROM order_date) = 2024
                  GROUP  BY Extract(month FROM order_date),
                            Extract(year FROM order_date)
                  ORDER  BY Extract(month FROM order_date)) T_sales_2024
ON T_sales_2023.month_id = T_sales_2024.month_id
ORDER  BY T_sales_2023.month_id; 


-- method2: Using self-join

with cte as(
SELECT year_id,
       month_id,
       To_char(order_date, 'MON') AS mois,
       Avg(sales)                 avg_sales_per_month
FROM   orders
WHERE  year_id IN( 2023, 2024 )
GROUP  BY year_id,
          month_id,
          To_char(order_date, 'MON')
ORDER  BY To_date(To_char(order_date, 'MON'), 'MON')
)

select cte23.mois, (cte23.avg_sales_per_month - cte24.avg_sales_per_month) as diff_avg_sales
from cte cte23
join cte cte24
on cte23.mois = cte24.mois 
WHERE cte23.year_id = 2023 and cte24.year_id = 2024
order by cte23.year_id;



-- Q10: Pizza Delivery statu
/* a pizza company is taking orders from customers, and each pizza ordered is added 
to their database as a seperate order.
Each order has an associated status, "Created,Submitted or Delivered"
an order's Final_status i calculated based on statu a follows:
	1.when all orders for a customer hae a status of DELIVERED, that customer's order 
	has a Final_Status of COMPLETED.
	2.If a customer has some orders that are not DELIVERED and some orders that are 
	DELIVERED, the Final_Status is IN PROGRESS.
	3. If all of a customer's orders are SUBMITTED, the Final_Status is AWAITING PROGRESS.
	4. Otherwise, the Fina_Status is AWAITING SUBMISSION.
*/


CREATE TABLE pizza_orders (
    cust_name VARCHAR(50),
    order_id VARCHAR(10),
    status VARCHAR(50) CHECK (status IN ('SUBMITTED', 'CREATED', 'DELIVERED'))
);


INSERT INTO pizza_orders (cust_name, order_id, status) VALUES
('John Doe', 'ORD001', 'SUBMITTED'),
('Alice Smith', 'ORD002', 'CREATED'),
('Bob Johnson', 'ORD003', 'DELIVERED'),
('Emily Brown', 'ORD004', 'SUBMITTED'),
('Michael Davis', 'ORD005', 'CREATED'),
('Jessica Wilson', 'ORD006', 'DELIVERED'),
('David Lee', 'ORD007', 'SUBMITTED'),
('Sarah Taylor', 'ORD008', 'CREATED'),
('Daniel Miller', 'ORD009', 'DELIVERED'),
('Jennifer Anderson', 'ORD010', 'SUBMITTED'),
('Matthew Martinez', 'ORD011', 'CREATED'),
('Laura Thompson', 'ORD012', 'DELIVERED'),
('Christopher Harris', 'ORD013', 'SUBMITTED'),
('Ashley Clark', 'ORD014', 'CREATED'),
('Ryan Rodriguez', 'ORD015', 'DELIVERED');


INSERT INTO pizza_orders (cust_name, order_id, status) VALUES
('John Doe', 'ORD016', 'DELIVERED'),
('John Doe', 'ORD017', 'DELIVERED'),
('John Doe', 'ORD018', 'SUBMITTED'),
('John Doe', 'ORD019', 'SUBMITTED'),
('John Doe', 'ORD020', 'SUBMITTED'),
('John Doe', 'ORD021', 'CREATED'),
('John Doe', 'ORD022', 'CREATED'),
('Alice Smith', 'ORD023', 'DELIVERED'),
('Alice Smith', 'ORD024', 'DELIVERED'),
('Alice Smith', 'ORD025', 'DELIVERED'),
('Alice Smith', 'ORD026', 'DELIVERED'),
('Alice Smith', 'ORD027', 'CREATED'),
('Alice Smith', 'ORD028', 'CREATED'),
('Alice Smith', 'ORD029', 'SUBMITTED'),
('Alice Smith', 'ORD030', 'SUBMITTED'),
('Bob Johnson', 'ORD031', 'DELIVERED'),
('Bob Johnson', 'ORD032', 'DELIVERED'),
('Bob Johnson', 'ORD033', 'DELIVERED'),
('Bob Johnson', 'ORD034', 'DELIVERED'),
('Bob Johnson', 'ORD035', 'DELIVERED'),
('Bob Johnson', 'ORD036', 'DELIVERED'),
('Bob Johnson', 'ORD037', 'DELIVERED'),
('Bob Johnson', 'ORD038', 'DELIVERED'),
('Bob Johnson', 'ORD039', 'DELIVERED'),
('Bob Johnson', 'ORD040', 'DELIVERED'),
('Alice Brown', 'ORD041', 'CREATED'),
('Alice Brown', 'ORD042', 'SUBMITTED'),
('Alice Brown', 'ORD043', 'SUBMITTED'),
('Alice Brown', 'ORD044', 'DELIVERED'),
('Alice Brown', 'ORD045', 'DELIVERED');



select * from pizza_orders;


select cust_name as customer_name,
case when count(status='DELIVERED') = count(cust_name) THEN 'COMPLETED' 
else 'IN PROGRESs'

end as Final_Status
from pizza_orders
group by cust_name


SELECT cust_name
FROM pizza_orders
GROUP BY cust_name
HAVING COUNT(*) = SUM(CASE WHEN status = 'DELIVERED' THEN 1 ELSE 0 END);

SELECT
    cust_name,
    CASE
        WHEN SUM(CASE WHEN status = 'DELIVERED' THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN status != 'DELIVERED' THEN 1 ELSE 0 END) > 0 THEN 'COMPLETED'
        ELSE final_status
    END AS final_status
FROM (
    SELECT
        cust_name,
        CASE
            WHEN COUNT(*) = SUM(CASE WHEN status = 'DELIVERED' THEN 1 ELSE 0 END) THEN 'COMPLETED'
            WHEN SUM(CASE WHEN status = 'DELIVERED' THEN 1 ELSE 0 END) > 0 THEN 'IN PROGRESS'
            WHEN COUNT(*) = SUM(CASE WHEN status = 'SUBMITTED' THEN 1 ELSE 0 END) THEN 'AWAITING PROGRESS'
            ELSE 'AWAITING SUBMISSION'
        END AS final_status
    FROM
        pizza_orders
    GROUP BY
        cust_name
) AS subquery
GROUP BY
    cust_name, final_status;









SELECT
        cust_name,
        CASE
            WHEN COUNT(*) = SUM(CASE WHEN status = 'DELIVERED' THEN 1 ELSE 0 END) THEN 'COMPLETED'
            WHEN SUM(CASE WHEN status = 'DELIVERED' THEN 1 ELSE 0 END) > 0 THEN 'IN PROGRESS'
            WHEN COUNT(*) = SUM(CASE WHEN status = 'SUBMITTED' THEN 1 ELSE 0 END) THEN 'AWAITING PROGRESS'
            ELSE 'AWAITING SUBMISSION'
        END AS final_status
    FROM
        pizza_orders
    GROUP BY
        cust_name;
		
		
		
