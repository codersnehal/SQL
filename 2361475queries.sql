1) Write a query to find the total cost
 
SELECT SUM(no_units_sold * price_unit) AS total_sales
FROM sales;
 
 
2) Write a query to display the production cost for bikes manufactured
 
SELECT VIN, vehicle_name, production_costs
FROM sales;
 
3) Display all the employees names those who have sold at least one bike.
 
select first_name,last_name from employees e
join inventory i on e.VIN = i.VIN
where no_units_sold >= 1;
 
4) Display the dealers who has purchased the max product from the company.
 
SELECT d.dealer_name, d.dealer_id, SUM(s.no_units_sold) AS total_units_purchased
FROM dealers d
JOIN sales s ON d.dealer_id = s.dealer_id
GROUP BY d.dealer_id, d.dealer_name
ORDER BY total_units_purchased DESC 
LIMIT 1;
 
5) Display the stock from inventory based on the oldest bikes
 
SELECT i.VIN, i.vehicle_name, i.no_of_units, i.sale_date
FROM inventory i
ORDER BY i.sale_date ASC;

 
6) Display all the products sold in Italy.
 
SELECT VIN, vehicle_name, product_family, no_units_sold, price_unit, country, sale_date
FROM sales
WHERE country = 'Italy';
 
7) Display the high valued bike (name, cost)
 
SELECT vehicle_name, price_unit
FROM sales
ORDER BY price_unit DESC
LIMIT 1;
 
8) Display how many bikes are ready and not sold
 
SELECT i.vehicle_name, 
(i.no_of_units - COALESCE(SUM(s.no_units_sold), 0)) AS units_ready_not_sold
FROM inventory i
LEFT JOIN sales s ON i.VIN = s.VIN
GROUP BY i.VIN, i.vehicle_name, i.no_of_units;
 
 
9) Write a query to find the sales done by a specific employee
 
SELECT VIN, vehicle_name, no_units_sold, price_unit, sale_date
FROM sales
WHERE emp_id = 10;
 
10) Write a qurey to find the total cost for creating a vehicle
	(production and additional charges) for a specific dealer
 
SELECT d.dealer_name, SUM(s.production_costs + s.additional_costs) AS total_creation_cost
FROM sales s
JOIN dealers d ON s.dealer_id = d.dealer_id
WHERE d.dealer_id = 500 
GROUP BY d.dealer_name;
 


