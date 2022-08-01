-- Might be missing some relations, but managed to built all tables
-- Code can be copied and verified on dbdiagram.io


CREATE TABLE `Actor` (
  `actor_id` smallint,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `last_update` varchar(255),
  PRIMARY KEY (`actor_id`)
);

CREATE TABLE `Country` (
  `country_id` smallint,
  `country` varchar(255),
  `last_update` timestamp,
  PRIMARY KEY (`country_id`)
);

CREATE TABLE `Film_Category` (
  `film_id` smallint,
  `category_id` tinyint,
  `last_update` timestamp,
  PRIMARY KEY (`film_id`)
);

CREATE TABLE `Category` (
  `category_id` varchar(255),
  `name` varchar(255),
  `last_update` timestamp,
  PRIMARY KEY (`category_id`)
);

CREATE TABLE `Film` (
  `film_id` smallint,
  `title` varchar(255),
  `description` text,
  `release_year` year,
  `language_id` tinyint,
  `original_language_id` tinyint,
  `rental_duration` tinyint,
  `rental_rate` decimal(4,2),
  `length` smallint,
  `replacement_cost` decimal(5,2),
  `rating` filme_rating_enum,
  `special_features` SET('Trailers','Commentaries','Deleted scenes','Behind the scenes'),
  `last_update` timestamp,
  PRIMARY KEY (`film_id`)
);

CREATE TABLE `Film_Actor` (
  `actor_id` smallint,
  `film_id` smallint,
  `last_update` timestamp,
  PRIMARY KEY (`actor_id`, `film_id`)
);

CREATE TABLE `Film_Text` (
  `film_id` smallint,
  `title` varchar(255),
  `description` text,
  PRIMARY KEY (`film_id`)
);

CREATE TABLE `Language` (
  `language_id` tinyint,
  `name` char,
  `last_update` timestamp,
  PRIMARY KEY (`language_id`)
);

CREATE TABLE `Address` (
  `address_id` smallint,
  `address` varchar(255),
  `address2` varchar(255),
  `distric` varchar(255),
  `city_id` smallint,
  `postal_code` varchar(255),
  `phone` varchar(255),
  `last_update` timestamp,
  PRIMARY KEY (`address_id`)
);

CREATE TABLE `Inventory` (
  `inventory_id` mediumint,
  `film_id` smallint,
  `store_id` tinyint,
  `last_update` timestamp,
  PRIMARY KEY (`inventory_id`)
);

CREATE TABLE `Customer` (
  `customer_id` smallint,
  `store_id` tinyint,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `email` varchar(255),
  `address_id` smallint,
  `active` boolean,
  `create_date` datetime,
  `last_update` timestamp,
  PRIMARY KEY (`customer_id`)
);

CREATE TABLE `City` (
  `city_id` smallint,
  `city` varchar(255),
  `country_id` smallint,
  `last_update` timestamp,
  PRIMARY KEY (`city_id`)
);

CREATE TABLE `Rental` (
  `rental_id` integer,
  `rental_date` datetime,
  `inventory_id` mediumint,
  `customer_id` smallint,
  `return_date` datetime,
  `staff_id` tinyint,
  `last_update` timestamp,
  PRIMARY KEY (`rental_id`)
);

CREATE TABLE `Store` (
  `store_id` tinyint,
  `manager_staff_id` tinyint,
  `address_id` smallint,
  `last_update` timestamp,
  PRIMARY KEY (`store_id`)
);

CREATE TABLE `Payment` (
  `payment_id` smallint,
  `customer_id` smallint,
  `staff_id` tinyint,
  `rental_id` integer,
  `amount` decimal(5,2),
  `payment_date` datetime,
  `last_update` timestamp,
  PRIMARY KEY (`payment_id`)
);

CREATE TABLE `Staff` (
  `staff_id` tinyint,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `address_id` smallint,
  `picture` blob,
  `email` varchar(255),
  `store_id` tinyint,
  `active` boolean,
  `username` varchar(255),
  `password` varchar(255),
  `last_update` timestamp,
  PRIMARY KEY (`staff_id`)
);

ALTER TABLE `Film_Actor` ADD FOREIGN KEY (`actor_id`) REFERENCES `Actor` (`actor_id`);

ALTER TABLE `Film` ADD FOREIGN KEY (`film_id`) REFERENCES `Film_Category` (`film_id`);

ALTER TABLE `Film_Category` ADD FOREIGN KEY (`category_id`) REFERENCES `Category` (`category_id`);

ALTER TABLE `Film` ADD FOREIGN KEY (`rental_rate`) REFERENCES `Country` (`country_id`);

ALTER TABLE `Language` ADD FOREIGN KEY (`name`) REFERENCES `Film_Actor` (`film_id`);

ALTER TABLE `Film` ADD FOREIGN KEY (`language_id`) REFERENCES `Language` (`language_id`);

ALTER TABLE `Film` ADD FOREIGN KEY (`film_id`) REFERENCES `Language` (`name`);

ALTER TABLE `Language` ADD FOREIGN KEY (`language_id`) REFERENCES `Film` (`original_language_id`);

ALTER TABLE `Film` ADD FOREIGN KEY (`film_id`) REFERENCES `Inventory` (`film_id`);

ALTER TABLE `Address` ADD FOREIGN KEY (`address_id`) REFERENCES `Customer` (`address_id`);

ALTER TABLE `Rental` ADD FOREIGN KEY (`inventory_id`) REFERENCES `Inventory` (`inventory_id`);

ALTER TABLE `Rental` ADD FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`);

ALTER TABLE `Store` ADD FOREIGN KEY (`store_id`) REFERENCES `Staff` (`store_id`);

ALTER TABLE `Payment` ADD FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`);

ALTER TABLE `Staff` ADD FOREIGN KEY (`staff_id`) REFERENCES `Rental` (`staff_id`);

ALTER TABLE `Store` ADD FOREIGN KEY (`address_id`) REFERENCES `Address` (`address_id`);
