select f.title, ad.address, ci.city, co.country from film f
INNER JOIN inventory i on f.film_id = i.film_id
INNER JOIN store st on i.store_id = st.store_id
INNER JOIN address ad on st.address_id = ad.address_id
INNER JOIN city ci on ad.city_id = ci.city_id
INNER JOIN country co on ci.country_id = co.country_id 
WHERE f.title = "ANGELS LIFE";


select f.title, ad.address, ci.city, co.country from film f
INNER JOIN film_category fc on f.film_id = fc.film_id
INNER JOIN category ca on fc.category_id = ca.category_id