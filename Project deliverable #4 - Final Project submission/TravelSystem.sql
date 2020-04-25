CREATE DATABASE IF NOT EXISTS `TravelSystem`;
USE `TravelSystem`;

DROP TABLE IF EXISTS `airline`;
CREATE TABLE airline(
`airline_id` varchar(5) NOT NULL,
primary key(`airline_id`));

DROP TABLE IF EXISTS `aircraft`;
CREATE TABLE aircraft(
`aircraft_id` varchar(5) NOT NULL,
primary key(`aircraft_id`));

DROP TABLE IF EXISTS `airport`;
CREATE TABLE airport(
`airport_id` varchar(5) NOT NULL,
primary key(`airport_id`));

DROP TABLE IF EXISTS `customerrep`;
CREATE TABLE customerrep(
`repuser` varchar(30) NOT NULL,
`reppass` varchar(30) NOT NULL,
primary key(`repuser`));

DROP TABLE IF EXISTS `admin`;
CREATE TABLE admin(
`adminuser` varchar(30) NOT NULL,
`adminpass` varchar(30) NOT NULL,
primary key(`adminuser`));

CREATE TABLE customer(
`username` varchar(30) NOT NULL,
`password` varchar(30) NOT NULL,
primary key(`username`));

CREATE TABLE tickets(
`username` varchar(30) NOT NULL,
`airline_id` varchar(5) NOT NULL,
`aircraft_id` varchar(5) NOT NULL,
`d_airport` varchar(5) NOT NULL,
`d_date` date NOT NULL,
`d_time` time NOT NULL,
`a_airport` varchar(5) NOT NULL,
`purchaseDT` varchar(50) NOT NULL,
`class` varchar(15) NOT NULL,
`fare` varchar(15) NOT NULL,
foreign Key (`username`) References TravelSystem.customer (`username`),
foreign Key (`airline_id`) References TravelSystem.flights (`airline_id`),
foreign Key (`aircraft_id`) References TravelSystem.flights (`aircraft_id`),
primary key (`username`,`purchaseDT`)
);

Drop Table If Exists `flights`;
CREATE TABLE flights(
`airline_id` varchar(5) NOT NULL,
`aircraft_id` varchar(5) NOT NULL,
`dep_date` date NOT NULL,
`dep_airport` varchar(5) NOT NULL,
`dep_time` time NOT NULL,
`arr_airport` varchar(5) NOT NULL,
`arr_time` time NOT NULL,
`type` varchar(30) NOT NULL,
`stops` int NOT NULL,
`econ_rate` int NOT NULL,
`bus_rate` int NOT NULL,
`first_rate` int NOT NULL,
foreign Key (`airline_id`) References TravelSystem.airline (`airline_id`),
foreign Key (`aircraft_id`) References TravelSystem.aircraft (`aircraft_id`),
primary key (`airline_id`, `aircraft_id`,`dep_date`)
);

CREATE TABLE waitinglist(
`username` varchar(30) NOT NULL,
`airline_id` varchar(5) NOT NULL,
`aircraft_id` varchar(5) NOT NULL,
`dep_date` date NOT NULL,
foreign key(`username`) References TravelSystem.customer(`username`),
primary key(`username`, `airline_id`, `aircraft_id`, `dep_date`)
);

ALTER TABLE `flights` 
ADD foreign Key (`arr_airport`) References TravelSystem.airport (`airport_id`)

