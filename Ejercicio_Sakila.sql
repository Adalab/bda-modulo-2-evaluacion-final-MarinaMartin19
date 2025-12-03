-- 1.Selecciona todos los nombres de las películas sin que aparezcan duplicados
USE SAKILA;

SELECT DISTINCT title
FROM film;

-- 2. Películas con clasificación 'PG-13'
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