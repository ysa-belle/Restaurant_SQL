CREATE TABLE Supplier (
	sid INT PRIMARY KEY,
	name CHAR);

CREATE TABLE Sells (
	sid INT,
	ingredName INT,
	price INT,
	PRIMARY KEY (sid, ingredName),
	FOREIGN KEY (sid) REFERENCES Supplier,
	FOREIGN KEY (ingredName) REFERENCES Special Ingredient);

CREATE TABLE Special Special Ingredient(
	ingredName CHAR PRIMARY KEY,
	weight INT);

CREATE TABLE containsFoodItem (
	foodName CHAR,
	description CHAR,
	price INT,
	ingredName CHAR NOT NULL,
	order# INT,
	PRIMARY KEY (order#, foodName),
	FOREIGN KEY (order#) REFERENCES givesOrderOrder
ON DELETE CASCADE,
	FOREIGN KEY (ingredName) REFERENCES Ingredient);

CREATE TABLE Main (
	name CHAR PRIMARY KEY,
	nutritInfo CHAR);

CREATE TABLE Drink (
	name CHAR PRIMARY KEY,
	alcoholLv INT);

CREATE TABLE hasRestaurant (
	branch# INT PRIMARY KEY,
address CHAR,
emp# INT NOT NULL,
FOREIGN KEY (emp#) REFERENCES Manager);

CREATE TABLE Manager (
	name CHAR,
	emp# INT PRIMARY KEY,
salary INT);

CREATE TABLE Collects (
	emp# INT,
invoice# INT,
PRIMARY KEY (emp#, invoice#),
FOREIGN KEY (emp#) REFERENCES Manager,
FOREIGN KEY (invoice#) REFERENCES Bill);

CREATE TABLE Bill (
	date CHAR,
	addCharges INT,
	invoice# INT PRIMARY KEY);

CREATE TABLE Pays (
	invoice# INT,
	table# INT,
	PRIMARY KEY (invoice#, table#),
	FOREIGN KEY (invoice#) REFERENCES Bill,
	FOREIGN KEY (table#) REFERENCES Customer);

CREATE TABLE Customer (
	cname CHAR,
	table# INT PRIMARY KEY);

CREATE TABLE givesOrderOrder (
	order# INT PRIMARY KEY,
	emp# INT,
	table# INT,
	FOREIGN KEY (emp#) REFERENCES Waiter,
	UNIQUE table#);

CREATE TABLE Waiter (
	name CHAR,
	emp# INT PRIMARY KEY,
	wage INT);

CREATE TABLE Prepares (
	order# INT,
	emp# INT,
	PRIMARY KEY (order#, emp#)
	FOREIGN KEY (order#) REFERENCES givesOrderOrder,
	FOREIGN KEY (emp#) REFERENCES Chef);

CREATE TABLE Chef (
	name CHAR,
	emp# INT PRIMARY KEY,
	salary INT);
