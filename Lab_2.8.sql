use sakila;
show tables;
#1
SELECT title, length,
CASE 
    WHEN length <= 60 THEN 'Short'
    WHEN length <= 120 THEN 'Medium'
    WHEN length <= 180 THEN 'Long'
    ELSE 'Very long'
END AS duration_range
FROM film
WHERE length IS NOT NULL AND length > 0;
#2
SELECT title, length, rating,
CASE 
    WHEN length <= 60 THEN 'Short'
    WHEN length <= 120 THEN 'Medium'
    WHEN length <= 180 THEN 'Long'
    ELSE 'Very long'
END AS duration_range
FROM film
WHERE length IS NOT NULL AND length > 0;
#3
SELECT c.name AS category, COUNT(fc.film_id) AS number_of_films
FROM category c
LEFT JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.category_id
ORDER BY number_of_films DESC;
#4
SELECT c.name AS category, COUNT(fc.film_id) AS number_of_films
FROM category c
LEFT JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.category_id
ORDER BY number_of_films DESC;
#5
SELECT c.first_name, c.last_name, COUNT(*) AS num_rentals
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY num_rentals DESC
LIMIT 1;