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