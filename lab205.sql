USE sakila;

-- 1. Select all the actors with the first name ‘Scarlett’

SELECT * 
FROM sakila.actor
WHERE first_name='Scarlett';

-- 2. How many films (movies) are available for rent and how many films have been rented?

SELECT COUNT(film_id) AS 'Films_available' 
from sakila.inventory;

SELECT COUNT(rental_id) AS 'Films_rented' from sakila.rental;

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration

SELECT MAX(length) AS 'max_duration', MIN(length) AS 'min_duration' FROM sakila.film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?

SELECT ROUND(AVG(length)) AS 'average_duration_minutes', concat('0', FLOOR(ROUND(AVG(length))/60),':',ROUND(AVG(length))-FLOOR(ROUND(AVG(length))/60)*60) AS 'Average_duration_HH:mm'
FROM sakila.film;

-- 5 How many distinct (different) actors' last names are there?

SELECT COUNT(DISTINCT last_name) AS 'Different_last_names'
FROM sakila.actor;

-- 6. Since how many days has the company been operating (check DATEDIFF() function)?

SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS 'Days_operating'
FROM sakila.rental;

-- 7. Show rental info with additional columns month and weekday. Get 20 results.

SELECT *, DATE_FORMAT(rental_date, "%M") AS 'Rental_date_Month', 
DATE_FORMAT(rental_date, "%W") AS 'Rental_date_Weekday'
FROM sakila.rental
LIMIT 20;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week

SELECT *, DATE_FORMAT(rental_date, "%M") AS 'Rental_date_Month', 
DATE_FORMAT(rental_date, "%W") AS 'Rental_date_Weekday',
CASE
WHEN (DATE_FORMAT(rental_date, "%w") IN (1,2,3,4,5)) then 'workday'
ELSE 'weekend'
END AS 'day_type'
FROM sakila.rental
LIMIT 20;

-- 9. Get release years.

SELECT DISTINCT release_year
FROM sakila.film; 

-- 10. Get all films with ARMAGEDDON in the title

SELECT *
FROM sakila.film
WHERE title LIKE ('%ARMAGEDDON%');

-- 11. Get all films which title ends with APOLLO.

SELECT *
FROM sakila.film
WHERE title LIKE ('%APOLLO');

-- 12. Get 10 the longest films

SELECT *
FROM sakila.film
ORDER BY length DESC
LIMIT 10; 

-- 13. How many films include Behind the Scenes content?

SELECT COUNT(special_features)
FROM sakila.film
WHERE special_features LIKE ('%Behind the Scenes%');