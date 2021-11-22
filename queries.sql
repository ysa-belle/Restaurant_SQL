-- insert
INSERT INTO Supplier VALUES ('$b1', '$b2');
-- delete
DELETE FROM givesOrderOrder WHERE order# = '$res';
-- update
UPDATE Sells
SET price = '$res3'
WHERE sid = '$res1' AND ingredName = '$res2';
-- selection
-- projection
SELECT '$res' FROM Customer;
-- join
SELECT mname FROM Manager m, hasRestaurant hr WHERE m.empNum = hr.empNum AND branchNum= '$res';
-- Aggregation with Group By
-- Aggregation with Having
-- Nested Aggregation with Group By
-- Division