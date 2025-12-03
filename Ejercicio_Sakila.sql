-- 1.Selecciona todos los nombres de las películas sin que aparezcan duplicados.
USE SAKILA;

SELECT DISTINCT title
FROM film;

-- 2. Películas con clasificación 'PG-13'.
SELECT title
FROM film
WHERE rating = 'PG-13';

-- 3.Título y descripción de películas que contengan la palabra 'amazing' en su descripción.
SELECT title, description
FROM film
WHERE description LIKE '%amazing%';

-- 4.Título de las películas con duración mayor a 120 minutos.
SELECT title
FROM film 
WHERE length > 120;

-- 5. Recupera los nombres de todos los actores.
SELECT first_name, last_name
FROM actor;

-- 6. Actores que tengan 'Gibson' en su apellido.
SELECT first_name, last_name
FROM actor 
WHERE last_name LIKE '%GIBSON%';

-- 7. Actores con actor_id entre 10 y 20.
SELECT actor_id, first_name, last_name
FROM actor
WHERE actor_id BETWEEN 10 AND 20;

-- 8. Título de las películas que no sean ni 'R' ni 'PG-13' en su clasificación.
SELECT title, rating
FROM film
WHERE rating NOT IN ('R', 'PG-13');

-- 9. Cantidad total de películas en cada clasificación (film)
SELECT rating, COUNT(*) AS total_peliculas
FROM film
GROUP BY rating; 

-- 10. Cantidad total de películas alquiladas por cada cliente (ID, nombre, apellido y cantidad).
SELECT c.customer_id, c.first_name, c.last_name,
COUNT(r.rental_id) AS total_alquileres
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_alquileres DESC;

-- 11. Cantidad total de películas alquiladas por categoría (nombre categoría + recuento).
SELECT cat.name AS categoria,
COUNT(r.rental_id) AS total_alquileres
FROM category cat
JOIN film_category fc ON cat.category_id = fc.category_id
JOIN inventory i ON fc.film_id = i.film_id
JOIN rental r ON i. inventory_id = r.inventory_id
GROUP BY cat.category_id, cat.name
ORDER BY total_alquileres DESC;

-- 12. Promedio de duración de las películas para cada clasificación (film).
SELECT rating, AVG(length) AS promedio_duracion
FROM film
GROUP BY rating;

-- 13. Nombre y apellido de los actores que aparecen en la película con title 'Indian Love'.
SELECT a.first_name, a.last_name
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
WHERE f.title = 'Indian love';

-- 14. Título de todas las películas que contengan la palabra 'dog' o 'cat' en su descripción.
SELECT title, description
FROM film
WHERE description LIKE '%dog%'
OR description LIKE '%cat%';

-- 15. Título de las películas que fueron lanzadas entre el año 2005 y 2010.
SELECT title, release_year
FROM film
WHERE release_year BETWEEN 2005 AND 2010;