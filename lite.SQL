/*1*/
select f.title, ad.address, ci.city, co.country from film f
INNER JOIN inventory i on f.film_id = i.film_id
INNER JOIN store st on i.store_id = st.store_id
INNER JOIN address ad on st.address_id = ad.address_id
INNER JOIN city ci on ad.city_id = ci.city_id
INNER JOIN country co on ci.country_id = co.country_id 
WHERE f.title = "ANGELS LIFE";

/*2*/
select f.title, ad.address, ci.city, co.country from film f
INNER JOIN film_category fc on f.film_id = fc.film_id
INNER JOIN category ca on fc.category_id = ca.category_id


/*6*/
select count(*), rating from film /*el count sirve para contar lo que le indiquemos*/
group by rating /*el group by sirve para agrupar, y el rating en este caso sirve para mostrar para que publico esta dirigido pero puede variar dependiendo de lo que pidamos*/

/*7*/
select count(*), c.name from film f  /*el "c.name" muestra los nombres que hay dentro de la categoria, si pusieramos "c.category_id"mostraria la id de los nombres*/
inner join film_category fc on f.film_id = fc.film_id
inner join category c on fc.category_id = c.category_id
group by c.category_id /*el group by agrupa lo que le indicamos, en este caso agrupo las id de las categorias y el count solo los cuenta*/

/*8*/
select count(*) AS cant_actor_x_peli, a.first_name, a.last_name from film f
inner join film_actor fa on f.film_id = fa.film_id
inner join actor a on fa.actor_id = a.actor_id
group by f.film_id
order by cant_actor_x_peli desc limit 10

/*9*/



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






/*ejemplo 4*/
select fil.title, min(rental.return_date),
max(rental.return_date)
from rental 
inner join inventory