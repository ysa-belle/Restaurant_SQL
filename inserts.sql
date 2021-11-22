INSERT INTO Supplier VALUES (1234, 'Bobs food');
INSERT INTO Supplier VALUES (1235, 'Not Bobs food');
INSERT INTO Supplier VALUES (1236, 'Freds food');
INSERT INTO Supplier VALUES (1237, 'We Sell Cow');
INSERT INTO Supplier VALUES (1238, 'Vegetables Inc.');

INSERT INTO Main VALUES ('Avocado Burger', '5000 calories');
INSERT INTO Main VALUES ('Fettuccine', '150 calories');
INSERT INTO Main VALUES ('cream pie', 'gluten free');
INSERT INTO Main VALUES ('garlic bread', 'protein free');
INSERT INTO Main VALUES ('pizza', 'gluten free');

INSERT INTO SpecialIngredient VALUES ('Chicken Wings', 50);
INSERT INTO SpecialIngredient VALUES ('Pork Chops', 40);
INSERT INTO SpecialIngredient VALUES ('Salmon', 60);
INSERT INTO SpecialIngredient VALUES ('Ribeye', 50);
INSERT INTO SpecialIngredient VALUES ('Broccoli', 80);

INSERT INTO Chef VALUES ('Ca', 1333, 2000);
INSERT INTO Chef VALUES ('Ca', 1344, 3000);
INSERT INTO Chef VALUES ('Ca', 1355, 4000);
INSERT INTO Chef VALUES ('Ca', 1366, 3500);
INSERT INTO Chef VALUES ('Ca', 1377, 2500);

INSERT INTO Waiter VALUES ('Da', 1433, 15);
INSERT INTO Waiter VALUES ('Da', 1444, 13);
INSERT INTO Waiter VALUES ('Da', 1455, 15);
INSERT INTO Waiter VALUES ('Da', 1466, 14);
INSERT INTO Waiter VALUES ('Da', 1477, 15);

INSERT INTO Bill VALUES (TO_DATE('11/10/2021', 'DD/MM/YYYY'), 20, 1);
INSERT INTO Bill VALUES (TO_DATE('11/10/2021', 'DD/MM/YYYY'), 30, 2);
INSERT INTO Bill VALUES (TO_DATE('11/10/2021', 'DD/MM/YYYY'), 20, 3);
INSERT INTO Bill VALUES (TO_DATE('11/10/2021', 'DD/MM/YYYY'), 2, 4);
INSERT INTO Bill VALUES (TO_DATE('12/10/2021', 'DD/MM/YYYY'), 20, 5);

INSERT INTO Manager VALUES ('Jim', 1233, 4000);
INSERT INTO Manager VALUES ('Jimmy', 55, 4000);
INSERT INTO Manager VALUES ('John', 66, 4000);
INSERT INTO Manager VALUES ('Johnny', 77, 4000);
INSERT INTO Manager VALUES ('Jason', 88, 4000);

INSERT INTO Sells VALUES (1234, 'Chicken Wings', 199.99);
INSERT INTO Sells VALUES (1234, 'Pork Chops', 249.99);
INSERT INTO Sells VALUES (1236, 'Salmon', 329.49);
INSERT INTO Sells VALUES (1237, 'Ribeye', 399.99);
INSERT INTO Sells VALUES (1238, 'Broccoli', 429.19);

INSERT INTO Collects VALUES (1233, 1);
INSERT INTO Collects VALUES (1233, 2);
INSERT INTO Collects VALUES (1233, 3);
INSERT INTO Collects VALUES (1233, 4);
INSERT INTO Collects VALUES (1233, 5);

INSERT INTO Customer VALUES (100, 'Bob', '9:00', 2, '1234567890');
INSERT INTO Customer VALUES (200, 'Bobby', '9:00', 2, '2345678901');
INSERT INTO Customer VALUES (300, 'Bobbette', '9:00', 3, '3456789012');
INSERT INTO Customer VALUES (400, 'Bobnathon', '9:00', 4, '4567890123');
INSERT INTO Customer VALUES (500, 'Bobu', '10:00', 5, '5678901234');

INSERT INTO Drink VALUES ('lady mary', 8);
INSERT INTO Drink VALUES ('gin gin', 20);
INSERT INTO Drink VALUES ('apple juice', 5);
INSERT INTO Drink VALUES ('coke', 0);
INSERT INTO Drink VALUES ('tiger bomb', 12);

INSERT INTO Pays VALUES (1, 100, '9:00');
INSERT INTO Pays VALUES (2, 200, '9:00');
INSERT INTO Pays VALUES (3, 300, '9:00');
INSERT INTO Pays VALUES (4, 400, '9:00');
INSERT INTO Pays VALUES (5, 500, '10:00');

INSERT INTO hasRestaurant VALUES (11, 'happy rd', 1233);
INSERT INTO hasRestaurant VALUES (22, 'unhappy rd', 1233);
INSERT INTO hasRestaurant VALUES (33, 'sad rd', 1233);
INSERT INTO hasRestaurant VALUES (44, 'excited ave', 1233);
INSERT INTO hasRestaurant VALUES (55, 'angry rd', 1233);


INSERT INTO containsFoodItemR1 VALUES ('bob wings', 'it has chicken');
INSERT INTO containsFoodItemR1 VALUES ('Steak', 'From a pig');
INSERT INTO containsFoodItemR1 VALUES ('baked salmon', 'fresh salmon');
INSERT INTO containsFoodItemR1 VALUES ('ribeye steak', 'it''s a cow');
INSERT INTO containsFoodItemR1 VALUES ('Jim''s surprise', 'salad');

INSERT INTO containsFoodItemR3 VALUES ('bob wings', 'Chicken Wings');
INSERT INTO containsFoodItemR3 VALUES ('Steak', 'Pork Chops');
INSERT INTO containsFoodItemR3 VALUES ('baked salmon', 'Salmon');
INSERT INTO containsFoodItemR3 VALUES ('ribeye steak', 'Ribeye');
INSERT INTO containsFoodItemR3 VALUES ('Jim''s surprise', 'Broccoli');

INSERT INTO givesOrderOrder VALUES (112, 1433, 100, '9:00');
INSERT INTO givesOrderOrder VALUES (113, 1433, 200, '9:00');
INSERT INTO givesOrderOrder VALUES (114, 1433, 300, '9:00');
INSERT INTO givesOrderOrder VALUES (115, 1466, 400, '9:00');
INSERT INTO givesOrderOrder VALUES (116, 1477, 500, '10:00');

INSERT INTO containsFoodItemR2 VALUES ('bob wings', 10, 112);
INSERT INTO containsFoodItemR2 VALUES ('Steak', 20, 113);
INSERT INTO containsFoodItemR2 VALUES ('baked salmon', 30, 114);
INSERT INTO containsFoodItemR2 VALUES ('ribeye steak', 20, 115);
INSERT INTO containsFoodItemR2 VALUES ('Jim''s surprise', 10, 116);
INSERT INTO containsFoodItemR2 VALUES ('ribeye steak', 20, 116);

INSERT INTO Prepares VALUES (112, 1333);
INSERT INTO Prepares VALUES (113, 1344);
INSERT INTO Prepares VALUES (114, 1355);
INSERT INTO Prepares VALUES (115, 1366);
INSERT INTO Prepares VALUES (116, 1377);