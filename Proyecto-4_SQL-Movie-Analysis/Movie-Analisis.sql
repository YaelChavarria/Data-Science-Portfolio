/* ---------------------------------------------------------------------------------
 * --------------------------- DQL - Data Query Languaje ---------------------------
 * by Ivan Alducin
 */


--1. Vamos a seleccionar el nombre y apellido de los actores
 
SELECT first_name, last_name
FROM dbo.actor
	

--2. Vamos a seleccionar el nombre completo del actor en una sola columna
SELECT CONCAT(first_name, ' ', last_name) AS NombreCompleto
FROM dbo.actor
	
	

--3. Selecciona los actores que su nombre empieza con "D"

SELECT *
FROM dbo.actor
WHERE first_name LIKE 'D%' ; 
	

--4. ¿Tenemos algún actor con el mismo nombre?

SELECT first_name, COUNT (*)
FROM dbo.actor
GROUP BY first_name
HAVING COUNT(*) >1 

	

--5. ¿Cuál es el costo máximo de renta de una película?

SELECT MAX(rental_rate)	
FROM dbo.film


--6. ¿Cuáles son las peliculas que fueron rentadas con ese costo?	
SELECT title, rental_rate
FROM dbo.film
WHERE rental_rate = (SELECT MAX(rental_rate) FROM dbo.film)
	

--7. ¿Cuantás películas hay por el tipo de audencia (rating)?
SELECT rating, COUNT(*) AS total_peliculas
FROM dbo.film
GROUP BY rating;  
	


--8. Selecciona las películas que no tienen un rating R o NC-17
SELECT title, rating
FROM dbo.film
WHERE rating NOT IN ('R', 'NC-17')
	
	
	
--9. ¿Cuantos clientes hay en cada tienda?
SELECT store_id, COUNT (*) AS Total_Clientes
FROM dbo.customer
GROUP BY store_id;
	

--10. ¿Cuál es la pelicula que mas veces se rento?
SELECT f.title, COUNT(*) AS rentas
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id	
GROUP BY f.title
ORDER BY rentas DESC

--11. ¿Qué peliculas no se han rentado?
SELECT f.title
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.rental_id IS NULL
	
	
--12. ¿Qué clientes no han rentado ninguna película?
SELECT c.first_name, c.last_name
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
WHERE r.rental_id IS NULL	
	
--13. ¿Qué actores han actuado en más de 30 películas?
SELECT 
    a.first_name, 
    a.last_name, 
    COUNT(*) AS total_peliculas
FROM dbo.actor a	
JOIN film_actor fa ON a.actor_id = fa.actor_id	
GROUP BY a.actor_id, a.first_name, a.last_name 
HAVING COUNT(*) > 30;

--14. Muestra las ventas totales por tienda
SELECT 
    s.store_id,
    SUM(CAST(p.amount AS DECIMAL(10, 2))) AS ventas_totales 
FROM dbo.store s
JOIN dbo.staff st ON s.store_id = st.store_id
JOIN dbo.payment p ON st.staff_id = p.staff_id
GROUP BY s.store_id;


--15. Muestra los clientes que rentaron una pelicula más de una vez
with rentals_cte as (
	SELECT r.customer_id, i.film_id, COUNT(*) AS veces_rentada
	FROM dbo.rental r
	JOIN inventory i ON r.inventory_id = i.inventory_id
	GROUP BY r.customer_id, i.film_id
	HAVING COUNT(*) > 1
)
SELECT c.first_name, c.last_name, f.title, rc.veces_rentada
FROM rentals_cte rc
JOIN customer c ON rc.customer_id = c.customer_id
JOIN film f ON rc.film_id = f.description