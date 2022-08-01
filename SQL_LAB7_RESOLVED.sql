use sakila;

-- 1. Drop column picture from staff.

alter table staff
drop column picture;

select * from staff;

-- 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.

select * from customer
where first_name = 'TAMMY';

select * from staff;

insert into staff(first_name, last_name, email, address_id, store_id, username)
values('TAMMY', 'SANDERS', 'TAMMY.SANDERS@sakilacustomer.org', 79, 2, 'Tammy');

select * from staff;

-- 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
-- You can use current date for the rental_date column in the rental table.
-- Hint: Check the columns in the table rental and see what information you would need to add there. 
-- You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
select customer_id from customer                  -- HINT
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

show columns from rental;

select customer_id from customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

select current_date from rental;

select rental_id from rental;

select inventory_id from rental;

select inventory_id from rental;

select staff_id from rental;

select max(rental_id) from rental;

insert into rental (rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
values (curdate(),"2", 130 , curdate() + 5, 2, curdate());

select * from rental where customer_id = 130;

-- Use dbdiagram.io or draw.io to propose a new structure for the Sakila database.
-- Define primary keys and foreign keys for the new database.

-- DIAGRAM built in dbdiagram.io and uploaded to Github with file name Sakila.sql
-- Code can be copied and verified on dbdiagram.io