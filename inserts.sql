INSERT INTO Supplier VALUES (1234, 'Bobs food');
INSERT INTO Supplier VALUES (1235, 'Not Bobs food');
INSERT INTO Supplier VALUES (1236, 'Freds food');
INSERT INTO Supplier VALUES (1237, 'We Sell Cow');
INSERT INTO Supplier VALUES (1238, 'Vegetables Inc.');

INSERT INTO Manager VALUES ('Jim', 1233, 4000);
INSERT INTO Manager VALUES ('Jimmy', 55, 4000);
INSERT INTO Manager VALUES ('John', 66, 4000);
INSERT INTO Manager VALUES ('Johnny', 77, 4000);
INSERT INTO Manager VALUES ('Jason', 88, 4000);

INSERT INTO preparesOrder VALUES (112, 1333);
INSERT INTO preparesOrder VALUES (113, 1344);
INSERT INTO preparesOrder VALUES (114, 1355);
INSERT INTO preparesOrder VALUES (115, 1366);
INSERT INTO preparesOrder VALUES (116, 1377);

INSERT INTO Sells VALUES (1234, 'Chicken Wings', 199.99);
INSERT INTO Sells VALUES (1235, 'Pork Chops', 249.99);
INSERT INTO Sells VALUES (1236, 'Salmon', 329.49);
INSERT INTO Sells VALUES (1237, 'Ribeye', 399.99);
INSERT INTO Sells VALUES (1238, 'Broccoli', 429.19);

INSERT INTO Main VALUES ('Avocado Burger', '5000 calories');
INSERT INTO Main VALUES ('Fettuccine', '150 calories');
INSERT INTO Main VALUES ('cream pie', 'gluten free');
INSERT INTO Main VALUES ('garlic bread', 'protein free');
INSERT INTO Main VALUES ('pizza', 'gluten free');

INSERT INTO Collects VALUES (1233, 1);
INSERT INTO Collects VALUES (1233, 2);
INSERT INTO Collects VALUES (1233, 3);
INSERT INTO Collects VALUES (1233, 4);
INSERT INTO Collects VALUES (1233, 5);

INSERT INTO givesOrderOrder VALUES (112, 1433, 100);
INSERT INTO givesOrderOrder VALUES (112, 1433, 200);
INSERT INTO givesOrderOrder VALUES (112, 1433, 300);
INSERT INTO givesOrderOrder VALUES (112, 1466, 400);
INSERT INTO givesOrderOrder VALUES (112, 1477, 500);

INSERT INTO SpecialIngredient VALUES ('Chicken Wings', 50);
INSERT INTO SpecialIngredient VALUES ('Pork Chops', 40);
INSERT INTO SpecialIngredient VALUES ('Salmon', 60);
INSERT INTO SpecialIngredient VALUES ('Ribeye', 50);
INSERT INTO SpecialIngredient VALUES ('Broccoli', 80);

INSERT INTO Drink VALUES ('lady mary', 8);
INSERT INTO Drink VALUES ('gin gin', 20);
INSERT INTO Drink VALUES ('apple juice', 5);
INSERT INTO Drink VALUES ('coke', 0);
INSERT INTO Drink VALUES ('tiger bomb', 12);

INSERT INTO Pays VALUES (1, 100);
INSERT INTO Pays VALUES (2, 200);
INSERT INTO Pays VALUES (3, 300);
INSERT INTO Pays VALUES (4, 400);
INSERT INTO Pays VALUES (5, 500);

INSERT INTO Bill VALUES (2021-10-11, 20, 1);
INSERT INTO Bill VALUES (2021-10-11, 30, 2);
INSERT INTO Bill VALUES (2021-10-11, 20, 3);
INSERT INTO Bill VALUES (2021-10-11, 2, 4);
INSERT INTO Bill VALUES (2021-10-12, 20, 5);

INSERT INTO Waiter VALUES ('Da', 1433, 15);
INSERT INTO Waiter VALUES ('Da', 1444, 13);
INSERT INTO Waiter VALUES ('Da', 1455, 15);
INSERT INTO Waiter VALUES ('Da', 1466, 14);
INSERT INTO Waiter VALUES ('Da', 1477, 15);

INSERT INTO Chef VALUES ('Ca', 1333, 2000);
INSERT INTO Chef VALUES ('Ca', 1344, 3000);
INSERT INTO Chef VALUES ('Ca', 1355, 4000);
INSERT INTO Chef VALUES ('Ca', 1366, 3500);
INSERT INTO Chef VALUES ('Ca', 1377, 2500);

INSERT INTO hasRestaurant VALUES (11, 'happy rd', 1233);
INSERT INTO hasRestaurant VALUES (22, 'unhappy rd', 1233);
INSERT INTO hasRestaurant VALUES (33, 'sad rd', 1233);
INSERT INTO hasRestaurant VALUES (44, 'excited ave', 1233);
INSERT INTO hasRestaurant VALUES (55, 'angry rd', 1233);

INSERT INTO CustomerR1 VALUES ('Bob', 2, '1234567890');
INSERT INTO CustomerR1 VALUES ('Bobby', 2, '2345678901');
INSERT INTO CustomerR1 VALUES ('Bobbette', 3, '3456789012');
INSERT INTO CustomerR1 VALUES ('Bobnathon', 4, '4567890123');
INSERT INTO CustomerR1 VALUES ('Bobu', 5, '5678901234');

INSERT INTO CustomerR2 VALUES (100, 'Bob', '1234567890');
INSERT INTO CustomerR2 VALUES (200, 'Bobby', '2345678901');
INSERT INTO CustomerR2 VALUES (300, 'Bobbette', '3456789012');
INSERT INTO CustomerR2 VALUES (400, 'Bobnathon', '4567890123');
INSERT INTO CustomerR2 VALUES (500, 'Bobu', '5678901234');

INSERT INTO CustomerR3 VALUES ('Bob', 9:00:00, '1234567890');
INSERT INTO CustomerR3 VALUES ('Bobby', 9:00:00, '2345678901');
INSERT INTO CustomerR3 VALUES ('Bobbette', 9:00:00, '3456789012');
INSERT INTO CustomerR3 VALUES ('Bobnathon', 9:00:00, '4567890123');
INSERT INTO CustomerR3 VALUES ('Bobu', 10:00:00, '5678901234');

INSERT INTO containsFoodItemR1 VALUES ('bob wings', 'it has chicken');
INSERT INTO containsFoodItemR1 VALUES ('Steak', 'From a pig');
INSERT INTO containsFoodItemR1 VALUES ('baked salmon', 'fresh salmon');
INSERT INTO containsFoodItemR1 VALUES ('ribeye steak', 'it''s a cow');
INSERT INTO containsFoodItemR1 VALUES ('Jim''s surprise', 'salad');
INSERT INTO containsFoodItemR1 VALUES ('ribeye steak', 'it''s a cow');

INSERT INTO containsFoodItemR1 VALUES ('bob wings', 10, 112);
INSERT INTO containsFoodItemR1 VALUES ('Steak', 20, 113);
INSERT INTO containsFoodItemR1 VALUES ('baked salmon', 30, 114);
INSERT INTO containsFoodItemR1 VALUES ('ribeye steak', 20, 115);
INSERT INTO containsFoodItemR1 VALUES ('Jim''s surprise', 10, 116);
INSERT INTO containsFoodItemR1 VALUES ('ribeye steak', 20, 116);

INSERT INTO containsFoodItemR1 VALUES ('bob wings', 'Chicken Wings');
INSERT INTO containsFoodItemR1 VALUES ('Steak', 'Pork Chops');
INSERT INTO containsFoodItemR1 VALUES ('baked salmon', 'Salmon');
INSERT INTO containsFoodItemR1 VALUES ('ribeye steak', 'Ribeye');
INSERT INTO containsFoodItemR1 VALUES ('Jim''s surprise', 'Broccoli');
INSERT INTO containsFoodItemR1 VALUES ('ribeye steak', 'Ribeye');