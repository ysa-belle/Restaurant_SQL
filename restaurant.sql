
drop table Supplier cascade constraints;
drop table Sells cascade constraints;
drop table SpecialIngredient cascade constraints;
drop table containsFoodItem cascade constraints;
drop table Main cascade constraints;
drop table Drink cascade constraints;
drop table hasRestaurant cascade constraints;
drop table Manager cascade constraints;
drop table Collects cascade constraints;
drop table Bill cascade constraints;
drop table Pays cascade constraints;
drop table Customer cascade constraints;
drop table givesOrderOrder cascade constraints;
drop table Waiter cascade constraints;
drop table PreparesOrder cascade constraints;
drop table Chef cascade constraints;

/*
*/

CREATE TABLE Supplier (
	sid INT PRIMARY KEY,
	name CHAR(80));

CREATE TABLE SpecialIngredient(
	ingredName CHAR(80) PRIMARY KEY,
	weight INT);

CREATE TABLE Waiter (
	name CHAR(80),
	emp# INT PRIMARY KEY,
	wage INT);

CREATE TABLE Chef (
	name CHAR(80),
	emp# INT PRIMARY KEY,
	salary INT);

CREATE TABLE Manager (
	name CHAR(80),
	emp# INT PRIMARY KEY,
	salary INT);

CREATE TABLE Main (
	name CHAR(80) PRIMARY KEY,
	nutritInfo CHAR(80));

CREATE TABLE Drink (
	name CHAR(80) PRIMARY KEY,
	alcoholLv INT);

CREATE TABLE Bill (
	theDate DATE,
	addChar(80)ges INT,
	invoice# INT PRIMARY KEY);

-- CREATE TABLE Customer (
-- 	table# INT PRIMARY KEY,
-- 	cname CHAR(80),
-- 	startTime TIME,
-- 	groupSize INT,
-- 	phone# CHAR(20));

CREATE TABLE Sells (
	sid INT,
	ingredName CHAR(80),
	price FLOAT,
	PRIMARY KEY (sid, ingredName),
	FOREIGN KEY (sid) REFERENCES Supplier,
	FOREIGN KEY (ingredName) REFERENCES SpecialIngredient);

CREATE TABLE givesOrderOrder (
	order# INT PRIMARY KEY,
	emp# INT,
	table# INT,
	FOREIGN KEY (emp#) REFERENCES Waiter,
	UNIQUE (table#));

-- CREATE TABLE containsFoodItem (
-- 	foodName CHAR(80),
-- 	description CHAR(80),
-- 	price INT,
-- 	ingredName CHAR(80) NOT NULL,
-- 	order# INT,
-- 	PRIMARY KEY (order#, foodName),
-- 	FOREIGN KEY (order#) REFERENCES givesOrderOrder
-- 		ON DELETE CASCADE,
-- 	FOREIGN KEY (ingredName) REFERENCES SpecialIngredient);

CREATE TABLE hasRestaurant (
	branch# INT PRIMARY KEY,
	address CHAR(80),
	emp# INT NOT NULL,
	FOREIGN KEY (emp#) REFERENCES Manager);

CREATE TABLE Collects (
	emp# INT,
	invoice# INT,
	PRIMARY KEY (emp#, invoice#),
	FOREIGN KEY (emp#) REFERENCES Manager,
	FOREIGN KEY (invoice#) REFERENCES Bill);

CREATE TABLE Pays (
	invoice# INT,
	table# INT,
	PRIMARY KEY (invoice#, table#),
	FOREIGN KEY (invoice#) REFERENCES Bill,
	FOREIGN KEY (table#) REFERENCES Customer);

CREATE TABLE PreparesOrder (
	order# INT,
	emp# INT,
	PRIMARY KEY (order#, emp#),
	FOREIGN KEY (order#) REFERENCES givesOrderOrder,
	FOREIGN KEY (emp#) REFERENCES Chef);


CREATE TABLE CustomerR1 (
	cname CHAR(80) PRIMARY KEY,
	groupSize INT,
	phone# CHAR(20),
	PRIMARY KEY (cname, phone#));

CREATE TABLE CustomerR2 (
	table# INT PRIMARY KEY,
	cname CHAR(80),
	phone# CHAR(20));

CREATE TABLE CustomerR3 (
	startTime# TIME,
	cname CHAR(80),
	phone# CHAR(20)
	PRIMARY KEY (cname, phone#));

CREATE TABLE containsFoodItemR1 (
	foodName CHAR(80) PRIMARY KEY,
	description CHAR(200));

CREATE TABLE containsFoodItemR2 (
	foodName CHAR(80),
	price FLOAT,
	order# INT,
	PRIMARY KEY (foodName, order#),
	FOREIGN KEY (order#) REFERENCES givesOrderOrder)

CREATE TABLE containsFoodItemR3 (
	foodName CHAR(80) PRIMARY KEY,
	ingredName CHAR(80),
	FOREIGN KEY (ingredName) REFERENCES SpecialIngredient);




