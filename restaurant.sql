
drop table Supplier cascade constraints;
drop table Sells cascade constraints;
drop table SpecialIngredient cascade constraints;
-- drop table containsFoodItem cascade constraints;
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
drop table Prepares cascade constraints;
drop table Chef cascade constraints;
-- drop table CustomerR1 cascade constraints;
-- drop table CustomerR2 cascade constraints;
-- drop table CustomerR3 cascade constraints;
drop table containsFoodItemR2 cascade constraints;
drop table containsFoodItemR1 cascade constraints;
drop table containsFoodItemR3 cascade constraints;

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
	empNum INT PRIMARY KEY,
	wage INT);

CREATE TABLE Chef (
	name CHAR(80),
	empNum INT PRIMARY KEY,
	salary INT,
	YearsOfExp INT);

CREATE TABLE Manager (
	mname CHAR(80),
	empNum INT PRIMARY KEY,
	salary INT);

CREATE TABLE Main (
	name CHAR(80) PRIMARY KEY,
	nutritInfo CHAR(80));

CREATE TABLE Drink (
	name CHAR(80) PRIMARY KEY,
	alcoholLv INT);

CREATE TABLE Bill (
	theDate DATE,
	addCharges INT,
	invoiceNum INT PRIMARY KEY);

CREATE TABLE Sells (
	sid INT,
	ingredName CHAR(80),
	price FLOAT,
	PRIMARY KEY (sid, ingredName),
	FOREIGN KEY (sid) REFERENCES Supplier,
	FOREIGN KEY (ingredName) REFERENCES SpecialIngredient);

CREATE TABLE givesOrderOrder (
	orderNum INT PRIMARY KEY,
	empNum INT,
	tableNum INT,
    startTime CHAR(5),
	FOREIGN KEY (empNum) REFERENCES Waiter,
	UNIQUE (tableNum, startTime));

-- CREATE TABLE containsFoodItem (
-- 	foodName CHAR(80),
-- 	description CHAR(80),
-- 	price INT,
-- 	ingredName CHAR(80) NOT NULL,
-- 	orderNum INT,
-- 	PRIMARY KEY (orderNum, foodName),
-- 	FOREIGN KEY (orderNum) REFERENCES givesOrderOrder
-- 		ON DELETE CASCADE,
-- 	FOREIGN KEY (ingredName) REFERENCES SpecialIngredient);

CREATE TABLE hasRestaurant (
	branchNum INT PRIMARY KEY,
	address CHAR(80),
	empNum INT NOT NULL,
	FOREIGN KEY (empNum) REFERENCES Manager);

CREATE TABLE Collects (
	empNum INT,
	invoiceNum INT,
	PRIMARY KEY (empNum, invoiceNum),
	FOREIGN KEY (empNum) REFERENCES Manager,
	FOREIGN KEY (invoiceNum) REFERENCES Bill);

    
CREATE TABLE Customer (
	tableNum INT,
	cname CHAR(80),
	startTime CHAR(5),
	groupSize INT,
	phoneNum CHAR(20),
    PRIMARY KEY (tableNum, startTime));

-- CREATE TABLE CustomerR1 (
-- 	cname CHAR(80),
-- 	groupSize INT,
-- 	phoneNum CHAR(20),
-- 	PRIMARY KEY (cname, phoneNum));

-- CREATE TABLE CustomerR2 (
-- 	tableNum INT PRIMARY KEY,
-- 	cname CHAR(80),
-- 	phoneNum CHAR(20));

-- CREATE TABLE CustomerR3 (
-- 	cname CHAR(80),
-- 	startTime CHAR(5),
-- 	phoneNum CHAR(20),
-- 	PRIMARY KEY (cname, phoneNum));

CREATE TABLE Pays (
	invoiceNum INT,
	tableNum INT,
    startTime CHAR(5),
	PRIMARY KEY (invoiceNum, tableNum, startTime),
	FOREIGN KEY (invoiceNum) REFERENCES Bill,
	FOREIGN KEY (tableNum, startTime) REFERENCES Customer);

CREATE TABLE Prepares (
	orderNum INT,
	empNum INT,
	PRIMARY KEY (orderNum, empNum),
	FOREIGN KEY (orderNum) REFERENCES givesOrderOrder ON DELETE CASCADE,
	FOREIGN KEY (empNum) REFERENCES Chef);


CREATE TABLE containsFoodItemR1 (
	foodName CHAR(80) PRIMARY KEY,
	description CHAR(200));

CREATE TABLE containsFoodItemR2 (
	foodName CHAR(80),
	price FLOAT,
	orderNum INT,
	PRIMARY KEY (foodName, orderNum),
	FOREIGN KEY (orderNum) REFERENCES givesOrderOrder ON DELETE CASCADE);

CREATE TABLE containsFoodItemR3 (
	foodName CHAR(80) PRIMARY KEY,
	ingredName CHAR(80),
	FOREIGN KEY (ingredName) REFERENCES SpecialIngredient);




