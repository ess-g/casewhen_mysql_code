-- dvdrental questions CASE WHEN

*****************************Basic Syntax*****************************

--The CASE evaluates one or more conditions and returns the result 
--for the first condition that is true. 
--If no condition is true, the result after ELSE is 
--returned, or NULL if there is no ELSE part.
--
--General Syntax
--
--CASE
--    WHEN condition1 THEN result1
--    WHEN condition2 THEN result2
--    WHEN conditionN THEN resultN
--    ELSE result
--END AS ColumnName

Question 1:

--Select the title, description, rating and replacement_cost 
--for every movie with a title that starts with the letter 'A'

SELECT title, description, rating, replacement_cost
FROM film
WHERE title LIKE 'A%'

Question 2:

--Select the title, description, rating and replacement_cost 
--for every movie about data

SELECT title, description, rating, replacement_cost
FROM film
WHERE description ILIKE '%data%' or description ILIKE '%mysql%' --ILIKE is case INSENSITIVE--

Question 3:

--Create a table -- (JOIN) -- the includes the Title, The Category, Description, 
--the Rental Rate and the rating of every movie that starts with c

SELECT f.title, c.name, f.description, f.rental_rate, rating 
FROM film f  
JOIN film_category fc ON f.film_id = fc.film_id 
JOIN category c ON fc.category_id = c.category_id 
WHERE f.title ILIKE 'c%' OR f.title ILIKE 'the c%'

Question 4:

--Create a table the includes the Title, The Category, Description, 
--the Rental Rate and the rating of every movie
--Create an additional column called recommended audience that
--designates all movies rated G, PG and PG-13 as Family Friendly and 
--all others as not family friendly

SELECT f.title, c.name, f.description, f.rental_rate, rating, 
CASE 
    WHEN f.rating IN ('G','PG','PG-13') THEN 'Family Friendly'ELSE 'Not Family Friendly'
END AS recommended_audience
FROM film f  
JOIN film_category fc ON f.film_id = fc.film_id 
JOIN category c ON fc.category_id = c.category_id 

Question 5:

--Create a table the includes the Title, The Category, 
--and the rental rate of every movie. 
--Create an additional column 'price_category' that lables
--every move with price below 2.99 as 'Discount', at least 2.99 
--but below 4.99 as 'Full Price' and anything above that as 'Premium'

SELECT f.title, c.name, f.rental_rate,
CASE 
    WHEN f.rental_rate < 2.99 THEN 'Discount'
    WHEN f.rental_rate BETWEEN 2.99 AND 4.98 THEN 'Full Price'
    WHEN f.rental_rate > 4.98 THEN 'Premium'
    ELSE 'Error'
END AS price_category
FROM film f  
JOIN film_category fc ON f.film_id = fc.film_id 
JOIN category c ON fc.category_id = c.category_id 

Question 6:

--Create a table that includes the the category, and the average
--rental rate per category from most to least expensive

SELECT c.name AS category, ROUND(AVG(f.rental_rate),2) AS average_rental_rate
FROM film f  
JOIN film_category fc ON f.film_id = fc.film_id 
JOIN category c ON fc.category_id = c.category_id 
GROUP BY 1
ORDER BY 2 DESC 

---More than or Equal to 3 = PREMIUM---
---More than or Equal to 2 = REGULAR---
---More than or Equal to 0.50 = DISCOUNT---

SELECT c.name AS category, ROUND(AVG(f.rental_rate),2) AS average_rental_rate,
CASE
    WHEN AVG(f.rental_rate) >= 3 THEN 'Premium'
    WHEN AVG(f.rental_rate) >= 2 THEN 'Regular'
    WHEN AVG(f.rental_rate) >= 0.5 THEN 'Discount'
    ELSE 'Error'
END AS Price_Category
FROM film f  
JOIN film_category fc ON f.film_id = fc.film_id 
JOIN category c ON fc.category_id = c.category_id 
GROUP BY  1
ORDER BY 2 DESC 

Question 7: 

--Every customer that has spent at least $150 gets a coupon for 10% of the value of their total purchases
--Every customer that has spent at least $100 but less than $150 gets a coupon for 5% of the value of their total purchases
--All others get nothing
--Create a table showing the name, customer_id and sum of purchases per customer and the value of the coupon
--they will be issued


SELECT CONCAT (c.first_name,' ',c.last_name) AS Full_Name, c.customer_id,
ROUND(SUM(p.amount),2),
CASE
    WHEN SUM(p.amount) >= 150 THEN ROUND(SUM(p.amount)) * 0.10
    WHEN SUM(p.amount) BETWEEN 100 and 149.99 THEN SUM(p.amount) * 0.05
    ELSE '0'
END AS Coupon_Value
FROM customer c 
JOIN payment p ON c.customer_id = p.customer_id  
GROUP BY 2
ORDER BY 4 DESC

---


