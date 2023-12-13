
-- How many actors are there with the last name ‘Wahlberg’?
select first_name, last_name
from actor
where last_name = 'Wahlberg';
-- answer = 2

-- How many payments were made between $3.99 and $5.99?
select count(amount)
from payment
where amount between 3.99 and 5.99;
-- answer = 0

-- What film does the store have the most of? (search in inventory)
select film_id, sum(film_id) 
from inventory
group by film_id
order by sum(film_id) desc;
--answer Zorro Ark film_id 1000 8,000 copies

--How many customers have the last name ‘William’?
select count(last_name)
from customers_index
where last_name = 'William';
-- answer = 0

--What store employee (get the id) sold the most rentals?
select staff_id, count(payment_id)
from payment
group by staff_id 
order by count(payment_id) desc;
-- answer = staff_id 2 (Jon) with 7,304 rentals

-- How many different district names are there?
select count(district)
from address;
-- answer = 603

-- What film has the most actors in it? (use film_actor table and get film_id)
select film_id, count(actor_id)
from film_actor
group by film_id
order by count(actor_id) desc;
-- answer = film_id 508 (Lambs Cincinatti) with 15 actor_id 's

-- From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
select count(last_name), store_id
from customer
where last_name like '_%es'
group by store_id;
-- answer = 13

-- How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
select amount, count(amount), customer_id 
from payment
where customer_id between 380 and 430
group by customer_id, amount
having count(amount) > 250 
order by amount desc;
-- answer = 0

-- Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
select rating, count(rating) 
from film
group by rating 
order by count(rating) desc;
--  answer = 5 rating catagories with PG-13 being at the top with 224 movies