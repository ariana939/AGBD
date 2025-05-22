/*1*//*Título de la película, dirección, ciudad y país del local del nombre de una película a elección.*/
select f.title, ad.address, ci.city, co.country from film f
INNER JOIN inventory i on f.film_id = i.film_id
INNER JOIN store st on i.store_id = st.store_id
INNER JOIN address ad on st.address_id = ad.address_id
INNER JOIN city ci on ad.city_id = ci.city_id
INNER JOIN country co on ci.country_id = co.country_id 
WHERE f.title = "ANGELS LIFE";



/*2*//*Mostrar título, categoría, idioma, rating y duración de las películas que estén entre 1 hs y 2 hs.*/
select f.title, ca.name as category, lan.name as language, f.rating, f.length from film f
INNER JOIN film_category fc on f.film_id = fc.film_id
INNER JOIN category ca on fc.category_id = ca.category_id
INNER JOIN language lan on f.language_id = lan.language_id
WHERE f.length BETWEEN 60 AND 120 
ORDER BY f.length asc



/*3*//*Mostrar nombre, apellido y dirección (con ciudad y país) de los encargados del local.*/
select s.first_name, s.last_name, ci.city, co.country from staff s
INNER JOIN address ad on s.address_id = ad.address_id
INNER JOIN city ci on ad.city_id = ci.city_id
INNER JOIN country co on ci.country_id = co.country_id 


/*4*//*Mostrar el título, la fecha mínima y máxima de devolución de una película.*/
select f.title, MIN(r.rental_date), MAX(r.return_date) from film f
INNER JOIN inventory i on f.film_id = i.film_id
INNER JOIN rental r on i.inventory_id = r.inventory_id
WHERE f.title = "ACADEMY DINOSAUR";


/*5*//*¿Se puede realizar una unión de todas las tablas? En caso de que se pueda realizar la sentencia que 
corresponde para unir las tablas. Seleccionando los datos que ustedes consideren necesarios de cada tabla.*/



/*6*//*¿Cuántas películas hay en cada tipo de "rating" (g, pg, pg13, r, nc17)*/
select count(*)as cantidadPelis_x_rating, rating from film /*el count sirve para contar lo que le indiquemos*/
group by rating /*el group by sirve para agrupar, y el rating en este caso sirve para mostrar para 
que publico esta dirigido pero puede variar dependiendo de lo que pidamos*/



/*7*//*¿Cuántas películas hay en cada "categoría"?*/
select count(*)as cantPelis_x_category, c.name as category from film f  /*el "c.name" muestra los nombres que hay dentro de la categoria, 
si pusieramos "c.category_id"mostraria la id de los nombres*/
inner join film_category fc on f.film_id = fc.film_id
inner join category c on fc.category_id = c.category_id
group by c.category_id /*el group by agrupa lo que le indicamos, en este caso agrupo las id de las categorias 
y el count solo los cuenta*/

 

/*8*//*Cuales son los 10 actores/actrices que más aparecen en las películas*/
select count(*) AS cant_actor_x_peli, a.first_name, a.last_name from film f
inner join film_actor fa on f.film_id = fa.film_id
inner join actor a on fa.actor_id = a.actor_id
group by f.film_id
order by cant_actor_x_peli desc limit 10



/*9*//*¿Cuántos ejemplares (inventory) en total hay en cada local? Como no hay nombre del local, poner en su
lugar la dirección incluyendo ciudad y país además de la cantidad*/
select count(i.film_id), ad.address, ci.city, co.country from inventory i
INNER JOIN store st on i.store_id = st.store_id
INNER JOIN address ad on st.address_id = ad.address_id
INNER JOIN city ci on ad.city_id = ci.city_id
INNER JOIN country co on ci.country_id = co.country_id 
group by st.store_id 
/*en este caso al store lo pasamos por encima para poder llegar a las otras tablas como city, country*/
/*group by separa los grupos*/
/*ejemplares es una copia de peliculas*/ 



/*10*//*¿Cuántas películas distintas hay en cada local? Como no hay nombre del local, poner en su lugar la dirección incluyendo ciudad 
y país además de la cantidad*/
select count(DISTINCT i.film_id) as cant_peli_dist, ad.address, ci.city, co.country from film f
INNER JOIN inventory i on f.film_id = i.film_id
INNER JOIN store st on i.store_id = st.store_id
INNER JOIN address ad on st.address_id = ad.address_id
INNER JOIN city ci on ad.city_id = ci.city_id
INNER JOIN country co on ci.country_id = co.country_id 
group by st.store_id 
/*distic elige las peliculas repetidas y las devuelve una vez*/
/*count(distic....) si agregamos un count antes, cuenta las peliculas repetidas y nos devuelve un numero*/



/*11*//*Calcular el costo de alquiler promedio de las película de cada categoría.*/
select avg(rental_duration * rental_rate), c.name from film f 
INNER JOIN film_category fc on f.film_id = fc.film_id
INNER JOIN category c on fc.category_id = c.category_id
group by c.category_id
/*rental duration = duracion de alquiler*/
/*rental rate = precio del alquiler*/



/*12*//*De la película “ALABAMA DEVIL” mostrar de cada alquiler: el costo total, los días, costo por día,
el día que se alquiló y que día se devolvió ordenado por algún criterio a elección*/
select f.title, rental_duration*rental_rate as costo_total, rental_duration as dias, 
rental_rate as costo_x_dia, r.rental_date as dia_alquilado, r.return_date as dia_devuelto 
from film f
INNER JOIN inventory i on f.film_id = i.film_id
INNER JOIN rental r on i.inventory_id = r.inventory_id
WHERE f.title = "ALABAMA DEVIL";


/*13*//*Nombre, duración y categoria de todas las peliculas ordenados del más largo al más corto.*/
select f.title, f.rental_duration, c.category_id from film f
inner join film_category fc on f.film_id = fc.film_id
inner join category c on fc.category_id = c.category_id
order by f.rental_duration desc


/*14*//*Nombre de las peliculas que arranquen‘’w’’ con al menos 5 actores.*/
select f.title, count(fa.actor_id)as cant_actores from film f 
INNER JOIN film_actor fa on fa.film_id = f.film_id
WHERE f.title like "w%"
GROUP by f.film_id
HAVING cant_actores >= 5 


/*15*//*Calcular la suma total de los pagos (amount) con nombre y apellido de cada cliente.*/
select sum(amount) AS totalPrecio, c.first_name, c.last_name from payment p
inner join customer c on p.customer_id = c.customer_id
group by c.customer_id


/*16*//*Nombre de la pelicula, duración y nombre del actor de las peliculas más cortas*/
SELECT f.title as peli, f.length as duracion, a.first_name as actor from film f
inner join film_actor fa on f.film_id = fa.film_id
inner join actor a on fa.actor_id = a.actor_id
order by f.length desc


/*17*//*apellido del cliente con su ciudad, pais, direccion, sus alquileres y pagos,
ordenado los pagos de menor a mayor*/
select cu.last_name as apellido, ci.city, co.country, ad.address, pa.amount, re.rental_date  from customer cu
inner join address ad on cu.address_id = ad.address_id
inner join city ci on ad.city_id = ci.city_id
inner join country co on ci.country_id = co.country_id
inner join rental re on cu.customer_id = re.customer_id
inner join payment pa on cu.customer_id = pa.customer_id
group by cu.last_name
order by pa.amount asc


/*18*//**/
INSERT INTO actor(actor_id, first_name, last_name, last_update)
VALUES (201, 'Ariana', 'Villa', '2025-05-15 10:12:29');


/*19*//**/
INSERT INTO actor(actor_id, first_name, last_name, last_update)
VALUES (202, 'Ayelen', 'Quispe', '2025-05-15 10:12:29'),
	   (203, 'Rocio', 'Albarracin', '2025-05-15 10:12:29')



/*20*//**/
UPDATE actor
SET actor_id = 202 , first_name = 'AYELEN', last_name = 'QUISPE'
WHERE actor_id = 201;

UPDATE actor
SET actor_id = 203 , first_name = 'ROCIO', last_name = 'ALBARRACIN'
WHERE actor_id = 202;

UPDATE actor
SET actor_id = 201 , first_name = 'ARIANA', last_name = 'VILLA'
WHERE actor_id = 203;
/*tambien quise moficicar la id para que mi nombre sea 201 pero como la id es unica y no pude cambiarla, 
el profe dijo que la deje asi*/

UPDATE actor
SET first_name = 'AYELEN', last_name = 'QUISPE'
WHERE actor_id = 201;

UPDATE actor
SET first_name = 'ROCIO', last_name = 'ALBARRACIN'
WHERE actor_id = 202;

UPDATE actor
SET first_name = 'ARIANA', last_name = 'VILLA'
WHERE actor_id = 203;
/*sirve para modificar los nombres a mayuscula, la verdadera modificacion*/



/*21*//**/
DELETE from actor WHERE actor_id > 200







/*notas
6
select count(), f.raiting --dentro del parenteis hay que pasarle lo que quiero contar
from film f
group by rating
avg --calcula el promedio y pasa la columna
group by --hay que agrupar asi nos aparecen todas 
as sirve para renombrar columanas ejemplo select count (*) as cant_ciudades, co.country
from city c
inner join country co on c.country_id  = co.count
group by co.country
order by co.country desc  
*/




/*ejemplo 4*/
select fil.title, min(rental.return_date),
max(rental.return_date)
from rental 
inner join inventory