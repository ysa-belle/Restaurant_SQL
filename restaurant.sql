CREATE TABLE Supplier (
	sid INT PRIMARY KEY,
	name CHAR);

CREATE TABLE SpecialIngredient(
	ingredName CHAR PRIMARY KEY,
	weight INT);

CREATE TABLE Waiter (
	name CHAR,
	emp# INT PRIMARY KEY,
	wage INT);

CREATE TABLE Chef (
	name CHAR,
	emp# INT PRIMARY KEY,
	salary INT);

CREATE TABLE Manager (
	name CHAR,
	emp# INT PRIMARY KEY,
	salary INT);

CREATE TABLE Main (
	name CHAR PRIMARY KEY,
	nutritInfo CHAR);

CREATE TABLE Drink (
	name CHAR PRIMARY KEY,
	alcoholLv INT);

CREATE TABLE Bill (
	theDate DATE,
	addCharges INT,
	invoice# INT PRIMARY KEY);

CREATE TABLE Customer (
	cname CHAR,
	table# INT PRIMARY KEY);

CREATE TABLE Sells (
	sid INT,
	ingredName CHAR,
	price INT,
	PRIMARY KEY (sid, ingredName),
	FOREIGN KEY (sid) REFERENCES Supplier,
	FOREIGN KEY (ingredName) REFERENCES SpecialIngredient);

CREATE TABLE givesOrderOrder (
	order# INT PRIMARY KEY,
	emp# INT,
	table# INT,
	FOREIGN KEY (emp#) REFERENCES Waiter,
	UNIQUE (table#));

CREATE TABLE containsFoodItem (
	foodName CHAR,
	description CHAR,
	price INT,
	ingredName CHAR NOT NULL,
	order# INT,
	PRIMARY KEY (order#, foodName),
	FOREIGN KEY (order#) REFERENCES givesOrderOrder
		ON DELETE CASCADE,
	FOREIGN KEY (ingredName) REFERENCES SpecialIngredient);

CREATE TABLE hasRestaurant (
	branch# INT PRIMARY KEY,
	address CHAR,
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

CREATE TABLE Prepares (
	order# INT,
	emp# INT,
	PRIMARY KEY (order#, emp#),
	FOREIGN KEY (order#) REFERENCES givesOrderOrder,
	FOREIGN KEY (emp#) REFERENCES Chef);
