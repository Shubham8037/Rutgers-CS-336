CREATE DATABASE IF NOT EXISTS `TravelSystem`;
USE `TravelSystem`;

CREATE TABLE users(
`username` varchar(30) 	NOT NULL,
`password` varchar(30) 	NOT NULL,
primary key(`username`));

INSERT INTO `users` VALUES ('Test123' , 'testabc'),('Trialabc' , 'testabc');

