-- 1. Write a query to display for each store its store ID, city, and country.
select store_id, city, country 
from sakila.store as a 
inner join sakila.address as b
on a.address_id = b.address_id
inner join sakila.city as c
on b.city_id = c.city_id
inner join sakila.country as d
on c.country_id = d.country_id; 

-- 2. Write a query to display how much business, in dollars, each store brought in
select a.store_id, sum(amount) as total_amount
from sakila.store as a 
inner join sakila.customer as b
on a.store_id = b.store_id
inner join sakila.payment as c
on b.customer_id = c.customer_id
group by a.store_id; 

-- 3. What is the average running time(length) of films by category?
select c.name, avg(length) as avg_length
from sakila.film as a
inner join sakila.film_category as b
on a.film_id = b.film_id
inner join sakila.category as c
on b.category_id = c.category_id
group by c.name;

-- 4. Which film categories are longest(length)? (Hint: You can rely on question 3 output.)
select c.name, avg(length) as avg_length
from sakila.film as a
inner join sakila.film_category as b
on a.film_id = b.film_id
inner join sakila.category as c
on b.category_id = c.category_id
group by c.name
order by avg_length desc
limit 3;

-- 5. Display the most frequently(number of times) rented movies in descending order.
select title, count(c.rental_id) as n_rentals
from sakila.film as a
inner join sakila.inventory as b
on a.film_id = b.film_id 
inner join sakila.rental as c
on b.inventory_id = c.inventory_id
group by title
order by n_rentals desc;

-- 6. List the top five genres in gross revenue in descending order.
select name, sum(amount) as gross_revenue
from sakila.category as a 
inner join sakila.film_category as b
on a.category_id = b.category_id
inner join sakila.inventory as c
on b.film_id = c.film_id
inner join sakila.rental as d
on c.inventory_id = d.inventory_id
inner join sakila.payment as e
on d.rental_id = e.rental_id
group by name
order by gross_revenue desc
limit 5;

-- 7. Is "Academy Dinosaur" available for rent from Store 1?
select c.store_id, title from
sakila.film as a
inner join sakila.inventory as b
on a.film_id = b.film_id
inner join sakila.store as c
on b.store_id = c.store_id
where title = "ACADEMY DINOSAUR" 
group by store_id
limit 1


