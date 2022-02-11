USE sakila;

-- Select all Actors from the table.
SELECT * FROM film_category;

-- Find the actor with the first name “John”.
SELECT first_name, last_name FROM actor WHERE first_name = 'John';

-- Find all actors with the surname “Neeson”.
SELECT first_name, last_name FROM actor WHERE last_name = 'Neeson';

-- Find all actors with Id numbers divisible by 10.
SELECT actor_id FROM actor WHERE (actor_id % 10) = 0;

-- What is the description of the movie with ID of 100?
SELECT description FROM film_text WHERE film_id=100;

-- Find every movie with a rating of “R”.
SELECT title, rating FROM film WHERE rating='R';

-- Find every movie except those with a rating of “R”.
SELECT title, rating FROM film WHERE rating !='R';

-- Find the 10 shortest movies.
SELECT title, length FROM film ORDER BY length ASC LIMIT 10;

-- Now return only the movie titles.
SELECT title FROM film;

-- Find all movies with Deleted Scenes.
SELECT special_features FROM film WHERE special_features="Deleted Scenes";

-- Which last names are not repeated?
SELECT DISTINCT last_name FROM actor;

-- Which last names appear more than once?
SELECT last_name, COUNT(last_name) AS Count FROM actor GROUP BY last_name HAVING count(*) > 1;
