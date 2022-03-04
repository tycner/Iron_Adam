-- 1. How many copies of the film Hunchback Impossible exist in the inventory system?
select count(inventory_id) as n_copies from sakila.inventory where film_id in 
(select film_id from sakila.film where title = "HUNCHBACK IMPOSSIBLE");

-- 2. List all films whose length is longer than the average of all the films.
select title, length from sakila.film where length in 
(select length from sakila.film where length > 
(select avg(length) from sakila.film));

-- 3. Use subqueries to display all actors who appear in the film Alone Trip.
select first_name, last_name from sakila.actor where actor_id in
(select actor_id from sakila.film_actor where film_id in 
(select film_id from sakila.film where title = "ALONE TRIP"));

-- 4. Identify all movies categorized as family films.
select title from sakila.film where film_id in 
(select film_id from sakila.film_category where category_id in
(select category_id from sakila.category where name = "Family"));

-- 5. Get name and email from customers from Canada using subqueries.
select first_name, last_name, email from sakila.customer where address_id in 
(select address_id from sakila.address where city_id in 
(select city_id from sakila.city where country_id in 
(select country_id from sakila.country where country = "Canada")));

-- 5. Do the same with joins
select first_name, last_name, email, country from sakila.customer as a
inner join sakila.address as b
on a.address_id = b.address_id
inner join sakila.city as c
on b.city_id = c.city_id
inner join sakila.country as d
on c.country_id = d.country_id
where country = "Canada";

-- 6. Which are films starred by the most prolific actor?
select title from sakila.film where film_id in 
(select film_id from sakila.film_actor where actor_id  = 
(select actor_id from sakila.film_actor
group by actor_id
order by count(actor_id) desc
limit 1));

-- 7. Films rented by most profitable customer
select title from sakila.film where film_id in 
(select film_id from sakila.inventory where inventory_id in 
(select inventory_id from sakila.rental where customer_id = 
-- most profitable customer:
(select customer_id from sakila.payment where amount in 
(select amount from sakila.payment)
group by customer_id
order by sum(amount) desc
limit 1)));

-- 8. Customers who spent more than the average payments.

select first_name, last_name from sakila.customer where customer_id in
(select customer_id from sakila.payment where amount in 
(select amount from sakila.payment where amount >
-- average payments:
(select avg(amount) from sakila.payment)));









-- select title, film_id from sakila.film where film_id in 
-- (select film_id from sakila.film_actor where actor_id in 
-- (select actor_id from sakila.actor)) 

