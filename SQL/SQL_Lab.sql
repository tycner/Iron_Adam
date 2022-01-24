-- Select one column from the table. Get film titles
select title from sakila.film ;
-- Get unique list of film languages under the alias language
select distinct name as language from sakila.language ;
-- Find out how many stores does the company have?
select count(store_id) from sakila.store;
-- Find out how many employees staff does the company have?
select count(staff_id) from sakila.staff;
-- Return a list of employee first names only?
select first_name from sakila.staff

